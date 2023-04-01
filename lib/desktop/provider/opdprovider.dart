import 'package:flutter/material.dart';

class OpdRegmenu extends ChangeNotifier {
  Opdmenu opdmenu;
  String op;

  OpdRegmenu({required this.opdmenu, required this.op});

  updateopd(OpdRegmenu opdRegmenu) {
    opdmenu = opdRegmenu.opdmenu;
    op = opdRegmenu.op;

    notifyListeners();
  }
}

List<OpdRegmenu> opdlist = [
  OpdRegmenu(opdmenu: Opdmenu.geninfo, op: 'General Information'),
  OpdRegmenu(opdmenu: Opdmenu.vitalpara, op: 'Vital Parameters'),
  OpdRegmenu(opdmenu: Opdmenu.patinfo, op: 'Patient History')
];

enum Opdmenu { geninfo, vitalpara, patinfo }
