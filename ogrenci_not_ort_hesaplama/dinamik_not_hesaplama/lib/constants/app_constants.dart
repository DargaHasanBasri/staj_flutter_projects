import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor mainColor = Colors.indigo;

  static const String titleText = 'Ortalama Hesapla';

  static final TextStyle titleStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: mainColor,
  );

  static BorderRadius borderRadius = BorderRadius.circular(24);

  static final TextStyle ortGosterBodyStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: mainColor,
  );

  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: mainColor,
  );
}
