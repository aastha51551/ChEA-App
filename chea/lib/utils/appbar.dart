import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../pages/home.dart';

AppBar appbar() {
  return AppBar(
    toolbarHeight: 100,
    backgroundColor: Color(defaultBackground).withOpacity(1),
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
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
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
