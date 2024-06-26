// ignore_for_file: file_names, curly_braces_in_flow_control_structures, prefer_const_constructors, must_be_immutable

import 'package:chea/utils/bottom_navbar.dart';
import 'package:chea/utils/cheagpt.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Navigator.pushNamed(context, '/blog');
          } else if (index == 0)
            Navigator.pushNamed(context, '/');
          else if (index == 3) Navigator.pushNamed(context, '/profile');
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
                width: MediaQuery.of(context).size.width * 0.7,
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
            const Icon(Icons.filter_alt_outlined,
                color: Colors.white, size: 38),
          ],
        ),
        const SizedBox(height: 20),
        TabBar(
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

class OpportunitiesCard extends StatefulWidget {
  final String title;
  final String stipend;
  final String location;
  final String lastDateOfApply;
  bool isFavourite;
  final VoidCallback onTap;

  OpportunitiesCard({
    super.key,
    required this.title,
    required this.stipend,
    required this.location,
    required this.lastDateOfApply,
    required this.onTap,
    this.isFavourite = false,
  });

  @override
  State<OpportunitiesCard> createState() => _OpportunitiesCardState();
}

class _OpportunitiesCardState extends State<OpportunitiesCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xff201f1f),
              borderRadius: BorderRadius.circular(40)),
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20, bottom: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.nunitoSans(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Stipend: ${widget.stipend}',
                        style: GoogleFonts.montserrat(
                            color: Color(0xff7a7878),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic),
                      ),
                      Text('Location: ${widget.location}',
                          style: GoogleFonts.montserrat(
                              color: Color(0xff7a7878),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic)),
                      Row(
                        children: [
                          Icon(Icons.alarm_rounded,
                              color: Color(0xff7a7878), size: 20),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Apply by: ',
                            style: GoogleFonts.montserrat(
                                color: Color(0xff7a7878),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            widget.lastDateOfApply,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    widget.isFavourite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: widget.isFavourite ? Colors.red : Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.isFavourite = !widget.isFavourite;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Opportunities_Detail_Page extends StatelessWidget {
  final String title;
  final String stipend;
  final String location;
  final String role;
  final String domain;
  final String description;
  const Opportunities_Detail_Page({
    Key? key,
    required this.title,
    required this.stipend,
    required this.location,
    required this.role,
    required this.domain,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(defaultBackground),
      floatingActionButton: ChEAGPT(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: 2,
        onItemTapped: (int index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/blog');
          } else if (index == 0)
            Navigator.pushNamed(context, '/');
          else if (index == 3) Navigator.pushNamed(context, '/profile');
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
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff201f1f),
                    borderRadius: BorderRadius.circular(32)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 32.0, right: 32.0, top: 40, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: GoogleFonts.nunitoSans(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.w700)),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              color: Colors.white, size: 20),
                          SizedBox(
                            width: 5,
                          ),
                          Text(location,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.monetization_on_rounded,
                              color: Colors.white, size: 20),
                          SizedBox(
                            width: 5,
                          ),
                          Text(stipend,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.montserrat(
                            // Default text style
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            fontStyle: FontStyle.italic,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Domain: ',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle:
                                        FontStyle.italic)), // Regular text
                            TextSpan(text: domain),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.montserrat(
                            // Default text style
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            fontStyle: FontStyle.italic,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Role: ',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontStyle:
                                        FontStyle.italic)), // Regular text
                            TextSpan(text: role),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.montserrat(
                            // Default text style
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            fontStyle: FontStyle.italic,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Description: ',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle:
                                        FontStyle.italic)), // Regular text
                            TextSpan(text: description),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                      colors: const [
                                        Color(0xffff7a00),
                                        Color(0xffd45151)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight)),
                              child: Text(
                                'Apply Now',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w700),
                              ),
                            )),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
