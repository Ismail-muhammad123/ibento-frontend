import 'package:flutter/material.dart';

class Bookings extends StatelessWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 42, 75),
        title: Text("Bookings"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: SizedBox(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text("Search"),
                      minWidth: 150,
                      color: Colors.blue,
                      height: 45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
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
