import 'package:flutter/material.dart';

class Meem with ChangeNotifier {
  Menus menus;

  Meem({required this.menus});

  onupdate(Meem meem) {
    menus = meem.menus;
    notifyListeners();
  }
}

enum Menus {
  dashboard,
  opdvitals,
  opdreg,
  emergencyform,
  emergencylist,
  consultation,
  ward,
  enquiry,
  category,
  addroom,
  addbed,
  pharmacy,
  companyinfo,
  department,
  designation,
  billgroup,
  particularbill,
  company,
  diagnosis,
  surgicalpackage,
  insurance,
  acknowledgerep,
  medicine,
  systempref,
  backup,
  systemdatabase,
  lab,
  report,
  indivrep,
  outrep,
  admpatrep,
  discharged,
  dailysales,
  docotrsfee,
  acknowlegde,
  chats,
  bill,
  billinglist,
  expense,
  inventory,
  miscell,
  info,
  settings,
  patientlist,
  addpatient,
}
