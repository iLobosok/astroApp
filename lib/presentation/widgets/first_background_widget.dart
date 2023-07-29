import 'package:astro/config/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstBackgroundWidget extends StatelessWidget {
  final Widget child;
  const FirstBackgroundWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomTheme theme = Provider.of<CustomTheme>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.backgroundColor1,
            theme.backgroundColor2,
          ],
        ),
      ),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/purple_top_bar.png",
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/images/sky_bg.png",
            fit: BoxFit.cover,
          ),
          child,
        ],
      ),
    );
  }
}
