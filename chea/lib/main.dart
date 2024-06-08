// ignore_for_file: prefer_const_constructors, sort_child_properties_last, camel_case_types

import 'package:chea/pages/home.dart';
import 'package:chea/utils/appbar.dart';
import 'package:chea/utils/bottom_navbar.dart';
import 'package:chea/utils/side_navbar.dart';
import 'package:flutter/material.dart';

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
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(canvasColor: Color(0xff1a1818)),
        title: 'ChEA',
        home: Scaffold(
            backgroundColor: Color(defaultBackground),
            appBar: appbar(),
            body: MyNavigationBar(),
            //Navigation Drawer
            endDrawer: buildDrawer(width: width)));
    // floatingActionButtonLocation:
    //     FloatingActionButtonLocation.centerDocked,
    // floatingActionButton: ChEA_GPT(),
    // bottomNavigationBar: navbar()));
  }
}
