import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:ibento/pages/business_information_form.dart';
import 'package:ibento/pages/details.dart';
import 'package:ibento/providers/bookings_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _exporting = false;

  Future _exportCsv() async {
    var datetime = DateTime.now()
        .toString()
        .replaceAll(RegExp(r' '), "-")
        .replaceAll(RegExp(r':'), "-");
    // fetxh records and convert them to maps
    List<Map<String, dynamic>> bookings =
        await context.read<BookingsProvider>().getAllEvents().then(
              (value) => value.map((e) => e.toMap()).toList(),
            );

    List<List<dynamic>> rows = [];

    // add the heading of the csv file

    rows.add(bookings.first.keys.toList());

    // add the list of the values of each of the records to the rows

    rows.addAll(bookings.map((e) => e.values.toList()));

    // convert the list of rows o csv string
    String csv = const ListToCsvConverter().convert(rows);

    // create path and a csv file
    String dir = await Directory(
      path.join(
        (await getDownloadsDirectory())!.path,
        "Booking-records",
      ),
    ).create().then((value) => value.path);

    File f = File(path.join(dir, "export-bookings-$datetime.csv"));

    await f.writeAsString(csv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        backgroundColor: const Color.fromARGB(255, 0, 42, 75),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  elevation: 8.0,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.zero,
                            ),
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Business Informations".toUpperCase(),
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 22.0),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(75),
                            ),
                            child: Image.asset(
                              "images/icon.png",
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Text(
                            "Ibento Technologies limited".toUpperCase(),
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 42, 75),
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Address: Kano State Nigeria"),
                          Text("Email: ismaeelmuhammad123@gmail.com"),
                          Text("Phone Number: 08163351109"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              color: Colors.blue,
                              onPressed: _exporting
                                  ? null
                                  : () async {
                                      setState(() {
                                        _exporting = true;
                                      });
                                      await _exportCsv()
                                          .then(
                                            (value) => setState(
                                                () => _exporting = false),
                                          )
                                          .then(
                                            (value) async => await showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                content: Text(
                                                  "File Downloaded",
                                                  textAlign: TextAlign.center,
                                                ),
                                                actions: [
                                                  MaterialButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                    child: Text("OKAY"),
                                                    color: Colors.blue,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                    },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _exporting
                                          ? "exporting, please wait"
                                          : "Export Records as CSV file",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                  ),
                                  _exporting
                                      ? CircularProgressIndicator()
                                      : Icon(
                                          Icons.download,
                                          color: Colors.white,
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 8.0),
              //   child: Card(
              //     elevation: 8.0,
              //     child: SizedBox(
              //       width: double.maxFinite,
              //       child: Column(
              //         children: [
              //           Container(
              //             width: double.maxFinite,
              //             padding: EdgeInsets.all(12.0),
              //             color: Colors.grey.withOpacity(0.5),
              //             child: Text(
              //               "Preferences".toUpperCase(),
              //               style: TextStyle(
              //                 color: Colors.blue,
              //                 fontSize: 22.0,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Row(
              //               children: [
              //                 Text("Unavailable days:"),
              //                 Text("today")
              //               ],
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
