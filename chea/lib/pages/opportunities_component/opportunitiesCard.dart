import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OpportunitiesCard extends StatefulWidget {
  final String title;
  final String stipend;
  final String location;
  final String lastDateOfApply;
  bool isFavourite;
  final VoidCallback onTap;

  OpportunitiesCard({
    super.key,
    required this.title,
    required this.stipend,
    required this.location,
    required this.lastDateOfApply,
    required this.onTap,
    this.isFavourite = false,
  });

  @override
  State<OpportunitiesCard> createState() => _OpportunitiesCardState();
}

class _OpportunitiesCardState extends State<OpportunitiesCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xff201f1f),
              borderRadius: BorderRadius.circular(40)),
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20, bottom: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.nunitoSans(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Stipend: ${widget.stipend}',
                        style: GoogleFonts.montserrat(
                            color: Color(0xff7a7878),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic),
                      ),
                      Text('Location: ${widget.location}',
                          style: GoogleFonts.montserrat(
                              color: Color(0xff7a7878),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic)),
                      Row(
                        children: [
                          Icon(Icons.alarm_rounded,
                              color: Color(0xff7a7878), size: 20),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Apply by: ',
                            style: GoogleFonts.montserrat(
                                color: Color(0xff7a7878),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            widget.lastDateOfApply,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    widget.isFavourite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: widget.isFavourite ? Colors.red : Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.isFavourite = !widget.isFavourite;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}