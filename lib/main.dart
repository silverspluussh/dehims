import 'package:flutter/material.dart';
import 'package:hopsysadmin/custom/responsiveness.dart';
import 'package:hopsysadmin/desktop/provider/menuprovider.dart';
import 'package:hopsysadmin/desktop/provider/opdprovider.dart';
import 'package:hopsysadmin/desktop/provider/themeprovider.dart';
import 'package:hopsysadmin/desktop/screen/desktop.dart';
import 'package:hopsysadmin/mobile/mobile.dart';
import 'package:hopsysadmin/tablet/tablet.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/l10n.dart';

late SharedPreferences preferences;

Future<void> main() async {
  runApp(const App());
  preferences = await SharedPreferences.getInstance();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => themestate)),
        ChangeNotifierProvider(
            create: (context) => Meem(menus: Menus.dashboard)),
        ChangeNotifierProvider(
            create: (context) => OpdRegmenu(opdmenu: Opdmenu.geninfo, op: ''))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hospital Sys',
        supportedLocales: L10n.all,
        home: const Scaffold(
            body: Responsive(
                mobile: Mobile(), tablet: Tablet(), desktop: Desktop())),
      ),
    );
  }
}
