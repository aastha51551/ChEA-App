import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'blogPage.dart';

class buildCard extends StatelessWidget {
  final String imageUrl;
  final String description;
  final bool isBookmarked = false;
  final String Title;

  const buildCard({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.Title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlogPage(
                imageUrl: imageUrl,
                description: description,
                isBookmarked: false,
              ),
            ),
          );
        },
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xff201f1f),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image:  DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: Text(Title,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ])),
      ),
    );
  }
}


