import 'package:astro/presentation/pages/choose_profile/choose_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class ApproveAccountPage extends StatefulWidget {
  final String zodiacSign;
  final String name;
  final String birth;
  final String location;
  const ApproveAccountPage({super.key, required this.zodiacSign, required this.name, required this.birth, required this.location});

  @override
  State<ApproveAccountPage> createState() => ApproveAccountPageState();
}

final rxPrefs = RxSharedPreferences.getInstance();

class ApproveAccountPageState extends State<ApproveAccountPage> {
  late TextEditingController _nameText;
  late TextEditingController _birthDayText;
  late TextEditingController _locationBirthText;
  bool? isPro;
  @override
  void initState() {
    super.initState();
    _nameText = TextEditingController();
    _birthDayText = TextEditingController();
    _locationBirthText = TextEditingController();
  }

  @override
  void dispose() {
    _nameText.dispose();
    _birthDayText.dispose();
    _locationBirthText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ChooseProfilePage(),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          left: 30.0,
          right: 30.0,
          child: Container(
            height: MediaQuery.of(context).size.height * .5,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: Card(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFD69CFF),
                      Color(0xFFB78AF6),
                      Color(0xFF685BDE)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Create your new profile',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
              ),
            ),
          ),
        ),
        ),
      ],
    );
  }
}