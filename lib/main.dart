import 'package:astro/config/theme/custom_theme.dart';
import 'package:astro/presentation/application.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider(
      create: (_) => CustomTheme(),
      child: const Application(),
    ),
  );
}
