import 'package:chea/utils/bottom_navbar.dart';
import 'package:flutter/material.dart';

class Blog extends StatelessWidget {
  const Blog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MyNavigationBar(
          selectedIndex: 1,
          onItemTapped: (int index) {
            if (index == 0)
              Navigator.pushNamed(context, '/home');
            else if (index == 2)
              Navigator.pushNamed(context, '/opportunities');
            else if (index == 3) Navigator.pushNamed(context, '/profile');
          },
        ),
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: Text('Blog'),
          ),
        ));
  }
}
