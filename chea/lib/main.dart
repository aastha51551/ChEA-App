// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    const List<Map<String, String>> Opportunities = [
      {
        'title': 'Internship',
        'provider': 'BASF, GER',
        'timePosted': '2 days ago'
      },
      {
        'title': 'Project',
        'provider': 'Prof. Rochish',
        'timePosted': '5 days ago'
      },
      {'title': 'Internship', 'provider': 'Shell', 'timePosted': '1 week ago'}
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ChEA',
        home: Scaffold(
          backgroundColor: Color(defaultBackground),
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Color(defaultBackground),
            elevation: 0,
            leading: SvgPicture.asset(
              'assets/icons/logo.svg',
              height: 50,
              width: 50,
            ),
            title: const Text('ChEA',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center),
          ),
          body: Column(
            children: [
              opportunities(Opportunities), //Opportunitites Section
              //What's Happening Section
              Container(
                  width: width,
                  color: Color(defaultBackground),
                  child: const Column(children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "WHAT'S HAPPEING",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ])),
              Container(
                color: Color(defaultBackground),
                height: height * 0.3,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 250,
                              child: Center(
                                  child: Text(
                                'Trad Day',
                                style: TextStyle(
                                  fontSize: 32,
                                ),
                              )),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[500]))),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 250,
                              child: Center(
                                  child: Text(
                                'Dept Trip',
                                style: TextStyle(
                                  fontSize: 32,
                                ),
                              )),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[500])))
                    ],
                  ),
                ),
              ),
            ],
          ),
          //Navigation Drawer
          endDrawer: Drawer(
              backgroundColor: Colors.black,
              width: width * 0.6,
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.menu, color: Colors.white, size: 42),
                    title: Text('Menu',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.w800)),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_month, color: Colors.white),
                    title: Text('Events',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  ),
                  ListTile(
                    leading: Icon(Icons.book, color: Colors.white),
                    title: Text('Publications',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  ),
                  ListTile(
                    leading: Icon(Icons.link, color: Colors.white),
                    title: Text('Links',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.people,
                      color: Colors.white,
                    ),
                    title: Text('FacAds',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone_outlined, color: Colors.white),
                    title: Text('Contact Us',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              )),
        ));
  }
}

Container opportunities(List<Map<String, String>> Opportunities) {
  return Container(
    color: Color(defaultBackground),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            'YOUR OPPORTUNITITES',
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: SizedBox(
            height: 185,
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: Opportunities.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: _opportunities(Opportunities[index]),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _opportunities(Map<String, String> Opportunitiy) {
  return Container(
    width: 225,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40), color: Color(0xff201F1F)),
    child: Column(
      children: [
        SizedBox(
          width: 225,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 8.0, top: 15.0, bottom: 0.0),
            child: Text(
              Opportunitiy['title'] ?? 'Not Defined',
              // style: TextStyle(

              //     color: Colors.grey[400],
              //     fontSize: 20,
              //     fontWeight: FontWeight.w800,
              //     fontStyle: FontStyle.italic),
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Color(0xff666161)),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Container(
          width: 225,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              Opportunitiy['provider'] ?? 'Not Defined',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Color(0xffffffff)),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.watch_later_outlined,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                Opportunitiy['timePosted'] ?? 'Not Defined',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Color(0xffffffff)),
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
            width: 225,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                color: Color(0xff403c3c)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text('CHECK STATUS',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      color: Color(0xffb3a9a9),
                      fontSize: 14,
                    )),
              ),
            ))
      ],
    ),
  );
}
