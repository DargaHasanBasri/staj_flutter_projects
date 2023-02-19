import 'package:flutter/material.dart';

class DataHelper {
  static List<String> _tumDerslerinHarfleri() {
    return [
      'AA',
      'AB',
      'BB',
      'CB',
      'CC',
      'DC',
      'DD',
      'FD',
      'FF',
    ];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 0.1; // yukarıda verdiğim değerlerden farklı değer vermem gerekiyor
      //farklı vermezsem value aynı olan iki değer gözüküyor ve uygulama patlıyor hata veriyor
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDerslerinHarfleri()
        .map(
          (e) => DropdownMenuItem(
            value: _harfiNotaCevir(e),
            child: Text(e),
          ),
        )
        .toList();
  }
}
