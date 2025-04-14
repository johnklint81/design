import 'dart:math';
import '../app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/assets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppTheme.paddingSmall),
          child: Image.asset(Assets.logo, height: 68),
        ),
        Stack(
          children: [
            Text(
              'RECEPT',
              style: GoogleFonts.monoton(
                color: const Color.fromARGB(255, 3, 28, 58),
                fontSize: 48,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: AppTheme.paddingHUGE
                  + AppTheme.paddingHUGE + AppTheme.paddingMedium),
              child: Transform.rotate(
                angle: -20 * pi / 180, // Convert to radians
                child: Text(
                  'Sök',
                  style: GoogleFonts.pacifico(
                    textStyle: const TextStyle(
                      fontSize: 64,
                      color: Color(0xFFFFAC33),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
