import 'package:astro/presentation/providers/get_prefs_provider.dart';
import 'package:astro/presentation/widgets/first_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPageHoroscope extends StatefulWidget {
  final int activeProfileIndex;

  const MainPageHoroscope({super.key, required this.activeProfileIndex});

  @override
  State<MainPageHoroscope> createState() => _MainPageHoroscopeState();
}

class _MainPageHoroscopeState extends State<MainPageHoroscope> {
  // String name = '';
  // String age = '';
  // String location = '';
  // String birthday = '';
  // String zodiacSigns = '';
  // @override
  // void initState() {
  //   super.initState();
  //   loadData();
  // }

  // Future<void> loadData() async {
  //   final subPrefs = Provider.of<SubscriptionProvider>(context, listen: false);
  //   try {
  //     List<String> userData = await subPrefs.getUser();
  //     print(userData);
  //     setState(() {
  //       name = userData[0];
  //       age = userData[4];
  //       location = userData[2];
  //       birthday = userData[1];
  //       zodiacSigns = userData[3];
  //     });
  //   } catch (e) {}
  // }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SubscriptionProvider>(context);
    // final List<String> userData = provider.userData!.split(',');
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
                        "assets/icons/menu_button.svg",
                        height: 32,
                        width: 32,
                      ),
                    ),
                    const Spacer(),
                    //UserData widget

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/images/${provider.userData![3]}.png',
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
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [
                                  Color(0xFFD69CFF),
                                  Color(0xFFB78AF6),
                                  Color(0xFF685BDE),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ).createShader(bounds),
                              child: Text(
                                provider.userData![1],
                                style: GoogleFonts.sen(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                ShaderMask(
                                  shaderCallback: (bounds) =>
                                      const LinearGradient(
                                    colors: [
                                      Color(0xFFD69CFF),
                                      Color(0xFFB78AF6),
                                      Color(0xFF685BDE),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ).createShader(bounds),
                                  child: Text(
                                    '${provider.userData![4]} Age,',
                                    style: GoogleFonts.sen(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                ShaderMask(
                                  shaderCallback: (bounds) =>
                                      const LinearGradient(
                                    colors: [
                                      Color(0xFFD69CFF),
                                      Color(0xFFB78AF6),
                                      Color(0xFF685BDE),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ).createShader(bounds),
                                  child: Text(
                                     provider.userData![3],
                                    style: GoogleFonts.sen(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20.0),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
