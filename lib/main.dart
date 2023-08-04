import 'package:astro/config/theme/custom_theme.dart';
import 'package:astro/presentation/application.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RxSharedPreferences.getInstance();
  runApp(
    Provider(
      create: (_) => CustomTheme(),
      child: const Application(),
    ),
  );
}
