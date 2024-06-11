// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:chea/utils/bottom_navbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

int defaultBackground = 0xff08050c;

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10),
          child: Text(
            'Events',
            style: GoogleFonts.nunitoSans(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
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
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ));
            }),
          ),
        ],
        backgroundColor: Color(defaultBackground),
      ),
      body: Container(
        color: Color(defaultBackground),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: const Center(
            child: Text(
          'Events',
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.w700),
        )),
      ),
      bottomNavigationBar: MyNavigationBar(
          selectedIndex: 5,
          onItemTapped: (int index) {
            if (index == 0) {
              Navigator.pushNamed(context, '/');
            } else if (index == 1)
              Navigator.pushNamed(context, '/blog');
            else if (index == 3)
              Navigator.pushNamed(context, '/opportunities');
            else if (index == 4) Navigator.pushNamed(context, '/profile');
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xffff7811),
          shape: ShapeBorder.lerp(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
