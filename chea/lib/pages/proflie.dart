// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:chea/utils/bottom_navbar.dart';
import 'package:chea/utils/cheagpt.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

int defaultBackground = 0xff09050d;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isPage1ResumeUploaded = false;
  bool isPage2ResumeUploaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     extendBodyBehindAppBar: false,
      backgroundColor: Color(defaultBackground),
      floatingActionButton: ChEAGPT(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: 3,
        onItemTapped: (int index) {
          if (index == 1) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/blog', (route) => false);
          } else if (index == 2)
            Navigator.pushNamedAndRemoveUntil(
                context, '/opportunities', (route) => false);
          else if (index == 0)
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
        },
      ),
      body: SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 75),
            Padding(
              padding: const EdgeInsets.only(top:15.0,left:15),
              child: RichText(
                text: TextSpan(
                  text:'Welcome, ',
                  style: GoogleFonts.nunitoSans(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w400),

                children: <TextSpan>[
                  TextSpan(
                    text: 'Steve',
                    style: GoogleFonts.nunitoSans(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                  ),
                ]),
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Text(
                '22b0400@iitb.ac.in',
                style: GoogleFonts.nunitoSans(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
                padding: const EdgeInsets.only(left:15),
                child: Text(
                  'Resumes',
                  style: GoogleFonts.nunitoSans(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical:20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: const Color(0xff3c3838),
                    width: 2,
                  ),
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff3c3838),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Icon(Icons.file_copy_outlined,color: Colors.white,size: 30,)),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Text(
                          '1 Page Resume',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),

                        ),
                        Text(
                          'Sign in with your one \npage resume here',
                          style: GoogleFonts.montserrat(
                            color: const Color (0xff666161),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),


                      ],
                    ),
                    TextButton(
                        onPressed: (){
                          setState(() {
                            isPage1ResumeUploaded = !isPage1ResumeUploaded;
                          });
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: isPage1ResumeUploaded? const Color(0xff3c3838): null,

                            borderRadius: BorderRadius.circular(15),
                            gradient: !isPage1ResumeUploaded? const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xffFF7A00),Color(0xffD45151)],
                            ): null),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                            child: Text(isPage1ResumeUploaded?  'Uploaded':"Upload",
                              style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              ),),
                          ),
                        ))
                  ],
                )
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical:20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: const Color(0xff3c3838),
                      width: 2,
                    ),
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xff3c3838),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Icon(Icons.file_copy_outlined,color: Colors.white,size: 30,)),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Text(
                            '2 Page Resume',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),

                          ),
                          Text(
                            'Sign in with your one \npage resume here',
                            style: GoogleFonts.montserrat(
                              color: const Color (0xff666161),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                            ),
                          ),


                        ],
                      ),
                      TextButton(
                          onPressed: (){
                            setState(() {
                              isPage2ResumeUploaded = !isPage2ResumeUploaded;
                            });
                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: isPage2ResumeUploaded? const Color(0xff3c3838): null,

                                borderRadius: BorderRadius.circular(15),
                                gradient: !isPage2ResumeUploaded? const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Color(0xffFF7A00),Color(0xffD45151)],
                                ): null),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                              child: Text(isPage2ResumeUploaded?  'Uploaded':"Upload",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                ),),
                            ),
                          ))
                    ],
                  )
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left:20,top: 20,bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: const Color(0xff3c3838),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saved',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xff201f1f)
                                ),
                                child: const Icon(Icons.favorite,color: Color(0xffd45151),size: 30,),

                              ),
                              Expanded(
                                child: TextButton(onPressed: (){
                                  Navigator.pushNamed(context, '/favopportunities');
                                }, child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Favourite Opportunities',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),),
                                    const Icon(Icons.arrow_forward_ios,color: Colors.white,)
                                  ],
                                )),
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: const EdgeInsets.only(left:60.0),
                          child: Divider(
                            color: Color(0xff3c3838),
                            thickness: 2,

                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: const Color(0xff201f1f)
                                ),
                                child: const Icon(Icons.bookmark_border,color:  Colors.white,size: 30,),

                              ),
                              Expanded(
                                child: TextButton(onPressed: (){
                                  Navigator.pushNamed(context, '/bookmarks');
                                }, child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Bookmarked Articles',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),),
                                    const Icon(Icons.arrow_forward_ios,color: Colors.white,)
                                  ],
                                )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 25,
                    child: Container(
                      height: 50,
                      width: 10,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.amber[900],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: [

                  Container(
                    padding: const EdgeInsets.only(left:20,top: 20,bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: const Color(0xff3c3838),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'More',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: const Color(0xff201f1f)
                                ),
                                child: const Icon(Icons.settings,color: Colors.white,size: 30,),

                              ),
                              Expanded(
                                child: TextButton(onPressed: (){}, child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Settings',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),),
                                    const Icon(Icons.arrow_forward_ios,color: Colors.white,)
                                  ],
                                )),
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: const EdgeInsets.only(left:60.0),
                          child: Divider(
                            color: Color(0xff3c3838),
                            thickness: 2,

                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: const Color(0xff201f1f)
                                ),
                                child: const Icon(Icons.login,color:  Colors.white,size: 30,),

                              ),
                              Expanded(
                                child: TextButton(onPressed: (){}, child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Log Out',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),),
                                    const Icon(Icons.arrow_forward_ios,color: Colors.white,)
                                  ],
                                )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 25,
                    child: Container(
                      height: 50,
                      width: 10,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.amber[900],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40,)

          ],
        )

      ),
    );
  }
}
