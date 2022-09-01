import 'package:flutter/material.dart';
import 'package:ibento/pages/new_booking.dart';

class Bookings extends StatelessWidget {
  const Bookings({Key? key}) : super(key: key);

  _getNewBooking(context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 42, 75),
        title: Text("Bookings"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: SizedBox(
                  width: 500.0,
                  child: NewBooking(),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text("Search"),
                      minWidth: 150,
                      color: Colors.blue,
                      height: 60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            Divider(),
            Text(
              "Recent Bookings".toUpperCase(),
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 280.0,
                child: SingleChildScrollView(
                  child: DataTable(
                    showBottomBorder: true,
                    headingTextStyle: const TextStyle(
                      color: Color.fromARGB(255, 1, 30, 54),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    columns: [
                      DataColumn(
                        label: Text("Title"),
                      ),
                      DataColumn(
                        label: Text("Name"),
                      ),
                      DataColumn(
                        label: Text("Phone Number"),
                      ),
                      DataColumn(
                        label: Text("Date Registered"),
                      ),
                      DataColumn(
                        label: Text("Date Scheduled"),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Wedding cup")),
                          DataCell(Text("Ismail Muhammad")),
                          DataCell(Text("08163351109")),
                          DataCell(Text("31/08/2022")),
                          DataCell(Text("20/09/2022")),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
