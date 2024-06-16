// ignore_for_file: prefer_const_constructors, sort_child_properties_last, camel_case_types

import 'package:chea/pages/Opportunities.dart';
import 'package:chea/pages/blogs.dart';
import 'package:chea/pages/cheagpt.dart';
import 'package:chea/pages/event_pages/freshie_oreo.dart';
import 'package:chea/pages/event_pages/time_capsule.dart';
import 'package:chea/pages/event_pages/valfi.dart';
import 'package:chea/pages/events.dart';
import 'package:chea/pages/home.dart';
import 'package:chea/pages/proflie.dart';
// import 'package:chea/utils/side_navbar.dart';
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
      },
    );
  }
}
