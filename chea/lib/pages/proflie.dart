// ignore_for_file: curly_braces_in_flow_control_structures
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:chea/utils/bottom_navbar.dart';
import 'package:chea/utils/cheagpt.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/auth_service.dart';

int defaultBackground = 0xff09050d;


class UserService {
  static const String url = 'http://10.0.2.2:8000/users/data/';

  Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token == null) return null;
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Authorization': 'Token $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      return null;
    }
  }



  Future<void> performLogout(BuildContext context) async {
    await AuthService().logout();
    Navigator.of(context).pushNamedAndRemoveUntil('/logout', (route) => false);
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserService userService = UserService();
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  String name = 'Steve';
  String email = '22b441@iitb.ac.in';
  String rollNumber = '';
  bool isPage1ResumeUploaded = false;
  bool isPage2ResumeUploaded = false;

  Future<void> getUserData() async {
    userData = await userService.getUserData();
    if (userData != null) {
      setState(() {
        name = userData!['name'] ?? 'Aditya';
        email = userData!['email'] ?? '23b0443@iitb.ac.in';
        rollNumber = userData!['roll_no'] ?? '23b0443';
        isPage1ResumeUploaded = userData!['resume1'] != null;
        isPage2ResumeUploaded = userData!['resume2'] != null;
      });
    } else {
      print('Error fetching user data');
    }
  }

  Future<void> _uploadFile(String resumeType,File file) async{
    final token = await AuthService().getToken();
    String url = 'http://10.0.2.2:8000/users/$resumeType/';
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Authorization'] = 'Token $token';
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    final response = await request.send();
    if(response.statusCode == 200){
      setState(() {
        if(resumeType == 'resume1'){
          isPage1ResumeUploaded = true;
        }else{
          isPage2ResumeUploaded = true;
        }
      });
    }
  }

  Future<void> _pickAndUploadResume(String resumeType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      await _uploadFile(resumeType,file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Color(defaultBackground),
      floatingActionButton: ChEAGPT(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: 3,
        onItemTapped: (int index) {
          if (index == 1) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/blog', (route) => false);
          } else if (index == 2)
            Navigator.pushNamedAndRemoveUntil(
                context, '/opportunities', (route) => false);
          else if (index == 0)
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
        },
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 75),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15),
            child: RichText(
              text: TextSpan(
                  text: 'Welcome, ',
                  style: GoogleFonts.nunitoSans(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                      text: name,
                      style: GoogleFonts.nunitoSans(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              email,
              style: GoogleFonts.nunitoSans(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Resumes',
              style: GoogleFonts.nunitoSans(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: const Color(0xff3c3838),
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color(0xff3c3838),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.file_copy_outlined,
                          color: Colors.white,
                          size: 20,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1 Page Resume',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Sign in with your one \npage resume here',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xff666161),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if(!isPage1ResumeUploaded)
                              _pickAndUploadResume('resume1');
                          });
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: isPage1ResumeUploaded
                                  ? const Color(0xff3c3838)
                                  : null,
                              borderRadius: BorderRadius.circular(15),
                              gradient: !isPage1ResumeUploaded
                                  ? const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffFF7A00),
                                        Color(0xffD45151)
                                      ],
                                    )
                                  : null),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10),
                            child: Text(
                              isPage1ResumeUploaded ? 'Uploaded' : "Upload",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ))
                  ],
                )),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: const Color(0xff3c3838),
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color(0xff3c3838),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.file_copy_outlined,
                          color: Colors.white,
                          size: 20,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2 Page Resume',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Sign in with your one \npage resume here',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xff666161),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if(!isPage2ResumeUploaded)
                              _pickAndUploadResume('resume2');
                          });
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: isPage2ResumeUploaded
                                  ? const Color(0xff3c3838)
                                  : null,
                              borderRadius: BorderRadius.circular(15),
                              gradient: !isPage2ResumeUploaded
                                  ? const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffFF7A00),
                                        Color(0xffD45151)
                                      ],
                                    )
                                  : null),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10),
                            child: Text(
                              isPage2ResumeUploaded ? 'Uploaded' : "Upload",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ))
                  ],
                )),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: const Color(0xff3c3838),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saved',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xff201f1f)),
                              child: const Icon(
                                Icons.favorite,
                                color: Color(0xffd45151),
                                size: 30,
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/favopportunities');
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Favourite Opportunities',
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 60.0),
                        child: Divider(
                          color: Color(0xff3c3838),
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xff201f1f)),
                              child: const Icon(
                                Icons.bookmark_border,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/bookmarks');
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Bookmarked Articles',
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 25,
                  child: Container(
                    height: 50,
                    width: 10,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.amber[900],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: const Color(0xff3c3838),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'More',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xff201f1f)),
                              child: const Icon(
                                Icons.settings,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Settings',
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 60.0),
                        child: Divider(
                          color: Color(0xff3c3838),
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xff201f1f)),
                              child: const Icon(
                                Icons.login,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    userService.performLogout(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Log Out',
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 25,
                  child: Container(
                    height: 50,
                    width: 10,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.amber[900],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      )),
    );
  }
}
