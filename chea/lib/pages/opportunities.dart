// ignore_for_file: file_names, curly_braces_in_flow_control_structures

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
            Container(
              color: Colors.amber,
              child: Text('Internship'),
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
