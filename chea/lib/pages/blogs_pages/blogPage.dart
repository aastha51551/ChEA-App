import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/bottom_navbar.dart';
import '../../utils/cheagpt.dart';
import '../blogs.dart';

class BlogPage extends StatefulWidget {
  final String imageUrl;
  final String description;
  final bool isBookmarked;

  BlogPage(
      {required this.imageUrl,
        required this.description,
        required this.isBookmarked});

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    isBookmarked = widget.isBookmarked;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Color(defaultBackground),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Blogs',
                            style: GoogleFonts.nunitoSans(
                                color: Colors.white,
                                fontSize: 42,
                                fontWeight: FontWeight.w700)),
                        IconButton(
                          icon: Icon(
                              isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: Colors.white,
                              size: 40),
                          onPressed: () {
                            setState(() {
                              isBookmarked = !isBookmarked;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              image: Image.asset(widget.imageUrl).image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          widget.description,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: MyNavigationBar(
            selectedIndex: 1,
            onItemTapped: (int index) {
              if (index == 0) {
                Navigator.pushNamed(
                  context,
                  '/home',
                );
              } else if (index == 1) {
                Navigator.pushNamed(
                  context,
                  '/blog',
                );
              } else if (index == 3) {
                Navigator.pushNamed(
                  context,
                  '/opportunities',
                );
              } else if (index == 4) {
                Navigator.pushNamed(
                  context,
                  '/profile',
                );
              }
            }),
        floatingActionButton: ChEAGPT(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}