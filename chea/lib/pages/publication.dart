import 'package:chea/pages/event_pages/template.dart';
import 'package:chea/utils/DisplayCard.dart';
import 'package:flutter/material.dart';

class Publication extends StatefulWidget {
  const Publication({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PublicationState createState() => _PublicationState();
}

class _PublicationState extends State<Publication>
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
      body: CustomTabView(pageTitle: 'Publications', tabs: [
        TabData(
          title: '2023 - 2024',
          content: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              color: Color(defaultBackground),
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10),
                      child: DisplayCard(
                        backgroundImage: 'assets/images/CheaVoice23.jpg',
                        title: 'ChEA Voice       ',
                        googleDriveLink: Uri.parse(
                            'https://drive.google.com/file/d/1nl1Cs6NeOT91nWqpMUkBWRPKdFmCzPqx/view?usp=sharing'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        TabData(
          title: '2022 - 2023',
          content: SingleChildScrollView(
            child: Container(
              color: Color(defaultBackground),
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 15),
                      child: DisplayCard(
                        backgroundImage: 'assets/images/CheaVoice22.jpg',
                        title: 'ChEA Voice',
                        googleDriveLink: Uri.parse(
                            'https://f8f4ff97-33da-4ff8-a83e-b43a7e57eef0.filesusr.com/ugd/52d346_bd7e7d46fdda44e5bc7cc843b72fcdcd.pdf'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 15),
                      child: DisplayCard(
                        backgroundImage: 'assets/images/AlumOracle22.png',
                        title: 'The Alum Oracle',
                        googleDriveLink: Uri.parse(
                            'https://f8f4ff97-33da-4ff8-a83e-b43a7e57eef0.filesusr.com/ugd/52d346_3d318cd05cac446e98cf4b8e784f0744.pdf'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 15),
                      child: DisplayCard(
                        backgroundImage: 'assets/images/AlumOracle22.png',
                        title: "The Alum Oracle Dark",
                        googleDriveLink: Uri.parse(
                            'https://f8f4ff97-33da-4ff8-a83e-b43a7e57eef0.filesusr.com/ugd/52d346_c989ac4b8b4e4b308afc62dc6c0b91f7.pdf'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        TabData(
          title: '2021 - 2022',
          content: SingleChildScrollView(
            child: Container(
              color: Color(defaultBackground),
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: DisplayCard(
                        backgroundImage: 'assets/images/CheaVoice21.png',
                        title: 'ChEA Voice       ',
                        googleDriveLink: Uri.parse(
                            'https://f8f4ff97-33da-4ff8-a83e-b43a7e57eef0.filesusr.com/ugd/52d346_185bb007db8d453c9dc682a5c9fb59a5.pdf'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10),
                      child: DisplayCard(
                        backgroundImage: 'assets/images/AlumOracle21.png',
                        title: 'The \nAlum Oracle',
                        googleDriveLink: Uri.parse(
                            'https://f8f4ff97-33da-4ff8-a83e-b43a7e57eef0.filesusr.com/ugd/52d346_e8062dd752db457ba327e36144e649be.pdf'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10),
                      child: DisplayCard(
                        backgroundImage: 'assets/images/ChemicalGazette21.png',
                        title: 'Chemical Gazette',
                        googleDriveLink: Uri.parse(
                            'https://f8f4ff97-33da-4ff8-a83e-b43a7e57eef0.filesusr.com/ugd/52d346_33982ebd08fc4a69b986929e0b64e38e.pdf'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        TabData(
          title: '2020 - 2021',
          content: SingleChildScrollView(
            child: Container(
              color: Color(defaultBackground),
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10),
                      child: DisplayCard(
                        backgroundImage: 'assets/images/CheaVoice20.png',
                        title: 'ChEA Voice',
                        googleDriveLink: Uri.parse(
                            'https://f8f4ff97-33da-4ff8-a83e-b43a7e57eef0.filesusr.com/ugd/52d346_65777f8ea4b844358c53e9f8e42e2ecf.pdf'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10),
                      child: DisplayCard(
                        backgroundImage: 'assets/images/ChemicalGazette20.png',
                        title: 'Chemical Gazette',
                        googleDriveLink: Uri.parse(
                            'https://f8f4ff97-33da-4ff8-a83e-b43a7e57eef0.filesusr.com/ugd/52d346_6b4a04449c904929b2ce92b6f50b2de1.pdf'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        TabData(
          title: '2019 - 2020',
          content: SingleChildScrollView(
            child: Container(
              color: Color(defaultBackground),
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10),
                      child: DisplayCard(
                        backgroundImage: 'assets/images/CheaVoice19.png',
                        title: 'ChEA Voice',
                        googleDriveLink: Uri.parse(
                            'https://f8f4ff97-33da-4ff8-a83e-b43a7e57eef0.filesusr.com/ugd/52d346_17b5cb10e973481c935c7b8943230e91.pdf'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10),
                      child: DisplayCard(
                        backgroundImage: 'assets/images/ChemicalGazette19.png',
                        title: 'Chemical Gazette',
                        googleDriveLink: Uri.parse(
                            'https://f8f4ff97-33da-4ff8-a83e-b43a7e57eef0.filesusr.com/ugd/52d346_deae54f32fca4d9ea018b991318ba648.pdf'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        TabData(
          title: '2017 - 2018',
          content: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              color: Color(defaultBackground),
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10),
                      child: DisplayCard(
                        backgroundImage: 'assets/images/ChemicalGazette17.png',
                        title: 'Chemical Gazette',
                        googleDriveLink: Uri.parse(
                            'https://f8f4ff97-33da-4ff8-a83e-b43a7e57eef0.filesusr.com/ugd/52d346_0b90a5a264354853871333bf40965750.pdf'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

// class DisplayCard extends StatelessWidget {
//   final String backgroundImage;
//   final String title;
//   final Uri googleDriveLink;
//   const DisplayCard({
//     super.key,
//     required this.backgroundImage,
//     required this.title,
//     required this.googleDriveLink,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () async {
//         if (await canLaunchUrl(googleDriveLink)) {
//           await launchUrl(googleDriveLink);
//         } else {
//           throw 'Could not launch $googleDriveLink';
//         }
//       },
//       child: AspectRatio(
//         aspectRatio: 2479 / 3510,
//         child: Container(
//           margin: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             image: DecorationImage(
//               image: AssetImage(backgroundImage),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Container(
//             alignment: Alignment.bottomCenter,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.transparent,
//                     Colors.black.withOpacity(0.7),
//                     Colors.black,
//                   ],
//                 )),
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 25.0),
//               child: Text(
//                 title,
//                 style: GoogleFonts.nunitoSans(
//                   color: Colors.white,
//                   fontSize: 32,
//                   fontWeight: FontWeight.w700,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
