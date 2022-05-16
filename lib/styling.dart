import 'package:flutter/material.dart';
//主题页
class AppTheme {
  AppTheme._();

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);

  static const Color primary = Color(0xFF006493);
  static const Color on_primary = Color(0xFFFFFFFF);
  static const Color primary_container = Color(0xFFC7E6FF);
  static const Color on_primary_container = Color(0xFF001E30);
  static const Color secondary = Color(0xFF805600);
  static const Color on_secondary = Color(0xFFFFFFFF);
  static const Color secondary_container = Color(0xFFFFDDAA);
  static const Color on_secondary_container = Color(0xFF281800);
  static const Color error = Color(0xFFBA1B1B);
  static const Color on_error = Color(0xFFFFFFFF);
  static const Color error_container = Color(0xFFFFDAD4);
  static const Color on_error_container = Color(0xFF410001);
  static const Color background = Color(0xFFFCFCFF);
  static const Color on_background = Color(0xFF1A1C1E);
  static const Color surface_0 = Color(0xFFFCFCFF);
  static const Color on_surface = Color(0xFF1A1C1E);
  static const Color surface_variant = Color(0xFFDDE3EA);
  static const Color on_surface_variant = Color(0xFF41474D);
  static const Color outline = Color(0xFF72787E);

  static const Color surface_1 = Color(0xFFFEFEFE);
  static const Color surface_2 = Color(0xFFEDF2F8);
  static const Color surface_3 = Color(0xFFE6EEF6);
  static const Color surface_4 = Color(0xFF4D4D4E);
  static const Color surface_5 = Color(0xFF323233);

  static const Color inverse_surface_0 = Color(0xFF2F3032);
  static const Color inverse_on_surface = Color(0xFFF0F0F3);
  static const Color inverse_primary = Color(0xFF87CEFF);

  static const TextStyle body_small = TextStyle(
    fontSize: 12,
    letterSpacing: 0.4,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle body_medium = TextStyle(
    fontSize: 14,
    letterSpacing: 0.25,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle body_large = TextStyle(
    fontSize: 16,
    letterSpacing: 0.4,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle label_small = TextStyle(
    fontSize: 11,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle label_medium = TextStyle(
    fontSize: 12,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle label_large = TextStyle(
    fontSize: 14,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle title_small = TextStyle(
    fontSize: 14,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle title_medium = TextStyle(
    fontSize: 16,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle title_large = TextStyle(
    fontSize: 22,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle headline_small = TextStyle(
    fontSize: 24,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle headline_medium = TextStyle(
    fontSize: 28,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle headline_large = TextStyle(
    fontSize: 32,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle subhead1 = TextStyle(
    fontSize: 16,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    letterSpacing: 0.5,
    fontWeight: FontWeight.normal,
    color: AppTheme.on_surface,
  );

  static const TextStyle body1_red = TextStyle(
    fontSize: 16,
    letterSpacing: 0.5,
    fontWeight: FontWeight.normal,
    color: AppTheme.error,
  );

  static const TextStyle menu = TextStyle(
    fontSize: 18,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
    color: AppTheme.on_primary,
  );

  static const TextStyle dialog = TextStyle(
    fontSize: 14,
    letterSpacing: 0.25,
    fontWeight: FontWeight.normal,
    color: AppTheme.on_surface_variant,
  );

  static const TextStyle dialog_main = TextStyle(
    fontSize: 24,
    letterSpacing: 0,
    fontWeight: FontWeight.normal,
    color: AppTheme.on_surface,
  );
}
