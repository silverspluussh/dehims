import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorDarkTheme,
    appBarTheme: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: kContentColorDarkTheme,
          iconTheme: const IconThemeData(color: kContentColorLightTheme),
          centerTitle: true,
          toolbarTextStyle: Theme.of(context)
              .textTheme
              .apply(
                bodyColor: kContentColorLightTheme,
              )
              .bodyMedium,
          titleTextStyle: Theme.of(context)
              .textTheme
              .apply(
                bodyColor: kContentColorLightTheme,
              )
              .titleLarge,
        ),
    iconTheme: const IconThemeData(color: kContentColorLightTheme),
    textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Vidaloka',
          bodyColor: kContentColorLightTheme,
        ),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
    ),
    cardColor: kContentColorDarkTheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorLightTheme,
    appBarTheme: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: kContentColorLightTheme,
          iconTheme: const IconThemeData(color: kContentColorDarkTheme),
          centerTitle: true,
          toolbarTextStyle: Theme.of(context)
              .textTheme
              .apply(
                bodyColor: kContentColorDarkTheme,
              )
              .bodyMedium,
          titleTextStyle: Theme.of(context)
              .textTheme
              .apply(
                bodyColor: kContentColorDarkTheme,
              )
              .titleLarge,
        ),
    iconTheme: const IconThemeData(color: kContentColorDarkTheme),
    textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Vidaloka',
          bodyColor: kContentColorDarkTheme,
        ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
    ),
    cardColor: const Color(0xFF00112b),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}
