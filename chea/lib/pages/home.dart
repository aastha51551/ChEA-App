// ignore_for_file: non_constant_identifier_names, sort_child_properties_last, curly_braces_in_flow_control_structures

// import 'package:chea/utils/appbar.dart';
import 'package:chea/utils/bottom_navbar.dart';
import 'package:chea/utils/cheagpt.dart';
import 'package:chea/utils/side_navbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

int defaultBackground = 0xff08050c;

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Color(defaultBackground),
      floatingActionButton: ChEAGPT(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: 0,
        onItemTapped: (int index) {
          if (index == 1)
            Navigator.pushNamedAndRemoveUntil(
                context, '/blog', (route) => false);
          else if (index == 2)
            Navigator.pushNamedAndRemoveUntil(
                context, '/opportunities', (route) => false);
          else if (index == 3)
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile', (route) => false);
        },
      ),
      appBar: appbar(),
      body: Container(
        color: Color(defaultBackground),
        child: ListView(
          children: [
            opportunities(),
            //Opportunitites Section
            //What's Happening Section
            Container(
                width: double.infinity,
                color: Color(defaultBackground),
                child: const Column(children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "What's Happening",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ])),
            Container(
              color: Color(defaultBackground),
              child: Column(
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                      child: Container(
                          height: 250,
                          child: const Center(
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
                          child: const Center(
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
          ],
        ),
      ),
      endDrawer: buildDrawer(
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}

Container opportunities() {
  List<Map<String, String>> Opportunities = [
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
  return Container(
    color: Color(defaultBackground),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text('Your Opportunities',
              style: GoogleFonts.nunitoSans(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: const Color(0xffffffff),
              )),
        ),
        Container(
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
      ],
    ),
  );
}

Widget _opportunities(Map<String, String> Opportunity) {
  return Container(
    width: 225,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color(0xff201F1F)),
    child: Column(
      children: [
        SizedBox(
          width: 225,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 8.0, top: 15.0, bottom: 0.0),
            child: Text(
              Opportunity['title'] ?? 'Not Defined',
              // style: TextStyle(

              //     color: Colors.grey[400],
              //     fontSize: 20,
              //     fontWeight: FontWeight.w800,
              //     fontStyle: FontStyle.italic),
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: const Color(0xff666161)),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(
          width: 225,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              Opportunity['provider'] ?? 'Not Defined',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xffffffff)),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.watch_later_outlined,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                Opportunity['timePosted'] ?? 'Not Defined',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xffffffff)),
              )
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
            width: 225,
            height: 40,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                color: Color(0xff403c3c)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text('CHECK STATUS',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffb3a9a9),
                      fontSize: 14,
                    )),
              ),
            ))
      ],
    ),
  );
}

AppBar appbar() {
  return AppBar(
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
                // colorFilter:
                //     const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ));
        }),
      ),
    ],
    title: Image.asset(
      'assets/icons/logo.png',
      height: 90,
      alignment: Alignment.centerLeft,
    ),
  );
}
