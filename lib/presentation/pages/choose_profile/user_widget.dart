import 'package:astro/utils/enums/horoscope_signs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserWidgetClass extends StatelessWidget {
  final ZodiacSigns zodiacSign;
  final String username;
  final String userbirth;
  final String userLocation;
  final String userage;
  const UserWidgetClass(
      {super.key,
      required this.zodiacSign,
      required this.username,
      required this.userbirth,
      required this.userLocation,
      required this.userage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width * .8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: const Color(0xFF333333),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            'assets/images/${zodiacSign.name}.png',
            height: 80,
            width: 80,
          ),
          const SizedBox(
            width: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                username,
                style: GoogleFonts.sen(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '$userage Age,',
                    style: GoogleFonts.sen(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    userLocation,
                    style: GoogleFonts.sen(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
