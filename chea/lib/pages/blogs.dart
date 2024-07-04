// import 'package:chea/utils/bottom_navbar.dart';
// import 'package:chea/utils/cheagpt.dart';
// import 'package:chea/utils/side_navbar.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:chea/pages/event_pages/template.dart';

import '../utils/bottom_navbar.dart';
// import 'package:chea/utils/DisplayCard.dart';
int defaultBackground = 0xff08050c;

class Blog extends StatelessWidget {
  const Blog({super.key});

  @override
  Widget build(BuildContext context) {
return Scaffold(

      body: BlogsPage(),
    );
  }
}

class BlogsPage extends StatefulWidget {
  @override
  _BlogsPageState createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage>
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    var safeHeight = height - padding.top - padding.bottom;
    
    return Scaffold(
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: 1,
        onItemTapped: (int index) {
          if (index == 0) {
            Navigator.pushNamed(
                context, '/home');
          } else if (index == 2)
            Navigator.pushNamed(
                context, "/opportunities");
          else if (index == 3)
            Navigator.pushNamed(
                context, '/profile');
        },
      ),
      body: Container(),
    );
  }
}

 class BlogCard {
  final String imagePath;
  final String title;

  BlogCard({required this.imagePath, required this.title});
}

class BlogTile extends StatelessWidget {
  final BlogCard blogcard;
  // ignore: prefer_const_constructors_in_immutables
  BlogTile({super.key, required this.blogcard});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 25),
      padding: const EdgeInsets.all(14),
      width: 349,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [
          SizedBox(
            width: 86,
            height: 85,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(blogcard.imagePath)),
          ),
            
            SizedBox(
              height: 72,
              width: 218,
              child: Text(blogcard.title, style: TextStyle(color: Colors.grey[100]),))
      ],),
    );}}



// class Blog extends StatelessWidget {
//   const Blog({super.key});

//   @override
//   Widget build(BuildContext context) {
// return Scaffold(
    
//       appBar: AppBar(
//         toolbarHeight: 80,
//         automaticallyImplyLeading: false,
//         title: Padding(
//           padding: const EdgeInsets.only(left: 20.0, top: 20),
//           child: Text(
//             'Blogs',
//             style: GoogleFonts.nunitoSans(
//               fontSize: 48,
//               fontWeight: FontWeight.w700,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15.0, top: 20),
//             child: Builder(builder: (context) {
//               return IconButton(
//                   onPressed: () {
//                     Scaffold.of(context).openEndDrawer();
//                   },
//                   icon: SvgPicture.asset(
//                     'assets/icons/Hamburger_LG.svg',
//                     height: 40,
//                   ));
//             }),
//           ),
//         ],
//         backgroundColor: Color(defaultBackground),
//       ),


//       body: const BlogsPage(),
//       bottomNavigationBar: MyNavigationBar(
//           selectedIndex: 5,
//           onItemTapped: (int index) {
//             if (index == 0) {
//               Navigator.pushNamedAndRemoveUntil(
//                   context, '/home', (route) => false);
//             } else if (index == 1){
//               Navigator.pushNamedAndRemoveUntil(
//                   context, '/blog', (route) => false);}
//             else if (index == 3){
//               Navigator.pushNamedAndRemoveUntil(
//                   context, '/opportunities', (route) => false);}
//             else if (index == 4){
//               Navigator.pushNamedAndRemoveUntil(
//                   context, '/profile', (route) => false);}
//           }),
//       floatingActionButton: ChEAGPT(context),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       endDrawer: buildDrawer(width: MediaQuery.of(context).size.width),
//     );
//   }
// }


// class BlogsPage extends StatelessWidget {
//   const BlogsPage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     var padding = MediaQuery.of(context).padding;
//     var safeHeight = height - padding.top - padding.bottom;
//     return Container(
//         color: Color(defaultBackground),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
//                 child: SearchBar(
//                   hintText: 'Search...',
//                   padding:
//                       const WidgetStatePropertyAll(EdgeInsets.only(left: 20)),
//                   leading: (const Icon(
//                     Icons.search,
//                     color: Colors.white,
//                     size: 32,
//                   )),
//                   textStyle: WidgetStatePropertyAll(GoogleFonts.montserrat(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.white)),
//                   elevation: const WidgetStatePropertyAll(0),
//                   backgroundColor:
//                       const WidgetStatePropertyAll(Color(0xff3c3838)),
//                 ),
//               ),

//               SizedBox(
//                 height: 41,
//                 child: Padding(
//               padding: const EdgeInsets.only(top: 21.0),
//                   child: ListView(scrollDirection: Axis.horizontal, children: [
//                     const SizedBox(
//                       width: 32,
//                     ),
//                     Container(
//                       width: 76,
//                       height: 41,
//                       // decoration: BoxDecoration(
//                       //   borderRadius: BorderRadius.circular(20),
//                       //   color: Colors.grey,
//                       // ),
//                       child: Center(child: Text(
//                         '2023-24', style:GoogleFonts.nunitoSans(
//                             fontSize: 18,
//                             color: Colors.white,
//                             ),
//                             )
//                             ),
//                     ),
//                     const SizedBox(
//                       width: 32,
//                     ),
//                     Container(
//                       width: 76,
//                       height: 41,
//                       // decoration: BoxDecoration(
//                       //   borderRadius: BorderRadius.circular(20),
//                       //   color: Colors.grey,
//                       // ),
//                       child: Center(child: Text(
//                         '2022-23', style:GoogleFonts.nunitoSans(
//                             fontSize: 18,
//                             color: Colors.white,
//                             ),
//                             )
//                             ),
//                     ),
//                      const SizedBox(
//                       width: 32,
//                     ),
//                     Container(
//                       width: 76,
//                       height: 41,
//                       // decoration: BoxDecoration(
//                       //   borderRadius: BorderRadius.circular(20),
//                       //   color: Colors.grey,
//                       // ),
//                       child: Center(child: Text(
//                         '2021-22', style:GoogleFonts.nunitoSans(
//                             fontSize: 18,
//                             color: Colors.white,
//                             ),
//                             )
//                             ),
//                     ),
//                      const SizedBox(
//                       width: 32,
//                     ),
//                     Container(
//                       width: 76,
//                       height: 41,
//                       // decoration: BoxDecoration(
//                       //   borderRadius: BorderRadius.circular(20),
//                       //   color: Colors.grey,
//                       // ),
//                       child: Center(child: Text(
//                         '2020-21', style:GoogleFonts.nunitoSans(
//                             fontSize: 18,
//                             color: Colors.white,
//                             ),
//                             )
//                             ),
//                     ),
//                   ]),
//                 ),
//               ),
//               // ignore: prefer_const_constructors
             
//             const SizedBox(
//               height: 13,
//             ),

//               SizedBox(
//                 height: safeHeight,
//                 width: width,
//                 child: Expanded(child: ListView.builder(
//                     itemCount: 9,
//                     scrollDirection: Axis.vertical,
//                     itemBuilder: (context, index){
//                     //create a blogcard
//                     BlogCard blogCard = BlogCard(imagePath: 'assets/images/blogs1.jpeg', title: 'Tanmay Lodha speaks about his internship at IFP' );
//                     return BlogTile(
//                       blogcard: blogCard ,
//                     );
//                 },)
//               ), 
//             ),               
//           ],
//         ),
//       )
//     );
//   }
// }

