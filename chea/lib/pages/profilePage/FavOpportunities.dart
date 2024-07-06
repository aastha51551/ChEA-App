import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/bottom_navbar.dart';
import '../../utils/cheagpt.dart';
import '../opportunities_component/opportunitiesCard.dart';
import '../opportunities_component/opportunitiesPage.dart';

int defaultBackground = 0xff09050d;

class Favopportunities extends StatelessWidget {
  const Favopportunities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(defaultBackground),
        floatingActionButton: ChEAGPT(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: MyNavigationBar(
          selectedIndex: 3,
          onItemTapped: (int index) {
            if (index == 1) {
              Navigator.pushNamed(context, '/blog');
            } else if (index == 0)
              Navigator.pushNamed(context, '/home');
            else if (index == 3) Navigator.pushNamed(context, '/profile');
            else if (index == 2) Navigator.pushNamed(context, '/opportunities');
          },
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xff09050d),
            child: Column(
                children:[
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: const Color(0xff201f1f),
                          ),

                          child: const Icon(Icons.favorite, color: Color(0xffd45151),size:30),

                        ),
                        const SizedBox(width: 20),
                        Flexible(child: Text('Favourite Opportunities',
                            style: GoogleFonts.montserrat(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.w700
                            )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: SearchBar(
                        padding: const WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 20)),
                        hintText: 'Search...',
                        elevation: const WidgetStatePropertyAll(0),
                        hintStyle: WidgetStatePropertyAll(GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic)),
                        backgroundColor:
                        const WidgetStatePropertyAll(Color(0xff3c3838)),
                        leading: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  OpportunitiesCard(
                    title: 'BASF',
                    stipend: 'EUR 1000/-',
                    location: 'Berlin,GER',
                    lastDateOfApply: '03/07/2024',
                    isFavourite: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Opportunities_Detail_Page(
                            title: 'BASF',
                            stipend: 'EUR 1000/-',
                            location: 'Berlin,GER',
                            domain: 'Agrochemicals',
                            role: 'Intern',
                            description:
                            'BASF is a German multinational chemical company and the largest chemical producer in the world. The BASF Group comprises subsidiaries and joint ventures in more than 80 countries and operates six integrated production sites and 390 other production sites in Europe, Asia, Australia, the Americas and Africa. Its headquarters is located in Ludwigshafen, Germany. BASF has customers in over 190 countries and supplies products to a wide variety of industries. Despite its size and global presence, BASF has received relatively little public attention since it abandoned manufacturing and selling BASF-branded consumer electronics products in the 1990s.',
                          ),
                        ),
                      );
                    },
                  ),
                ]
            ),
          ),
        )
    );
  }
}
