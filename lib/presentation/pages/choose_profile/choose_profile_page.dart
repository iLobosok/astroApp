import 'package:astro/config/theme/custom_theme.dart';
import 'package:astro/presentation/pages/main_page/main_page_horoscope.dart';
import 'package:astro/presentation/providers/get_prefs_provider.dart';
import 'package:astro/presentation/widgets/first_background_widget.dart';
import 'package:astro/utils/enums/horoscope_signs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'user_widget.dart';

class ChooseProfilePage extends StatefulWidget {
  const ChooseProfilePage({Key? key}) : super(key: key);

  @override
  State<ChooseProfilePage> createState() => _ChooseProfilePageState();
}

class _ChooseProfilePageState extends State<ChooseProfilePage> {
  @override
  Widget build(BuildContext context) {
    final CustomTheme theme = Provider.of<CustomTheme>(context);
    final subscprionProvider = Provider.of<SubscriptionProvider>(context);

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
              const SizedBox(height: 40),
              FutureBuilder<List<String>>(
                future: subscprionProvider.getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Text(
                        'Haven\'t profiles',
                        style: GoogleFonts.sen(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return Container(
                        height: MediaQuery.of(context).size.height * .7,
                        width: MediaQuery.of(context).size.width * .9,
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String userDataString = snapshot.data![index];
                            List<String> userData = userDataString.split(',');
                            return Dismissible(
                              key: ValueKey('deleteUser$index'),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                subscprionProvider.deleteUser();
                              },
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => MainPageHoroscope(
                                        activeProfileIndex: index,
                                      ),
                                    ),
                                  );
                                },
                                child: UserWidgetClass(
                                  zodiacSign: ZodiacSigns.values.firstWhere(
                                      (e) => e.name == userData[3]),
                                  username: userData[0],
                                  userbirth: userData[1],
                                  userLocation: userData[2],
                                  userage: userData[4],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
