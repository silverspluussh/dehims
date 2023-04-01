import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopsysadmin/custom/constants.dart';
import 'package:hopsysadmin/desktop/screen/dashboard.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';

import '../../l10n/l10n.dart';
import '../provider/locale.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  bool isclicked = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final lprovider = Provider.of<LanguageProvider>(context, listen: false);
    final locale = lprovider.locale ?? const Locale('en');
    return Container(
      decoration: const BoxDecoration(color: kPrimaryColor),
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButtonHideUnderline(
                    child: DropdownButton(
                  value: locale,
                  icon: Container(width: 20),
                  items: L10n.all.map((e) {
                    var langflag = L10n.getflag(e.languageCode);
                    return DropdownMenuItem(
                      value: e,
                      child: Center(
                        child: Text(
                          langflag,
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 8, 8, 8)),
                        ),
                      ),
                      onTap: () {
                        Provider.of<LanguageProvider>(context, listen: false)
                            .setlocalizations(e);
                      },
                    );
                  }).toList(),
                  onChanged: (_) {},
                )),
                const SizedBox(width: 50),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            width: size.width,
            height: size.height - 70,
            decoration: const BoxDecoration(color: kPrimaryColor),
            child: Center(
                child: SizedBox(
              width: size.width * 0.35,
              height: size.height * 0.9,
              child: isclicked
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _pageiconAsset(image: 'assets/startpageicon.png'),
                        const SizedBox(height: 30),
                        _pagetextwidget(
                            text: AppLocalizations.of(context)?.hello ??
                                'WELCOME TO dims',
                            color: Colors.white),
                        const SizedBox(height: 50),
                        _buttonwidget(context)
                      ],
                    )
                  : Column(
                      children: [
                        _closebtnwidget(),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: size.width * 0.34,
                          height: size.height * 0.78,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Center(
                                  child: _pageiconAsset(
                                      image: 'assets/logocolor.png')),
                              const SizedBox(height: 10),
                              _pagetextwidget(
                                  text: AppLocalizations.of(context)?.login ??
                                      'LOGIN',
                                  color: Colors.black),
                              const SizedBox(height: 25),
                              Form(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: _formlablewidget(
                                              label:
                                                  AppLocalizations.of(context)
                                                          ?.username ??
                                                      'Username')),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: size.width * 0.25,
                                        height: 60,
                                        child: TextFormField(
                                            validator: ((value) {
                                              if (value == null) {
                                                return AppLocalizations.of(
                                                            context)
                                                        ?.cannotBlank ??
                                                    'field cannot be blank pls';
                                              }
                                              return null;
                                            }),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: const BorderSide(
                                                    width: 1.5),
                                              ),
                                            )),
                                      ),
                                      const SizedBox(height: 20),
                                      _formlablewidget(
                                          label: AppLocalizations.of(context)
                                                  ?.password ??
                                              'Password'),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: size.width * 0.25,
                                        height: 60,
                                        child: TextFormField(
                                            validator: ((value) {
                                              if (value == null) {
                                                return AppLocalizations.of(
                                                            context)
                                                        ?.cannotBlank ??
                                                    'field cannot be blank pls';
                                              }
                                            }),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: const BorderSide(
                                                    width: 1.5),
                                              ),
                                            )),
                                      ),
                                      const SizedBox(height: 30),
                                      TextButton(
                                          onPressed: (() =>
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Dashboard()))),
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            width: size.width * 0.25,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 160, 156, 255),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                                child: _pagetextwidget(
                                                    text: AppLocalizations.of(
                                                                context)
                                                            ?.login ??
                                                        'Login',
                                                    color: Colors.white)),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
            )),
          ),
        ],
      ),
    );
  }

  Text _formlablewidget({required String label}) {
    return Text(
      label,
      style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: const Color.fromARGB(255, 138, 136, 136)),
    );
  }

  Center _closebtnwidget() {
    return Center(
        child: IconButton(
      hoverColor: Colors.red,
      alignment: Alignment.center,
      onPressed: (() => setState(() {
            isclicked = !isclicked;
          })),
      icon: const ImageIcon(AssetImage('assets/closebtn.png')),
      iconSize: 40,
    ));
  }

  TextButton _buttonwidget(BuildContext context) {
    return TextButton(
      onPressed: (() => setState(() {
            isclicked = !isclicked;
          })),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.21,
        height: 50,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 191, 222, 247),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: _pagetextwidget(
                text: AppLocalizations.of(context)?.db ?? 'Database',
                color: Colors.white)),
      ),
    );
  }

  Text _pagetextwidget({required String text, required Color color}) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: color, fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  Image _pageiconAsset({required String image}) => Image.asset(image);
}
