import 'package:astro/presentation/pages/choose_profile/choose_profile_page.dart';
import 'package:astro/presentation/pages/choose_zodiac_sign/choose_zodiac_sign_page.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const ChooseProfilePage(),
        "/zodiac_signs": (context) => const ChooseZodiacSignPage(),
      },
    );
  }
}
