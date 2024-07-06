import 'package:chea/pages/event_pages/template.dart';
import 'package:chea/utils/DisplayCard2.dart';
import 'package:flutter/material.dart';

class FacAd extends StatefulWidget {
  const FacAd({super.key});

  @override _FacAdState createState() => _FacAdState();
}

class _FacAdState extends State<FacAd> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Map<String, dynamic>> tabsInfo = [
    {
      "title": "2023 B.Tech",
      "items": [
        {
          "backgroundImage": "assets/images/facAd231.jpg",
          "name": "Prof. Hemant \nNanavati",
          "email": "hnanavati@che.iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7215",
        },
        {
          "backgroundImage": "assets/images/facAd232.jpg",
          "name": "Prof. Jason \nRyan Picardo",
          "email": "jrpicardo@che.iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7247",
        },
        {
          "backgroundImage": "assets/images/facAd233.jpg",
          "name": "Prof. Anmol \nSubhedar",
          "email": 'amol.subhedar@che.iitb.ac.in',
          'mobilenumber': '+91 (22) 2576 7248',
        },
        {
          'backgroundImage': 'assets/images/facAd234.jpg',
          'name': ' Prof. Supreet \nSaini',
          'email': 'saini@che.iitb.ac.in',
          'mobilenumber': '+91 (22) 2576 7216',
        }
      ],
    },
    {
      "title": "2022 B.Tech",
      "items": [
        {
          "backgroundImage": "assets/images/facAd221.jpg",
          "name": "Prof. Swati\n Bhattacharya ",
          "email": "swaticb@che.iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7220"
        },
        {
          "backgroundImage": "assets/images/facAd222.jpg",
          "name": "Prof. BharatKumar \nSuthar ",
          "email": "bharat.k.suthar@iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7243",
        },
        {
          "backgroundImage": "assets/images/facAd223.jpg",
          "name": "Prof. Rajdip \n Bandyopadhyaya",
          "email": "rajdip@che.iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7209"
        },
        {
          "backgroundImage": "assets/images/facAd224.jpg",
          "name": "Prof. Guruswamy \nKumaraswamy",
          "email": "guruswamy@iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7239",
        }
      ],
    },
    {
      "title": "2021 B.Tech",
      "items": [
        {
          "backgroundImage": "assets/images/facAd211.jpg",
          "name": "Prof. Sameer \nJadhav",
          "email": "srjadhav@che.iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7219",
        },
        {
          "backgroundImage": "assets/images/facAd212.jpg",
          "name": "Prof. Rochish \nThaokar",
          "email": "rochish@che.iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7241",
        },
        {
          "backgroundImage": "assets/images/facAd213.jpg",
          "name": "Prof. Arindam  \nSarkar",
          "email": "asarkar@che.iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7233",
        },
        {
          "backgroundImage": "assets/images/facAd214.jpg",
          "name": "Prof. Mukta \nTripathy",
          "email": "tripathy@che.iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7204",
        }
      ]
    },
    {
      "title": "2020 B.Tech",
      "items": [
        {
          "backgroundImage": "assets/images/facAd201.jpg",
          "name": "Prof. P. \nSunthar",
          "email": "sunthar@che.iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7229",
        },
        {
          "backgroundImage": "assets/images/facAd202.jpg",
          "name": "Prof. Jhumpa \nAdhikari",
          "email": "adhikari@iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7245",
        },
        {
          "backgroundImage": "assets/images/facAd203.jpg",
          "name": "Prof. Sarika \nMehra",
          "email": "sarika@che.iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7221",
        },
        {
          "backgroundImage": "assets/images/facAd204.jpg",
          "name": "Prof. Yogendra \nShastri",
          "email": "yshastri@iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7203",
        }
      ]
    },
    {
      "title": "M.Tech",
      "items": [
        {
          "backgroundImage": "assets/images/facAdM1.jpg",
          "name": "Prof. Ratul \nDasgupta",
          "email": "dasgupta.ratul@iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7235",
        },
        {
          "backgroundImage": "assets/images/facAdM2.jpg",
          "name": "Prof. Abhijit \nMajumder",
          "email": "abhijitm@iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7237",
        }
      ]
    },
    {
      "title": "Ph.D",
      "items": [
        {
          "backgroundImage": "assets/images/facAdP1.jpg",
          "name": "Prof. Mani \nBhushan",
          "email": "mbhushan@che.iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7214",
        },
        {
          "backgroundImage": "assets/images/facAdP2.jpg",
          "name": "Prof. Partha \nSarathi Goswami",
          "email": "psg@che.iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7230",
        },
        {
          "backgroundImage": "assets/images/facAdP3.jpg",
          "name": "Prof. Ateeque \nMalani",
          "email": "malani@che.iitb.ac.in",
          "mobilenumber": "+91 (22) 2576 7205",
        }
      ]
    }
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabsInfo.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomTabView(
          pageTitle: 'FacAds',
          tabs: tabsInfo
              .map((tab) => TabData(
                  title: tab['title'],
                  content: Container(
                    color: Color(defaultBackground),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var item in tab['items'])
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                child: SizedBox(
                                  height: 500,
                                  width: 400,
                                  child: DisplayCard2(
                                    backgroundImage: item['backgroundImage'],
                                    name: item['name'],
                                    email: item['email'],
                                    mobilenumber: item['mobilenumber'],
                                  ),
                                )),
                          const SizedBox(height: 20)
                        ],
                      ),
                    ),
                  )))
              .toList()),
    );
  }
}
