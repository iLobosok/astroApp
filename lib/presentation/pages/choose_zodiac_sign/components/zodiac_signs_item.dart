import 'package:astro/utils/enums/horoscope_signs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ZodiacSignsItem extends StatelessWidget {
  final String title;
  final List<ZodiacSigns> zodiacSigns;

  const ZodiacSignsItem({
    Key? key,
    required this.title,
    required this.zodiacSigns,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.sen(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 52),
        GestureDetector(
          onTap: () {
            print(zodiacSigns[0].name);
            Navigator.of(context).pushReplacementNamed("/");
          },
          child: Image.asset(
            "assets/images/${zodiacSigns[0].name}.png",
          ),
        ),
        const SizedBox(height: 62),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  print(zodiacSigns[1].name);
                  Navigator.of(context).pushReplacementNamed("/");
                },
                child: Image.asset(
                  "assets/images/${zodiacSigns[1].name}.png",
                ),
              ),
              GestureDetector(
                onTap: () {
                  print(zodiacSigns[2].name);
                  Navigator.of(context).pushReplacementNamed("/");
                },
                child: Image.asset(
                  "assets/images/${zodiacSigns[2].name}.png",
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
