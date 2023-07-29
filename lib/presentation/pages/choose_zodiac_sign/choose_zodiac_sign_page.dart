import 'package:astro/config/theme/custom_theme.dart';
import 'package:astro/presentation/pages/choose_zodiac_sign/components/zodiac_signs_item.dart';
import 'package:astro/presentation/widgets/first_background_widget.dart';
import 'package:astro/presentation/widgets/no_glow_scroll_behavior.dart';
import 'package:astro/utils/enums/horoscope_signs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ChooseZodiacSignPage extends StatefulWidget {
  const ChooseZodiacSignPage({Key? key}) : super(key: key);

  @override
  State<ChooseZodiacSignPage> createState() => _ChooseZodiacSignPageState();
}

class _ChooseZodiacSignPageState extends State<ChooseZodiacSignPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final CustomTheme theme = Provider.of<CustomTheme>(context);
    return Scaffold(
      body: FirstBackgroundWidget(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 120),
                Text(
                  "Choose your zodiac sign:",
                  style: GoogleFonts.sen(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: theme.hintTextColor,
                  ),
                ),
                const SizedBox(height: 38),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    scrollBehavior: NoGlowScrollBehavior(),
                    children: const [
                      ZodiacSignsItem(
                        title: "Water",
                        zodiacSigns: [
                          ZodiacSigns.pisces,
                          ZodiacSigns.cancer,
                          ZodiacSigns.scorpio,
                        ],
                      ),
                      ZodiacSignsItem(
                        title: "Fire",
                        zodiacSigns: [
                          ZodiacSigns.aries,
                          ZodiacSigns.leo,
                          ZodiacSigns.sagittarius,
                        ],
                      ),
                      ZodiacSignsItem(
                        title: "Air",
                        zodiacSigns: [
                          ZodiacSigns.libra,
                          ZodiacSigns.aquarius,
                          ZodiacSigns.gemini,
                        ],
                      ),
                      ZodiacSignsItem(
                        title: "Ground",
                        zodiacSigns: [
                          ZodiacSigns.virgo,
                          ZodiacSigns.capricorn,
                          ZodiacSigns.taurus,
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 62),
                Text(
                  "Haven't find your sign?",
                  style: GoogleFonts.sen(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: theme.hintTextColor,
                  ),
                ),
                const SizedBox(height: 26),
                SmoothPageIndicator(
                  controller: _pageController,
                  effect: ColorTransitionEffect(
                    dotColor: theme.inactiveDotColor,
                    activeDotColor: Colors.white,
                    dotWidth: 14,
                    dotHeight: 14,
                    spacing: 21,
                  ),
                  onDotClicked: (index) {
                    _pageController.animateToPage(
                      index,
                      curve: Curves.easeIn,
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                    );
                  },
                  count: 4,
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
