// ignore_for_file: non_constant_identifier_names, sort_child_properties_last

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

int defaultBackground = 0xff08050c;

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.Opportunities,
  });

  final List<Map<String, String>> Opportunities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(defaultBackground),
        child: Column(
          children: [
            opportunities(Opportunities),
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
            Expanded(
              child: Container(
                color: Color(defaultBackground),
                height: 200,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 8),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container opportunities(List<Map<String, String>> Opportunities) {
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
        SizedBox(
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
        const SizedBox(height: 20),
        Container(
            width: 225,
            height: 50,
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
