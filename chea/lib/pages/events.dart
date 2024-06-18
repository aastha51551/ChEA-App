// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:chea/utils/cheagpt.dart';
import 'package:chea/utils/bottom_navbar.dart';
import 'package:chea/utils/side_navbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

int defaultBackground = 0xff09050d;

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20),
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
                  ));
            }),
          ),
        ],
        backgroundColor: Color(defaultBackground),
      ),
      body: const EventPage(),
      bottomNavigationBar: MyNavigationBar(
          selectedIndex: 5,
          onItemTapped: (int index) {
            if (index == 0) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            } else if (index == 1)
              Navigator.pushNamedAndRemoveUntil(
                  context, '/blog', (route) => false);
            else if (index == 3)
              Navigator.pushNamedAndRemoveUntil(
                  context, '/opportunities', (route) => false);
            else if (index == 4)
              Navigator.pushNamedAndRemoveUntil(
                  context, '/profile', (route) => false);
          }),
      floatingActionButton: ChEAGPT(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      endDrawer: buildDrawer(width: MediaQuery.of(context).size.width),
    );
  }
}

class EventPage extends StatelessWidget {
  const EventPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(defaultBackground),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                child: SearchBar(
                  hintText: 'Search...',
                  padding:
                      const WidgetStatePropertyAll(EdgeInsets.only(left: 20)),
                  leading: (const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 32,
                  )),
                  textStyle: WidgetStatePropertyAll(GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
                  elevation: const WidgetStatePropertyAll(0),
                  backgroundColor:
                      const WidgetStatePropertyAll(Color(0xff3c3838)),
                ),
              ),
              SizedBox(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: const Center(child: Text('Trad Day 2k24')),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: const Center(child: Text('Trad Day 2k24')),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: EventGrid(),
              )
            ],
          ),
        ));
  }
}

class EventCard {
  final Image icon;
  final String title;
  EventCard({required this.icon, required this.title});
}

class EventGrid extends StatelessWidget {
  final List<EventCard> events = [
    EventCard(icon: Image.asset('assets/images/1.png'), title: 'Time Capsule'),
    EventCard(icon: Image.asset('assets/images/2.png'), title: 'Valfi'),
    EventCard(
        icon: Image.asset('assets/images/3.png'), title: 'Freshie Orientation'),
    EventCard(
        icon: Image.asset('assets/images/4.png'), title: 'Know Your Profs'),
    EventCard(
        icon: Image.asset('assets/images/5.png'), title: 'Traditional Day'),
    EventCard(icon: Image.asset('assets/images/6.png'), title: 'Core Talks'),
    EventCard(
        icon: Image.asset('assets/images/7.png'), title: 'Department Trips'),
    EventCard(icon: Image.asset('assets/images/8.png'), title: 'Sport Events'),
    EventCard(
        icon: Image.asset('assets/images/9.png'), title: 'Panel Discussions'),
    EventCard(
        icon: Image.asset('assets/images/10.png'), title: 'Alumni Reunion'),
    EventCard(icon: Image.asset('assets/images/11.png'), title: 'Convocation'),
    EventCard(
        icon: Image.asset('assets/images/12.png'),
        title: 'Miscellaneous Events'),
  ];

  @override
  Widget build(BuildContext context) {
    const double maxCrossAxisExtent = 250;
    const double childAspectRatio = 1;
    const double crossAxisSpacing = 10;
    const double mainAxisSpacing = 10;

    // Calculate the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the number of columns
    int columns =
        (screenWidth / (maxCrossAxisExtent + crossAxisSpacing)).ceil();

    // Calculate the number of rows
    int rows = (events.length / columns).ceil();

    // Calculate the height of each item
    double itemHeight = maxCrossAxisExtent / childAspectRatio;
    double gridHeight = (itemHeight * rows) + (mainAxisSpacing * (rows - 1));
    return SizedBox(
      height: gridHeight - 200,
      child: GridView.builder(
          itemCount: events.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1),
          itemBuilder: (context, index) {
            return SizedBox(
              height: 200,
              width: 200,
              child: Center(
                  child: Column(
                children: [
                  Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: const Color(0xffc25923), width: 2)),
                      child: GestureDetector(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/timecapsule', (route) => false);
                              break;

                            case 1:
                              Navigator.pushNamed(context, '/valfi');
                              break;
                            case 2:
                              Navigator.pushNamed(context, '/freshieorientation');
                              break;
                            // case 3:
                            //   Navigator.pushNamed(context, '/knowyourprofs');
                            //   break;
                            // case 4:
                            //   Navigator.pushNamed(context, '/traditionalday');
                            //   break;
                            // case 5:
                            //   Navigator.pushNamed(context, '/coretalks');
                            //   break;
                            // case 6:
                            //   Navigator.pushNamed(context, '/departmenttrips');
                            //   break;
                            // case 7:
                            //   Navigator.pushNamed(context, '/sportevents');
                            //   break;
                            // case 8:
                            //   Navigator.pushNamed(context, '/paneldiscussions');
                            //   break;
                            // case 9:
                            //   Navigator.pushNamed(context, '/alumnireunion');
                            //   break;
                            // case 10:
                            //   Navigator.pushNamed(context, '/convocation');
                            //   break;
                            // case 11:
                            //   Navigator.pushNamed(context, '/miscellaneousevents');
                            //   break;
                            // print('Event $index');
                          }
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: events[index].icon),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(events[index].title,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        )),
                  ),
                ],
              )),
            );
          }),
    );
  }
}
