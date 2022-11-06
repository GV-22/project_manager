// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppStyle {
  static double radiusValue = 15.0;
  static double boutonHeight = 60.0;
  static const double horizontalPadding = 20.0;

  static TextStyle formInputTextStyle =
      const TextStyle(fontSize: 13, color: Colors.grey);

  static Color get blueDark1Color => const Color(0xFF0A0871);
  static Color get blueDark2Color => const Color(0xFF0032B0);
  static Color get blueDark3Color => const Color(0xFF0032B0);
  static Color get bluePrimaryColor => const Color(0xFF0C50FA);
  static Color get bluePrimaryLightColor => const Color(0xFF1A5AFF);
  static Color get bluePrimaryLight2Color => const Color(0xFF2D81FF);
  static Color get white7 => Colors.white.withOpacity(.7);

  static Color getOverlayColor = bluePrimaryColor.withOpacity(0.3);

  static MaterialColor createMaterialColor(Color color) {
    final List<double> strengths = [.05];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    // ignore: avoid_function_literals_in_foreach_calls
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  static TextStyle projectTitleStyle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle titleStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 17);

  static TextStyle subTitleStyle = const TextStyle(color: Colors.grey, fontSize: 12);

  static TextStyle smallWhiteTextStyle = TextStyle(color: white7, fontSize: 11);

  static TextStyle headline1 = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static TextStyle whiteHeadline1 = const TextStyle(
    color: Colors.white,
    // fontWeight: FontWeight.bold,
    fontSize: 17,
  );

  static TextStyle headline2 = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  static TextStyle whiteHeadline2 = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  // Used for sub-title
  static TextStyle subtitle1 =
      const TextStyle(color: Colors.black, fontSize: 20);
  static TextStyle bodyText1 =
      const TextStyle(fontSize: 15, color: Colors.black);

  static InputDecoration inputDecoration(String labelText,
      {Widget? suffixeIcon}) {
    return InputDecoration(
      labelText: labelText,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 0.7, color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(AppStyle.radiusValue)),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppStyle.radiusValue)),
      ),
      fillColor: Colors.white70,
      labelStyle: AppStyle.formInputTextStyle,
      // contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      contentPadding: suffixeIcon == null
          ? null
          : const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      suffix: suffixeIcon,
    );
  }
}
