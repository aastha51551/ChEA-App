import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "WELCOME TO ChEA App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: defaultPadding * 2),
        // Row(
        //   children: [
        //     const Spacer(),
        //     Expanded(
        //       flex: 8,
        //       child: SvgPicture.asset(
        //         "assets/icons/chat.svg",
        //       ),
        //     ),
        //     const Spacer(),
        //   ],
        // ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}