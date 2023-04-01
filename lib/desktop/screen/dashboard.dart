import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopsysadmin/custom/constants.dart';
import 'package:hopsysadmin/custom/responsiveness.dart';
import 'package:hopsysadmin/desktop/provider/menuprovider.dart';
import 'package:hopsysadmin/desktop/provider/themeprovider.dart';
import 'package:hopsysadmin/desktop/screen/opdvitals.dart';
import 'package:hopsysadmin/desktop/screen/patient.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
            desktop: Consumer<Themeswitch>(
                builder: ((context, value, child) => Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          gradient: value.isthemeon
                              ? const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromARGB(255, 205, 205, 243),
                                    Color.fromARGB(255, 245, 232, 228),
                                  ],
                                )
                              : const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromARGB(255, 63, 56, 54),
                                    Color.fromARGB(255, 54, 51, 63),
                                  ],
                                )),
                      child: Column(
                        children: [
                          _appbar(context),
                          Row(
                            children: [
                              _sidemenu(context),
                              Consumer<Meem>(
                                builder: (context, value, child) {
                                  switch (value.menus.name) {
                                    case 'dashboard':
                                      return const DashboardHome();
                                    case 'patientlist':
                                      return const Patient();
                                    case 'addpatient':
                                      return const AddPatient();
                                    case 'opdvitals':
                                      return const Opdvitals();
                                    case 'opdreg':
                                      return const OpdReg();
                                  }
                                  return Container();
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ))),
            mobile: Container(),
            tablet: Container()));
  }

  SizedBox _appbar(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.135,
              height: 90,
              child: Image.asset('assets/logocolor.png')),
          const SizedBox(width: 30),
          _searchformwidget(),
          const Spacer(),
          _userprofile(),
          const SizedBox(width: 10),
          _addpatientbtn(),
          const SizedBox(width: 10),
          const Badge(
            child: Icon(
              Icons.notifications,
              size: 40,
              color: Color.fromARGB(255, 150, 148, 148),
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
    );
  }

  InkWell _addpatientbtn() {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.13,
        height: 40,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              'Add patient',
              style: GoogleFonts.poppins(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  SizedBox _userprofile() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.17,
      height: 70,
      child: ListTile(
        leading: const CircleAvatar(
          radius: 18,
          backgroundColor: Color.fromARGB(255, 241, 241, 241),
        ),
        title: Text(
          'Asomaning User',
          style: GoogleFonts.poppins(color: const Color.fromARGB(255, 8, 8, 8)),
        ),
        subtitle: Text(
          'Medical officer',
          style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 151, 150, 150)),
        ),
      ),
    );
  }

  Container _searchformwidget() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.15,
        height: 40,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 231, 231, 231)),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'search patients',
            hintStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                color: const Color.fromARGB(255, 82, 81, 81),
                fontSize: 15),
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search),
          ),
        ));
  }

//sidemenuwidget
  _sidemenu(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.21,
      height: MediaQuery.of(context).size.height - 100,
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer<Meem>(
              builder: ((context, value, child) => Column(
                    children: [
                      const SizedBox(height: 25),
                      ListTile(
                          onTap: () => Provider.of<Meem>(context, listen: false)
                              .onupdate(Meem(menus: Menus.dashboard)),
                          leading: const ImageIcon(
                              AssetImage('assets/dashboard.png')),
                          title: Text('Dashboard',
                              style: GoogleFonts.poppins(
                                color: Menus.dashboard == value.menus
                                    ? Colors.blue
                                    : Colors.black,
                                fontSize: 16,
                              ))),
                      ExpansionTile(
                          leading: const ImageIcon(
                              AssetImage('assets/addpatient.png')),
                          title: Text('Patient',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          children: [
                            ListTile(
                              title: Text(
                                'Patient List',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.patientlist
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.patientlist)),
                            ),
                            ListTile(
                              title: Text(
                                'Add Patient',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.addpatient
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.addpatient)),
                            ),
                          ]),

                      ExpansionTile(
                          leading: const ImageIcon(
                              AssetImage('assets/stethoscope.png')),
                          title: Text('OPD Vitals',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          children: [
                            ListTile(
                              title: Text(
                                'OPD List',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.opdvitals
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.opdvitals)),
                            ),
                            ListTile(
                              title: Text(
                                'Registration',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.opdreg
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.opdreg)),
                            ),
                          ]),
                      //emergency
                      ExpansionTile(
                          leading: const ImageIcon(
                              AssetImage('assets/emergency.png')),
                          title: Text('Emergency',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          children: [
                            ListTile(
                              title: Text(
                                'Emergency List',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.emergencylist
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () => Provider.of<Meem>(context,
                                      listen: false)
                                  .onupdate(Meem(menus: Menus.emergencylist)),
                            ),
                            ListTile(
                              title: Text(
                                'Emergency Form',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.emergencyform
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () => Provider.of<Meem>(context,
                                      listen: false)
                                  .onupdate(Meem(menus: Menus.emergencyform)),
                            ),
                          ]),
//consultation
                      ListTile(
                          onTap: () => Provider.of<Meem>(context, listen: false)
                              .onupdate(Meem(menus: Menus.consultation)),
                          leading: const ImageIcon(
                              AssetImage('assets/consultation.png')),
                          title: Text('Consultation',
                              style: GoogleFonts.poppins(
                                color: Menus.consultation == value.menus
                                    ? Colors.blue
                                    : Colors.black,
                                fontSize: 16,
                              ))),
//ward
                      ExpansionTile(
                          leading:
                              const ImageIcon(AssetImage('assets/ward.png')),
                          title: Text('Ward',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          children: [
                            ListTile(
                              title: Text(
                                'Enquiry',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.enquiry
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.enquiry)),
                            ),
                            ListTile(
                              title: Text(
                                'Category',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.category
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.category)),
                            ),
                            ListTile(
                              title: Text(
                                'Add room',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.addroom
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.addroom)),
                            ),
                            ListTile(
                              title: Text(
                                'Add bed',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.addbed
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.addbed)),
                            ),
                          ]),

                      //pharma
                      ListTile(
                          onTap: () => Provider.of<Meem>(context, listen: false)
                              .onupdate(Meem(menus: Menus.pharmacy)),
                          leading: const ImageIcon(
                              AssetImage('assets/pharmacy.png')),
                          title: Text('Pharmacy',
                              style: GoogleFonts.poppins(
                                color: Menus.pharmacy == value.menus
                                    ? Colors.blue
                                    : Colors.black,
                                fontSize: 16,
                              ))),
                      //admin
                      ExpansionTile(
                          leading:
                              const ImageIcon(AssetImage('assets/admin.png')),
                          title: Text('Administration',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          children: [
                            ListTile(
                              title: Text(
                                'Company Info',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.companyinfo
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.companyinfo)),
                            ),
                            ListTile(
                              title: Text(
                                'Department',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.department
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.department)),
                            ),
                            ListTile(
                              title: Text(
                                'Designation',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.designation
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.designation)),
                            ),
                            ListTile(
                              title: Text(
                                'Bill Group',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.billgroup
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.billgroup)),
                            ),
                            ListTile(
                              title: Text(
                                'Particular Bill',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.particularbill
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () => Provider.of<Meem>(context,
                                      listen: false)
                                  .onupdate(Meem(menus: Menus.particularbill)),
                            ),
                            ListTile(
                              title: Text(
                                'Company',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.company
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.company)),
                            ),
                            ListTile(
                              title: Text(
                                'Diagnosis',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.diagnosis
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.diagnosis)),
                            ),
                            ListTile(
                              title: Text(
                                'Surgical Package',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.surgicalpackage
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () => Provider.of<Meem>(context,
                                      listen: false)
                                  .onupdate(Meem(menus: Menus.surgicalpackage)),
                            ),
                            ListTile(
                              title: Text(
                                'Insurance Company',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.insurance
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.insurance)),
                            ),
                            ListTile(
                              title: Text(
                                'Medicine Management',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.medicine
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.medicine)),
                            ),
                            ListTile(
                              title: Text(
                                'Acknowledgement Receipt',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.acknowlegde
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.acknowlegde)),
                            ),
                            ListTile(
                              title: Text(
                                'System Parameters',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.systempref
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.systempref)),
                            ),
                            ListTile(
                              title: Text(
                                'Backup Database',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.backup
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.backup)),
                            ),
                            ListTile(
                              title: Text(
                                'System Database',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.systemdatabase
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () => Provider.of<Meem>(context,
                                      listen: false)
                                  .onupdate(Meem(menus: Menus.systemdatabase)),
                            ),
                          ]),
                      ListTile(
                          onTap: () => Provider.of<Meem>(context, listen: false)
                              .onupdate(Meem(menus: Menus.lab)),
                          leading:
                              const ImageIcon(AssetImage('assets/lab.png')),
                          title: Text('Laboratory',
                              style: GoogleFonts.poppins(
                                color: Menus.lab == value.menus
                                    ? Colors.blue
                                    : Colors.black,
                                fontSize: 16,
                              ))),
                      //reports
                      ExpansionTile(
                          leading:
                              const ImageIcon(AssetImage('assets/reports.png')),
                          title: Text('Reports',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          children: [
                            ListTile(
                              title: Text(
                                'Patient Report',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.report
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.report)),
                            ),
                            ListTile(
                              title: Text(
                                'Individual Patient Report',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.indivrep
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.indivrep)),
                            ),
                            ListTile(
                              title: Text(
                                'Out-patient Report',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.outrep
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.outrep)),
                            ),
                            ListTile(
                              title: Text(
                                'Admitted Patient Report',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.admpatrep
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.admpatrep)),
                            ),
                            ListTile(
                              title: Text(
                                'Discharged Patient Report ',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.discharged
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.discharged)),
                            ),
                            ListTile(
                              title: Text(
                                'Acknowledgement Receipt Reports',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.acknowledgerep
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () => Provider.of<Meem>(context,
                                      listen: false)
                                  .onupdate(Meem(menus: Menus.emergencyform)),
                            ),
                          ]),

                      //chats
                      ListTile(
                          onTap: () => Provider.of<Meem>(context, listen: false)
                              .onupdate(Meem(menus: Menus.chats)),
                          leading:
                              const ImageIcon(AssetImage('assets/chats.png')),
                          title: Text('Chats',
                              style: GoogleFonts.poppins(
                                color: Menus.chats == value.menus
                                    ? Colors.blue
                                    : Colors.black,
                                fontSize: 16,
                              ))),

                      //expenses
                      ExpansionTile(
                          leading:
                              const ImageIcon(AssetImage('assets/expense.png')),
                          title: Text('Expenses',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          children: [
                            ListTile(
                              title: Text(
                                'Billing List',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.billinglist
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.billinglist)),
                            ),
                            ListTile(
                              title: Text(
                                'Bill',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.bill
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.bill)),
                            ),
                            ListTile(
                              title: Text(
                                'Expenses',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.expense
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.expense)),
                            ),
                          ]),

                      //stores
                      ExpansionTile(
                          leading:
                              const ImageIcon(AssetImage('assets/stores.png')),
                          title: Text('Stores',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          children: [
                            ListTile(
                              title: Text(
                                'Inventory',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.inventory
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.inventory)),
                            ),
                            ListTile(
                              title: Text(
                                'Miscellanous',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.miscell
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.miscell)),
                            ),
                          ]),

                      //accounts
                      ExpansionTile(
                          leading: const ImageIcon(
                              AssetImage('assets/accounts.png')),
                          title: Text('Accounts',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          children: [
                            ListTile(
                              title: Text(
                                'Information',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.info
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.info)),
                            ),
                            ListTile(
                              title: Text(
                                'Settings',
                                style: GoogleFonts.poppins(
                                    color: value.menus == Menus.settings
                                        ? kPrimaryColor
                                        : Colors.black),
                              ),
                              onTap: () =>
                                  Provider.of<Meem>(context, listen: false)
                                      .onupdate(Meem(menus: Menus.settings)),
                            ),
                          ]),
                      const SizedBox(height: 40),
                      Consumer<Themeswitch>(
                          builder: ((context, value, child) => SwitchListTile(
                              title: Text('System Theme',
                                  style: GoogleFonts.poppins()),
                              value: value.isthemeon,
                              onChanged: ((value) {
                                Provider.of<Themeswitch>(context, listen: false)
                                    .switchtheme(value);
                              }))))
                    ],
                  )))),
    );
  }
}
