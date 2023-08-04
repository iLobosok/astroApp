import 'package:flutter/material.dart';

class MainPageHoroscope extends StatefulWidget {
  final int activeProfileIndex;
  const MainPageHoroscope({super.key, required this.activeProfileIndex});

  @override
  State<MainPageHoroscope> createState() => _MainPageHoroscopeState();
}

class _MainPageHoroscopeState extends State<MainPageHoroscope> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

      ),
    );
  }
}