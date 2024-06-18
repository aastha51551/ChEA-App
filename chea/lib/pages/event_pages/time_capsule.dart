import 'package:chea/pages/event_pages/template.dart';
import 'package:flutter/material.dart';

class TimeCapsule extends StatefulWidget {
  @override
  _TimeCapsuleState createState() => _TimeCapsuleState();
}

class _TimeCapsuleState extends State<TimeCapsule>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomTabView(pageTitle: 'Time Capsule', tabs: [
        TabData(
          title: '2021',
          content: Container(
            color: Color(defaultBackground),
          ),
        ),
        TabData(
          title: '2022',
          content: Container(
            color: Color(defaultBackground),
          ),
        ),
      ]),
    );
  }
}
