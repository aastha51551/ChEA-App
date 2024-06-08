import 'package:chea/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyNavigationBar extends StatefulWidget {
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  final List<Map<String, String>> Opportunities = [
    {
      'title': 'Internship',
      'provider': 'BASF, GER',
      'timePosted': '2 days ago'
    },
    {
      'title': 'Project',
      'provider': 'Prof. Rochish',
      'timePosted': '5 days ago'
    },
    {'title': 'Internship', 'provider': 'Shell', 'timePosted': '1 week ago'}
  ];
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _pageController.jumpToPage(index);
    });
    // Add your page navigation logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _onItemTapped(2);
          },
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
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          Home(Opportunities: Opportunities),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.red,
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          color: Color(0xff1a1818),
          height: 50,
          padding: EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/house.svg',
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 0 ? Colors.white : Color(0xff666161),
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/document.svg',
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 1 ? Colors.white : Color(0xff666161),
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () => _onItemTapped(1),
              ),
              SizedBox(width: 10, height: 0),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/briefcase.svg',
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 3 ? Colors.white : Color(0xff666161),
                    BlendMode.srcIn,
                  ),
                  height: 25,
                ),
                onPressed: () => _onItemTapped(3),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/user.svg',
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 4 ? Colors.white : Color(0xff666161),
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () => _onItemTapped(4),
              ),
            ],
          )),
    );
  }
}
