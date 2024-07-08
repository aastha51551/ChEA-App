// ignore_for_file: file_names, curly_braces_in_flow_control_structures, prefer_const_constructors, must_be_immutable

import 'package:chea/utils/bottom_navbar.dart';
import 'package:chea/utils/cheagpt.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'opportunities_component/opportunitiesCard.dart';
import 'opportunities_component/opportunitiesPage.dart';

int defaultBackground = 0xff08050c;

class Opportunities extends StatefulWidget {
  const Opportunities({super.key});

  @override
  State<Opportunities> createState() => _OpportunitiesState();
}

class _OpportunitiesState extends State<Opportunities>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(defaultBackground),
      floatingActionButton: ChEAGPT(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: 2,
        onItemTapped: (int index) {
          if (index == 1) {
            Navigator.pushNamedAndRemoveUntil(context, '/blog', (route) => false);
          } else if (index == 0)
            Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
          else if (index == 3) Navigator.pushNamedAndRemoveUntil(context, '/profile', (route) => false);
        },
      ),
      appBar: AppBar(
        // leading: Image.asset(widget.icon),
        automaticallyImplyLeading: false,
        backgroundColor: Color(defaultBackground),
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            'Opportunities',
            style: GoogleFonts.nunitoSans(
                color: Colors.white, fontSize: 43, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
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
            const SizedBox(
              width: 10,
            ),
            Icon(Icons.notifications_active_outlined,
                color: Colors.amber[900], size: 38),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        const SizedBox(height: 20),
        TabBar(
            isScrollable: true,
            controller: _tabController,
            indicatorColor: const Color(0xffff752c),
            dividerColor: Color(defaultBackground),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                child: Text(
                  'Internship',
                  style: GoogleFonts.nunitoSans(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Tab(
                child: Text(
                  'Placement',
                  style: GoogleFonts.nunitoSans(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Tab(
                child: Text(
                  'Project',
                  style: GoogleFonts.nunitoSans(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ]),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            SingleChildScrollView(
              child: Container(
                color: Color(defaultBackground),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
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
                            builder: (context) => Opportunities_Detail_Page(
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
                    OpportunitiesCard(
                      title: 'DRL',
                      stipend: 'INR 75,000',
                      location: 'Hyderabad,IND',
                      lastDateOfApply: '03/07/2024',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Opportunities_Detail_Page(
                              title: 'DRL',
                              stipend: 'INR 75,000',
                              location: 'Hyderabad,IND',
                              domain: 'Pharmaceuticals',
                              role: 'Intern',
                              description:
                                  'Dr. Reddy\'s Laboratories is an Indian multinational pharmaceutical company based in Hyderabad, Telangana, India. The company was founded by Anji Reddy, who previously worked in the mentor institute Indian Drugs and Pharmaceuticals Limited, of Hyderabad, India. Dr. Reddy\'s manufactures and markets a wide range of pharmaceuticals in India and overseas. The company has over 190 medications, 60 active pharmaceutical ingredients (APIs) for drug manufacture, diagnostic kits, critical care, and biotechnology products. Dr. Reddy\'s started as a supplier to Indian drug manufacturers, but it soon started exporting to other less-regulated markets that had the advantage of not having to spend time and money on a large number of tests and clinical trials. By the early 1990s, the expanded scale and profitability from these unregulated markets enabled the company to begin focusing on getting approval from drug regulators for their formulations and bulk drug manufacturing plants in more-developed economies. This allowed their movement into regulated markets such as the US and Europe.',
                            ),
                          ),
                        );
                      },
                    ),
                    OpportunitiesCard(
                      title: 'Reliance',
                      stipend: 'INR 60,000',
                      location: 'Jamnagar,IND',
                      lastDateOfApply: '03/07/2024',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Opportunities_Detail_Page(
                              title: 'Reliance',
                              stipend: 'INR 60,000',
                              location: 'Jamnagar,IND',
                              domain: 'Petrochemicals',
                              role: 'Intern',
                              description:
                                  'Reliance Industries Limited is an Indian multinational conglomerate company headquartered in Mumbai, Maharashtra, India. Reliance owns businesses across India engaged in energy, petrochemicals, textiles, natural resources, retail, and telecommunications. Reliance is one of the most profitable companies in India, the largest publicly traded company in India by market capitalization, and the largest company in India as measured by revenue after recently surpassing the government-controlled Indian Oil Corporation. On 18 October 2007, Reliance Industries became the first Indian company to breach 100 billion dollars market capitalization. The company is ranked 96th on the Fortune Global 500 list of the world\'s biggest corporations as of 2021.',
                            ),
                          ),
                        );
                      },
                    ),
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
                            builder: (context) => Opportunities_Detail_Page(
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
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              child: Text('Placement'),
            ),
            Container(color: Colors.green, child: Text('Project')),
          ]),
        )
      ]),
    );
  }
}



