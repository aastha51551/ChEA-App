// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayCard2 extends StatefulWidget {
  final String backgroundImage;
  final String name;
  final String email;
  final String mobilenumber;

  const DisplayCard2(
      {super.key,
      required this.backgroundImage,
      required this.name,
      required this.email,
      required this.mobilenumber});

  @override
  _DisplayCard2State createState() => _DisplayCard2State();
}

class _DisplayCard2State extends State<DisplayCard2> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(39),
            gradient: isTapped
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.5), Colors.black])
                : const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black]),
          ),
          child: Column(
            mainAxisAlignment:
                isTapped ? MainAxisAlignment.center : MainAxisAlignment.end,
            children: [
              if (!isTapped)
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Text(
                      widget.name,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunitoSans(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              if (isTapped)
                Column(
                  children: [
                    Center(
                      child: Text(
                        widget.name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunitoSans(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: widget.email,
                        );
                        if (await canLaunchUrl(emailLaunchUri)) {
                          await launchUrl(emailLaunchUri);
                        } else {
                          throw 'Could not launch ${widget.email}';
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.email,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final Uri phoneLaunchUri =
                            Uri(scheme: 'tel', path: widget.mobilenumber);
                        if (await canLaunchUrl(phoneLaunchUri)) {
                          await launchUrl(phoneLaunchUri);
                        } else {
                          throw 'Could not launch ${widget.mobilenumber}';
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/Phone.svg',
                              height: 24,
                              width: 24,
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn)),
                          const SizedBox(width: 5),
                          Text(
                            widget.mobilenumber,
                            style: GoogleFonts.nunitoSans(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
