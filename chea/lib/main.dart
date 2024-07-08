// ignore_for_file: prefer_const_constructors, sort_child_properties_last, camel_case_types
import 'package:chea/pages/blogs.dart';
import 'package:chea/pages/blogs_pages/blogPage.dart';
import 'package:chea/pages/blogs_pages/internblog.dart';
import 'package:chea/pages/cheagpt.dart';
import 'package:chea/pages/contact_us.dart';
import 'package:chea/pages/event_pages/alumni_reunion.dart';
import 'package:chea/pages/event_pages/convocation.dart';
import 'package:chea/pages/event_pages/core_talks.dart';
import 'package:chea/pages/event_pages/department_trip.dart';
import 'package:chea/pages/event_pages/freshie_oreo.dart';
import 'package:chea/pages/event_pages/know_your_profs.dart';
import 'package:chea/pages/event_pages/miscellaneous.dart';
import 'package:chea/pages/event_pages/panel_discussion.dart';
import 'package:chea/pages/event_pages/sport_event.dart';
import 'package:chea/pages/event_pages/time_capsule.dart';
import 'package:chea/pages/event_pages/trad_day.dart';
import 'package:chea/pages/event_pages/valfi.dart';
import 'package:chea/pages/events.dart';
import 'package:chea/pages/facads.dart';
import 'package:chea/pages/home.dart';
import 'package:chea/pages/links.dart';
import 'package:chea/pages/opportunities.dart';
import 'package:chea/pages/profilePage/BookmarkedArticles.dart';
import 'package:chea/pages/profilePage/FavOpportunities.dart';
import 'package:chea/pages/proflie.dart';
import 'package:chea/pages/publication.dart';
import 'package:flutter/material.dart';
import 'package:chea/Screens/Welcome/welcome_screen.dart';
import 'package:chea/constants.dart';

int defaultBackground = 0xff08050c;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChEA',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: const WelcomeScreen(),
      routes: {
        '/home': (context) => const Home(),
        '/events': (context) => const Events(),
        '/blog': (context) => InternBlog(),
        '/profile': (context) => const Profile(),
        '/opportunities': (context) => const Opportunities(),
        '/ai': (context) => const ChEAGPT(),
        '/timecapsule': (context) => TimeCapsule(),
        '/valfi': (context) => Valfi(),
        '/freshieorientation': (context) => FreshieOrientation(),
        '/knowyourprofs': (context) => knowYourProf(),
        '/traditionalday': (context) => TradDay(),
        '/coretalks': (context) => CoreTalk(),
        '/departmenttrips': (context) => DepartmentTrip(),
        '/sportevents': (context) => SportEvent(),
        '/paneldiscussions': (context) => PanelDiscussion(),
        '/alumnirenuion': (context) => AlumniReunion(),
        '/convocation': (context) => Convocation(),
        '/miscellaneousevents': (context) => Miscellaneous(),
        '/publication': (context) => const Publication(),
        '/link': (context) => const Link(),
        '/facads': (context) => const FacAd(),
        '/contactus': (context) => const ContactUs(),
        '/internblog': (context) =>  InternBlog(),
        '/bookmarks': (context) => const BookmarkedArticles(),
        '/favopportunities': (context) => const Favopportunities(),
      },
    );
  }
}

// filter - by roles, by stipend - slider, location
