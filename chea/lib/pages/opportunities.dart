// ignore_for_file: file_names, curly_braces_in_flow_control_structures, prefer_const_constructors, must_be_immutable

import 'package:chea/utils/auth_service.dart';
import 'package:chea/utils/bottom_navbar.dart';
import 'package:chea/utils/cheagpt.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'opportunities_component/opportunitiesCard.dart';
import 'opportunities_component/opportunitiesPage.dart';

int defaultBackground = 0xff08050c;

class Opportunity {
  final int id;
  final String title;
  final String stipend;
  final String location;
  final String lastDateOfApply;
  final String description;
  final String domain;
  final String role;
  final String opportunityType;
  bool isFavourite;

  Opportunity({
    required this.title,
    required this.stipend,
    required this.location,
    required this.lastDateOfApply,
    required this.description,
    required this.domain,
    required this.role,
    required this.opportunityType,
    required this.isFavourite,
    required this.id,
  });

  static String formatStipend(String stipend) {
    Map<String, String> currencySymbols = {
      'â¹': '\u20B9',
      '€': '\u20AC',
      '\$': '\u0024',
      // Add more currency symbols and their Unicode characters if needed
    };

    for (var symbol in currencySymbols.keys) {
      if (stipend.contains(symbol)) {
        stipend = stipend.replaceAll(symbol, currencySymbols[symbol]!);
      }
    }
    return stipend;
  }

  factory Opportunity.fromJson(Map<String, dynamic> json) {
    return Opportunity(
        id: json['id'],
        title: json['title'],
        stipend: formatStipend(json['stipend']),
        location: json['location'],
        lastDateOfApply: json['lastDateOfApply'],
        description: json['description'],
        domain: json['domain'],
        role: json['role'],
        isFavourite: json['isFavourite'] ?? false,
        opportunityType: json['OpportunityType']);
  }
}

Future<List<Opportunity>> getOpportunities() async {
  final token = await AuthService().getToken();
  final response = await http.get(
    Uri.parse('http://10.0.2.2:8000/opportunities/opportunities/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Token $token',
    },
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    // print(jsonResponse);
    return jsonResponse
        .map((opportunity) => Opportunity.fromJson(opportunity))
        .toList();
  } else {
    throw Exception('Failed to load opportunities');
  }
}

Future<void> toggleFavorite(Opportunity opportunity) async {
  final token = await AuthService().getToken();
  final endpoint = opportunity.isFavourite ? 'remove_favorite' : 'add_favorite';
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8000/opportunities/$endpoint/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Token $token',
    },
    body: jsonEncode(<String, int>{
      'opportunity_id': opportunity.id,
    }),
  );
  if (response.statusCode == 201 || response.statusCode == 200)
    opportunity.isFavourite = !opportunity.isFavourite;
  else
    throw Exception('Failed to toggle favorite');
}

class Opportunities extends StatefulWidget {
  const Opportunities({super.key});

  @override
  State<Opportunities> createState() => _OpportunitiesState();
}

class _OpportunitiesState extends State<Opportunities>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _searchController;
  List<Opportunity> opportunities = [];
  List<Opportunity> filteredOpportunities = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _searchController = TextEditingController();
    getOpportunities().then((value) {
      setState(() {
        opportunities = value;
        filteredOpportunities = opportunities;
        _isLoading = false;
      });
    });

    _searchController.addListener(() {
      setState(() {
        if (_searchController.text.isEmpty) {
          filteredOpportunities = opportunities;
        } else {
          filteredOpportunities = filterOpportunities(_searchController.text);
        }
      });
    });
  }

  List<Opportunity> filterOpportunities(String query) {
    if (query.isEmpty) return filteredOpportunities;
    return filteredOpportunities
        .where((opportunity) =>
            opportunity.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<Opportunity> getOpportunitiesByType(String type) {
    return filteredOpportunities
        .where((opportunity) => opportunity.opportunityType == type)
        .toList();
  }

  Widget _buildOpportunitiesList(List<Opportunity> opportunities) {
    return ListView.builder(
        itemCount: opportunities.length,
        itemBuilder: (context, index) {
          final opportunity = opportunities[index];
          return OpportunitiesCard(
            opportunity: opportunity,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Opportunities_Detail_Page(
                    title: opportunity.title,
                    stipend: opportunity.stipend,
                    location: opportunity.location,
                    domain: opportunity.domain,
                    role: opportunity.role,
                    description: opportunity.description,
                  ),
                ),
              );
            },
          );
        });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
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
            Navigator.pushNamedAndRemoveUntil(
                context, '/blog', (route) => false);
          } else if (index == 0)
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          else if (index == 3)
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile', (route) => false);
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
                  controller: _searchController,
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20)),
                  hintText: 'Search...',
                  textStyle: WidgetStatePropertyAll(GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic)),
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
                  'Projects',
                  style: GoogleFonts.nunitoSans(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ]),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            _isLoading
                ? CircularProgressIndicator()
                : _buildOpportunitiesList(getOpportunitiesByType('Internship')),
            _isLoading
                ? CircularProgressIndicator()
                : _buildOpportunitiesList(getOpportunitiesByType('Placement')),
            _isLoading
                ? CircularProgressIndicator()
                : _buildOpportunitiesList(getOpportunitiesByType('Projects')),
          ]),
        )
      ]),
    );
  }
}
