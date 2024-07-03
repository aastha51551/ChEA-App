from django.shortcuts import redirect
from django.http import JsonResponse
from django.contrib.auth.models import User
# from django.conf import settings
import requests
from base64 import b64encode
from .models import UserToken
import backend.settings as settings

def login(request):
    authorize_url = f"https://gymkhana.iitb.ac.in/profiles/oauth/authorize/?client_id={settings.CLIENT_ID}&response_type=code&redirect_uri={settings.REDIRECT_URI}&scope=basic"
    return redirect(authorize_url)

def getUserInfo(access_token):
    user_url = "https://gymkhana.iitb.ac.in/profiles/api/user/?fields="+settings.FIELDS
    headers = {"Authorization": f"Bearer {access_token}"}
    try:
        response = requests.get(user_url, headers=headers)
        response.raise_for_status()  # Check for HTTP errors.
        return response.json()
    except requests.exceptions.HTTPError as e:
        # Log the error or return a detailed message for debugging
        print(f"HTTP Error: {e}")
        return JsonResponse({'error': 'Failed to retrieve user info', 'details': str(e)}, status=500)
    except ValueError:
        # This catches JSON decoding errors
        print("Response content is not valid JSON")
        return JsonResponse({'error': 'User info endpoint did not return valid JSON'}, status=500)


def authenticate(user_info):
    if 'username' not in user_info:
        # Handle the missing key, e.g., log an error, return an error response, etc.
        print("Error: 'username' key is missing in user_info.")
        return None  # Or handle as appropriate for your application

    username = user_info['username']
    user, created = User.objects.get_or_create(username=username,
            defaults={
            'email': user_info['email'],
            'first_name': user_info['first_name'],
            'last_name': user_info['last_name'],
        }
    )
    return user
    
    
def storeToken(user, token_data):
    if user is None:
        print("Error: Attempted to store token for a None user.")
        return  # Exit the function early
    UserToken.objects.update_or_create(
        user=user,
        defaults={
            'access_token': token_data['access_token'],
            'refresh_token': token_data['refresh_token'],
            'expires_in': token_data['expires_in'],
            'scope': token_data['scope'],
        }
    )

def callback(request):
    code = request.GET.get('code')
    state = request.GET.get('state')
    
    if 'error' in request.GET:
        return JsonResponse({'error': request.GET['error']})
    token_url = "https://gymkhana.iitb.ac.in/profiles/oauth/token/"
    data = {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': settings.REDIRECT_URI,
    }
    headers = {
        "Authorization": f"Basic {b64encode(f'{settings.CLIENT_ID}:{settings.CLIENT_SECRET}'.encode()).decode()}",
        "Content-Type":"application/x-www-form-urlencoded"
    }
    try:
        response = requests.post(token_url, data=data, headers=headers)
        response.raise_for_status()  # Raises stored HTTPError, if one occurred.
        token_data = response.json()
    except requests.exceptions.HTTPError as e:
        return JsonResponse({'error': 'Failed to retrieve token', 'details': str(e)})
    except ValueError:  # Includes simplejson.decoder.JSONDecodeError
        return JsonResponse({'error': 'Invalid response received from token endpoint'})

    try:
        user_info = getUserInfo(token_data['access_token'])
    except ValueError:  # Assuming getUserInfo also uses response.json() internally
        return JsonResponse({'error': 'Invalid response received from user info endpoint'})
    user = authenticate(user_info)
    if user is None:
        return JsonResponse({'error': 'Authentication failed, user is None'})
    storeToken(user, token_data)
    login(request, user)
    
    return JsonResponse({'message': 'success'})