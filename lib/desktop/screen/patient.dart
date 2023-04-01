import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopsysadmin/custom/data.dart';

class Patient extends StatefulWidget {
  const Patient({super.key});

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 0.78;

    return Container(
        width: size.width,
        height: MediaQuery.of(context).size.height - 120,
        decoration: BoxDecoration(
            color: const Color.fromARGB(167, 218, 218, 218),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding:
              const EdgeInsets.only(right: 20.0, left: 20, bottom: 30, top: 20),
          child: ListView(
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
                      (states) => Color.fromARGB(255, 253, 242, 242)),
                  columns: [
                    // DataColumn(label: _tableheadertext('OPD No.')),
                    // DataColumn(label: _tableheadertext('Patient Name')),
                    // DataColumn(label: _tableheadertext('Date Check In')),
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
                                        icon:
                                            const Icon(Icons.close, size: 30)),
                                    content: Column(
                                      children: [],
                                    ),
                                  )))),
                          child: Text('modify'))),
                    ]),
                    samplerow(context),
                    samplerow(context),
                    samplerow(context),
                    samplerow(context),
                    samplerow(context),
                    samplerow(context),
                    samplerow(context),
                    samplerow(context),
                    samplerow(context),
                    samplerow(context),
                    samplerow(context),
                    samplerow(context),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  DataRow samplerow(BuildContext context) {
    return DataRow(cells: [
      DataCell(_tableheadertext('row1')),
      DataCell(_tableheadertext('row2')),
      DataCell(_tableheadertext('row3')),
      DataCell(_tableheadertext('rw4')),
      DataCell(_tableheadertext('row5')),
      DataCell(_tableheadertext('row6')),
      DataCell(TextButton(
          onPressed: (() => showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    title: IconButton(
                        onPressed: (() {}),
                        icon: const Icon(Icons.close, size: 30)),
                    content: Column(
                      children: [],
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

List<String> headertext = [
  'OPD No.',
  'Patient Name',
  'Patient Check In',
  'Doctor Assigned',
  'Age',
  'Insurance Status',
  'Action'
];

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatient();
}

class _AddPatient extends State<AddPatient> {
  final TextEditingController _controller = TextEditingController();
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
          padding:
              const EdgeInsets.only(right: 20.0, left: 20, bottom: 30, top: 30),
          child: ListView(
            children: [
              Text(
                'Personal Information:',
                style: GoogleFonts.poppins(
                    fontSize: 17, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 25),
              Form(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          formtextlabel(label: 'First name'),
                          const SizedBox(height: 8),
                          formelement(tfield(
                              controller: _controller,
                              hinttext: '',
                              readonly: false)),
                          const SizedBox(height: 20),
                          formtextlabel(label: 'Age'),
                          const SizedBox(height: 8),
                          formelement(tfield(
                              controller: _controller,
                              hinttext: '',
                              readonly: false)),
                          const SizedBox(height: 20),
                          formtextlabel(label: 'Religion'),
                          const SizedBox(height: 8),
                          formelement(tfield(
                              controller: _controller,
                              hinttext: '',
                              readonly: false)),
                          const SizedBox(height: 20),
                          formtextlabel(label: 'Contact'),
                          const SizedBox(height: 8),
                          formelement(tfield(
                              controller: _controller,
                              hinttext: '',
                              readonly: false)),
                          const SizedBox(height: 20),
                          formtextlabel(label: 'Landmark'),
                          const SizedBox(height: 8),
                          formelement(tfield(
                              controller: _controller,
                              hinttext: '',
                              readonly: false)),
                          const SizedBox(height: 20),
                          formtextlabel(label: 'National ID'),
                          const SizedBox(height: 8),
                          formelement(tfield(
                              controller: _controller,
                              hinttext: '',
                              readonly: false)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          formtextlabel(label: 'Middle name'),
                          const SizedBox(height: 8),
                          formelement(tfield(
                              controller: _controller,
                              hinttext: '',
                              readonly: false)),
                          const SizedBox(height: 20),
                          formtextlabel(label: 'Education level '),
                          const SizedBox(height: 8),
                          formelement(
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: DropdownButton(
                                  elevation: 0,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                  value: education.first,
                                  items: education
                                      .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e.toUpperCase())))
                                      .toList(),
                                  onChanged: ((value) {})),
                            ),
                          ),
                          const SizedBox(height: 20),
                          formtextlabel(label: 'Gender'),
                          const SizedBox(height: 8),
                          formelement(
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: DropdownButton(
                                  elevation: 0,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                  value: gender.first,
                                  items: gender
                                      .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e.toUpperCase())))
                                      .toList(),
                                  onChanged: ((value) {})),
                            ),
                          ),
                          const SizedBox(height: 20),
                          formtextlabel(label: 'Date of birth'),
                          const SizedBox(height: 8),
                          formelement(tfield(
                              controller: _controller,
                              hinttext: '',
                              readonly: false)),
                          const SizedBox(height: 20),
                          formtextlabel(label: 'City/Town'),
                          const SizedBox(height: 8),
                          formelement(tfield(
                              controller: _controller,
                              hinttext: '',
                              readonly: false)),
                          const SizedBox(height: 20),
                          formtextlabel(label: 'Blood group'),
                          const SizedBox(height: 8),
                          formelement(
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: DropdownButton(
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                  elevation: 0,
                                  value: bloodgroups.first,
                                  items: bloodgroups
                                      .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e.toUpperCase())))
                                      .toList(),
                                  onChanged: ((value) {})),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          formtextlabel(label: 'Last name'),
                          const SizedBox(height: 8),
                          formelement(tfield(
                              controller: _controller,
                              hinttext: '',
                              readonly: false)),
                          const SizedBox(height: 20),
                          formtextlabel(label: 'Occupation'),
                          const SizedBox(height: 8),
                          formelement(tfield(
                              controller: _controller,
                              hinttext: '',
                              readonly: false)),
                          const SizedBox(height: 20),
                          formtextlabel(label: 'Marital status'),
                          const SizedBox(height: 8),
                          formelement(
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: DropdownButton(
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                  elevation: 0,
                                  value: maritalstatus.first,
                                  items: maritalstatus
                                      .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e.toUpperCase())))
                                      .toList(),
                                  onChanged: ((value) {})),
                            ),
                          ),
                          const SizedBox(height: 20),
                          formtextlabel(label: 'Nationality'),
                          const SizedBox(height: 8),
                          formelement(tfield(
                              controller: _controller,
                              hinttext: '',
                              readonly: false)),
                          const SizedBox(height: 20),
                          formtextlabel(label: 'District/Province'),
                          const SizedBox(height: 8),
                          formelement(tfield(
                              controller: _controller,
                              hinttext: '',
                              readonly: false)),
                          const SizedBox(height: 20),
                          formtextlabel(label: 'Age'),
                          const SizedBox(height: 8),
                          formelement(tfield(
                              controller: _controller,
                              hinttext: '',
                              readonly: false)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  TextButton(
                      onPressed: (() {}),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)),
                        width: size.width * 0.18,
                        height: 45,
                        child: Center(
                          child: Text(
                            'Add patient',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      )),
                  const SizedBox(height: 30),
                ],
              )),
            ],
          ),
        ));
  }

  Widget formelement(Widget widget) => Container(
      width: MediaQuery.of(context).size.width * 0.17,
      height: 45,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 231, 231, 231)),
      child: Center(child: widget));

  Widget tfield(
      {required TextEditingController controller,
      required String hinttext,
      required bool readonly}) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(5),
        hintText: 'enter text',
        hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w300,
            color: const Color.fromARGB(255, 82, 81, 81),
            fontSize: 15),
        border: InputBorder.none,
      ),
    );
  }

  Widget formtextlabel({required String label}) => Text(
        label,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w300),
      );
}
