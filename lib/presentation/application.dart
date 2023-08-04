import 'package:astro/presentation/pages/choose_profile/choose_profile_page.dart';
import 'package:astro/presentation/pages/choose_zodiac_sign/choose_zodiac_sign_page.dart';
import 'package:astro/presentation/providers/get_prefs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          SubscriptionProvider(RxSharedPreferences.getInstance()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => const ChooseProfilePage(),
          "/zodiac_signs": (context) => const ChooseZodiacSignPage(),
        },
      ),
    );
  }
}
