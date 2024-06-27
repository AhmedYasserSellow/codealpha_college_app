import 'package:flutter/material.dart';

abstract class PrimaryColors {
  static const main = Color(0xffFC724D);
  static const surface = Color(0xffFEE3DB);
  static const focus = Color(0xffFFFAF9);
}

abstract class SecondaryColors {
  static const main = Color(0xff5644A0);
  static const surface = Color(0xffDDDAEC);
  static const focus = Color(0xffF9F8FF);
}

abstract class AccentColors {
  static const blue = Color(0xff3F8CFF);
  static const coral = Color(0xffFF4D4D);
  static const indigo = Color(0xffBA59FE);
  static const yellow = Color(0xffFFDC60);
}

abstract class NotificationColors {
  static const sucess = Color(0xff4FC068);
  static const danger = Color(0xffFF3D00);
  static const warning = Color(0xffFF6628);
}

abstract class NeutralColors {
  static const k500 = Color(0xff2D2D3A);
  static const k400 = Color(0xFF50505B);
  static const k300 = Color(0xFF96969C);
  static const k200 = Color(0xFFB9B9BD);
  static const k100 = Color(0xFFD5D5D8);
  static const kWhiteGrey = Color(0xFFF0F0F0);
  static const kWhite = Colors.white;
}

ThemeData theme = ThemeData(
  fontFamily: 'Inter',
  scaffoldBackgroundColor: NeutralColors.k500,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
  ),
);
