import 'package:flutter/material.dart';

abstract class Styles {
  static const TextStyle text1 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 18);
  static const TextStyle text2 =
      TextStyle(fontWeight: FontWeight.w800, fontSize: 42);

  // static const ButtonStyle button1 = ButtonStyle(
  //     fixedSize: MaterialStatePropertyAll(Size(100, 60)),
  //     backgroundColor: theme);

  // static ThemeData darkTheme = ThemeData(
  //   primaryColor: Colors.black,
  //   brightness: Brightness.dark,
  //   dividerColor: Colors.black12,
  //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
  //       .copyWith(background: const Color(0xFF212121))
  //       .copyWith(secondary: Colors.white),
  // );
}
