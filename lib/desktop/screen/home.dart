import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopsysadmin/custom/data.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 0.78;
    return Container(
      width: size.width,
      height: MediaQuery.of(context).size.height - 120,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black12),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20, bottom: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                'Welcome,',
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _firstrowcontainer(),
                  _firstrowcontainer(),
                  _firstrowcontainer(),
                  _firstrowcontainer(),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //_secondrowcontainer1(size),
                  _container(size.width * 0.6, 200,
                      textlabel: 'Statistics', widget: const SizedBox()),
                  _container(size.width * 0.35, 200,
                      widget: const SizedBox(), textlabel: 'Date')
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _container(size.width * 0.55, 240,
                      widget: const SizedBox(),
                      textlabel: 'Total Patients Per Day'),
                  _container(size.width * 0.4, 240,
                      widget: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            ...onlineusers.map((e) => ListTile(
                                  title: Text(e.username,
                                      style: GoogleFonts.poppins()),
                                  subtitle: Text(e.role,
                                      style: GoogleFonts.poppins()),
                                  trailing: Text('online',
                                      style: GoogleFonts.poppins(
                                          color: Colors.green)),
                                ))
                          ],
                        ),
                      ),
                      textlabel: 'Online Users')
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  _container(size.width - 44, 230,
                      widget: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Table(
                          children: const [],
                        ),
                      ),
                      textlabel: 'Recent Patients in OPD Queue')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  TableRow gg() {
    return TableRow(children: [
      Text('data',
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 16)),
      Text('data', style: GoogleFonts.poppins(color: Colors.black)),
      Text('data', style: GoogleFonts.poppins(color: Colors.black)),
      Text('data', style: GoogleFonts.poppins(color: Colors.black))
    ]);
  }

  _container(double width, double height,
          {required Widget widget, required String textlabel}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textlabel,
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20),
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 241, 241, 241),
                borderRadius: BorderRadius.circular(20)),
            child: Center(child: widget),
          ),
        ],
      );

  Container _firstrowcontainer() {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.18,
      height: 100,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 241, 241),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
