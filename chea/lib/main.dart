// ignore_for_file: prefer_const_constructors, sort_child_properties_last, camel_case_types

import 'package:chea/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
        theme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Color(defaultBackground))),
        title: 'ChEA',
        home: Scaffold(
            backgroundColor: Color(defaultBackground),
            appBar: AppBar(
              toolbarHeight: 100,
              backgroundColor: Color(defaultBackground),
              elevation: 0,
              centerTitle: false,
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, top: 20),
                  child: Builder(builder: (context) {
                    return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/Hamburger_LG.svg',
                          height: 40,
                          colorFilter:
                              ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ));
                  }),
                ),
              ],
              title: Image.asset(
                'assets/icons/logo.png',
                height: 90,
                alignment: Alignment.centerLeft,
              ),
            ),
            body: Home(
                Opportunities: Opportunities, width: width, height: height),
            //Navigation Drawer
            endDrawer: buildDrawer(width: width),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Color(0xffff7811),
                shape: ShapeBorder.lerp(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    0.5),
                child: Center(
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SvgPicture.asset(
                        'assets/icons/ai.svg',
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                    ),
                  ),
                )),
            bottomNavigationBar: BottomAppBar(
                color: Color(0xff201f1f),
                height: 57,
                padding: EdgeInsets.all(0),
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/house.svg',
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: IconButton(
                          icon: SvgPicture.asset('assets/icons/document.svg'),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: IconButton(
                          icon: SvgPicture.asset(
                            'assets/icons/briefcase.svg',
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/user.svg',
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ))));
  }
}

class buildDrawer extends StatelessWidget {
  const buildDrawer({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: width * 0.75,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: const [
              Color(0xff201f1f),
              Color(0xff000000),
              Color(0xff4c4949)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 40, bottom: 35),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/Hamburger_LG.svg',
                    height: 40,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  title: Text('Menu',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/calender.svg',
                    height: 24,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  title: Text('Events',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/Book.svg',
                    height: 24,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  title: Text('Publications',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/Vector.svg',
                    height: 24,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  title: Text('Links',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/Users_Group.svg',
                    height: 24,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  title: Text('FacAds',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/Phone.svg',
                    height: 24,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  title: Text('Contact Us',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ));
  }
}
