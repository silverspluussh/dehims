import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopsysadmin/desktop/provider/opdprovider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Opdvitals extends StatefulWidget {
  const Opdvitals({super.key});

  @override
  State<Opdvitals> createState() => _OpdvitalsState();
}

class _OpdvitalsState extends State<Opdvitals> {
  @override
  Widget build(BuildContext context) {
    Container searchformwidget() {
      return Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: 40,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 231, 231, 231)),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'OPD No./lname/fname',
              hintStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  color: const Color.fromARGB(255, 82, 81, 81),
                  fontSize: 15),
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search),
            ),
          ));
    }

    Size size = MediaQuery.of(context).size * 0.78;
    return Container(
      width: size.width,
      height: MediaQuery.of(context).size.height - 120,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding:
            const EdgeInsets.only(right: 20.0, left: 20, bottom: 30, top: 20),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Text('OPD List',
                style: GoogleFonts.poppins(
                    fontSize: 17, fontWeight: FontWeight.w600)),
            const SizedBox(height: 30),
            Container(
              width: size.width - 50,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  searchformwidget(),
                  InkWell(
                    child: Chip(
                      backgroundColor: Colors.red,
                      label: Text('Search',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          )),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ).pSymmetric(h: 50),
            ),
            const SizedBox(height: 50),
            Container(
              height: 700,
              width: size.width - 50,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Row(children: [
                    Text('Patient List',
                        style: GoogleFonts.poppins(
                            fontSize: 17, fontWeight: FontWeight.w600)),
                    const Spacer(),
                    TextButton(
                        onPressed: (() {}),
                        child: Chip(
                          padding: const EdgeInsets.all(6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Colors.red,
                          label: Row(children: [
                            const Icon(Icons.filter, color: Colors.white),
                            const SizedBox(width: 10),
                            Text('Filter',
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 16)),
                          ]),
                        ))
                  ]),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      dataRowHeight: 50,
                      dividerThickness: 10,
                      dataRowColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromARGB(255, 253, 242, 242)),
                      columns: [
                        ...headertext
                            .map((e) => DataColumn(label: _tableheadertext(e))),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(_tableheadertext('row1')),
                          DataCell(_tableheadertext('row2')),
                          DataCell(_tableheadertext('row3')),
                          DataCell(_tableheadertext('row4')),
                          DataCell(_tableheadertext('row5')),
                          DataCell(_tableheadertext('row6')),
                          DataCell(TextButton(
                              onPressed: (() => showDialog(
                                  context: context,
                                  builder: ((context) => AlertDialog(
                                        title: IconButton(
                                            onPressed: (() {}),
                                            icon: const Icon(Icons.close,
                                                size: 30)),
                                        content: Column(
                                          children: [],
                                        ),
                                      )))),
                              child: const Text('modify'))),
                        ]),
                        samplerow(context),
                        samplerow(context),
                        samplerow(context),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<String> headertext = [
    'OPD No.',
    'Patient Name',
    'Patient Check In',
    'Doctor Assigned',
    'Age',
    'Insurance Status',
    'Action'
  ];

  DataRow samplerow(BuildContext context) {
    return DataRow(cells: [
      DataCell(_tableheadertext('row1')),
      DataCell(_tableheadertext('row2')),
      DataCell(_tableheadertext('row3')),
      DataCell(_tableheadertext('row4')),
      DataCell(_tableheadertext('row5')),
      DataCell(_tableheadertext('row6')),
      DataCell(TextButton(
          onPressed: (() => showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    title: IconButton(
                        onPressed: (() {}),
                        icon: const Icon(Icons.close, size: 30)),
                    content: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        children: [],
                      ),
                    ),
                  )))),
          child: const Text('modify'))),
    ]);
  }

  Text _tableheadertext(String label) => Text(
        label,
        style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      );
}

class OpdReg extends StatefulWidget {
  const OpdReg({super.key});

  @override
  State<OpdReg> createState() => _OpdRegState();
}

class _OpdRegState extends State<OpdReg> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 0.78;

    return Container(
        width: size.width,
        height: MediaQuery.of(context).size.height - 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding:
              const EdgeInsets.only(right: 20.0, left: 20, bottom: 30, top: 20),
          child: ListView(
            children: [
              Text('OPD Registration',
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w600)),
              const SizedBox(height: 30),
              Container(
                width: size.width - 50,
                height: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
              const SizedBox(height: 50),
              Container(
                  height: 800,
                  width: size.width - 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child:
                      Consumer<OpdRegmenu>(builder: ((context, value, child) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...opdlist.map((e) => Column(
                                  children: [
                                    InkWell(
                                      onTap: () => value.updateopd(e),
                                      child: Text(
                                        e.op,
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Image.asset('assets/Rectangle.png',
                                        color: e.op == value.op
                                            ? Color.fromRGBO(255, 143, 107, 1)
                                            : Colors.grey)
                                  ],
                                ))
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 680,
                          width: size.width - 70,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Consumer<OpdRegmenu>(
                              builder: (context, value, child) {
                            if (value.opdmenu == Opdmenu.geninfo) {
                              return _generalinformation();
                            } else if (value.opdmenu == Opdmenu.vitalpara) {
                              return _vitalparameters();
                            } else if (value.opdmenu == Opdmenu.patinfo) {
                              return _patientinformation();
                            }

                            return _generalinformation();
                          }),
                        ),
                      ],
                    );
                  })))
            ],
          ),
        ));
  }

  Form _patientinformation() {
    final provide = Provider.of<OpdRegmenu>(context);
    TextEditingController controller = TextEditingController();

    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        formtextlabel(label: 'Allergies:'),
        const SizedBox(height: 10),
        formelement(tfield(
            controller: controller, hinttext: 'Allergies', readonly: false)),
        const SizedBox(height: 10),
        formtextlabel(label: 'Warnings:'),
        const SizedBox(height: 10),
        formelement(tfield(
            controller: controller, hinttext: 'Warnings', readonly: false)),
        const SizedBox(height: 10),
        formtextlabel(label: 'Social History:'),
        const SizedBox(height: 10),
        formelement(tfield(
            controller: controller,
            hinttext: 'Social History',
            readonly: false)),
        const SizedBox(height: 10),
        formtextlabel(label: 'Social History:'),
        const SizedBox(height: 10),
        formelement(tfield(
            controller: controller,
            hinttext: 'Past Medical History',
            readonly: false)),
        const SizedBox(height: 10),
        formtextlabel(label: 'Past Medical History:'),
        const SizedBox(height: 10),
        formelement(tfield(
            controller: controller,
            hinttext: 'Personal History',
            readonly: false)),
        const SizedBox(height: 10),
        formtextlabel(label: 'Social History:'),
        const SizedBox(height: 10),
        formelement(tfield(
            controller: controller,
            hinttext: 'Personal History',
            readonly: false)),
        const SizedBox(height: 20),
        InkWell(
          child: Chip(
            backgroundColor: Colors.red,
            label: Text('Check in',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                )),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    ));
  }

  Form _vitalparameters() {
    final provide = Provider.of<OpdRegmenu>(context);
    TextEditingController controller = TextEditingController();

    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formtextlabel(label: 'label'),
                const SizedBox(height: 10),
                formelement(tfield(
                    controller: controller,
                    hinttext: 'hinttext',
                    readonly: false)),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formtextlabel(label: 'label'),
                const SizedBox(height: 10),
                formelement(tfield(
                    controller: controller,
                    hinttext: 'hinttext',
                    readonly: false)),
              ],
            )
          ],
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formtextlabel(label: 'label'),
                const SizedBox(height: 10),
                formelement(tfield(
                    controller: controller,
                    hinttext: 'hinttext',
                    readonly: false)),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formtextlabel(label: 'label'),
                const SizedBox(height: 10),
                formelement(tfield(
                    controller: controller,
                    hinttext: 'hinttext',
                    readonly: false)),
              ],
            )
          ],
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formtextlabel(label: 'label'),
                const SizedBox(height: 10),
                formelement(tfield(
                    controller: controller,
                    hinttext: 'hinttext',
                    readonly: false)),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formtextlabel(label: 'label'),
                const SizedBox(height: 10),
                formelement(tfield(
                    controller: controller,
                    hinttext: 'hinttext',
                    readonly: false)),
              ],
            )
          ],
        ),
        const SizedBox(height: 50),
        InkWell(
          onTap: () => provide.updateopd(
              OpdRegmenu(opdmenu: Opdmenu.patinfo, op: 'Patient History')),
          child: Chip(
            backgroundColor: Colors.red,
            label: Text('Next',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                )),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    ));
  }

  Form _generalinformation() {
    final provide = Provider.of<OpdRegmenu>(context);
    TextEditingController controller = TextEditingController();
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        formtextlabel(label: 'OPD Number:'),
        const SizedBox(height: 20),
        formelement(tfield(
            controller: controller, hinttext: 'OPD Number', readonly: false)),
        const SizedBox(height: 20),
        formtextlabel(label: 'Referral Doctor:'),
        const SizedBox(height: 20),
        formelement(
          DropdownButton(
              underline: SizedBox(),
              elevation: 0,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
              value: 'first',
              items: ['first', 'second', 'third']
                  .map((e) =>
                      DropdownMenuItem(value: e, child: Text(e.toUpperCase())))
                  .toList(),
              onChanged: ((value) {})),
        ),
        const SizedBox(height: 20),
        formtextlabel(label: 'Department:'),
        const SizedBox(height: 20),
        formelement(
          DropdownButton(
              underline: SizedBox(),
              elevation: 0,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
              value: 'first',
              items: ['first', 'second', 'third']
                  .map((e) =>
                      DropdownMenuItem(value: e, child: Text(e.toUpperCase())))
                  .toList(),
              onChanged: ((value) {})),
        ),
        const SizedBox(height: 20),
        formtextlabel(label: 'Consultation Doctor:'),
        const SizedBox(height: 20),
        formelement(
          DropdownButton(
              underline: SizedBox(),
              elevation: 0,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
              value: 'first',
              items: ['first', 'second', 'third']
                  .map((e) =>
                      DropdownMenuItem(value: e, child: Text(e.toUpperCase())))
                  .toList(),
              onChanged: ((value) {})),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () => provide.updateopd(
              OpdRegmenu(opdmenu: Opdmenu.vitalpara, op: 'Vital Parameters')),
          child: Chip(
            backgroundColor: Colors.red,
            label: Text('Next',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                )),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    ));
  }

  Widget formtextlabel({required String label}) => Text(
        label,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w300),
      );

  Widget formelement(Widget widget) => Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 231, 231, 231)),
      child: widget);

  Widget tfield(
      {required TextEditingController controller,
      required String hinttext,
      required bool readonly}) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(5),
        hintText: hinttext,
        hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w300,
            color: const Color.fromARGB(255, 82, 81, 81),
            fontSize: 15),
        border: InputBorder.none,
      ),
    );
  }
}
