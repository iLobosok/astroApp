import 'package:astro/config/theme/custom_theme.dart';
import 'package:astro/presentation/widgets/first_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChooseProfilePage extends StatelessWidget {
  const ChooseProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomTheme theme = Provider.of<CustomTheme>(context);
    return Scaffold(
      body: FirstBackgroundWidget(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/icons/home_icon.svg",
                        height: 32,
                        width: 32,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed("/zodiac_signs");
                      },
                      child: SvgPicture.asset(
                        "assets/icons/add_icon.svg",
                        height: 32,
                        width: 32,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Choose your profile:",
                style: GoogleFonts.sen(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: theme.hintTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
