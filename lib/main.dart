import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hopsysadmin/custom/responsiveness.dart';
import 'package:hopsysadmin/desktop/provider/locale.dart';
import 'package:hopsysadmin/desktop/provider/menuprovider.dart';
import 'package:hopsysadmin/desktop/provider/opdprovider.dart';
import 'package:hopsysadmin/desktop/provider/themeprovider.dart';
import 'package:hopsysadmin/desktop/screen/desktop.dart';
import 'package:hopsysadmin/mobile/mobile.dart';
import 'package:hopsysadmin/tablet/tablet.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
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
        ChangeNotifierProvider(create: ((context) => LanguageProvider())),
        ChangeNotifierProvider(create: ((context) => themestate)),
        ChangeNotifierProvider(
            create: (context) => Meem(menus: Menus.dashboard)),
        ChangeNotifierProvider(
            create: (context) => OpdRegmenu(opdmenu: Opdmenu.geninfo, op: ''))
      ],
      builder: (context, child) {
        final langprovider = Provider.of<LanguageProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: langprovider.locale,
          title: 'Hospital Sys',
          supportedLocales: L10n.all,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: const Scaffold(
              body: Responsive(
                  mobile: Mobile(), tablet: Tablet(), desktop: Desktop())),
        );
      },
    );
  }
}
