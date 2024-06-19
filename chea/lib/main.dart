// ignore_for_file: prefer_const_constructors, sort_child_properties_last, camel_case_types

import 'package:chea/pages/Opportunities.dart';
import 'package:chea/pages/blogs.dart';
import 'package:chea/pages/cheagpt.dart';
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
import 'package:chea/pages/home.dart';
import 'package:chea/pages/links.dart';
import 'package:chea/pages/proflie.dart';
import 'package:chea/pages/publication.dart';
import 'package:flutter/material.dart';

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
      home: Home(),
      routes: {
        '/home': (context) => const Home(),
        '/events': (context) => const Events(),
        '/blog': (context) => const Blog(),
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
      },
    );
  }
}
