import 'package:flutter/material.dart';
import 'package:ibento/pages/business_information_form.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: MaterialButton(
                          //     color: Colors.blue,
                          //     onPressed: () async {
                          //       await showDialog(
                          //         context: context,
                          //         builder: (context) =>
                          //             BusinessInformationForm(),
                          //       );
                          //     },
                          //     child: Row(
                          //       mainAxisSize: MainAxisSize.min,
                          //       children: [
                          //         Padding(
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: Text(
                          //             "Edit Company information",
                          //             style: TextStyle(color: Colors.white),
                          //           ),
                          //         ),
                          //         Padding(
                          //           padding: EdgeInsets.only(left: 8.0),
                          //         ),
                          //         Icon(
                          //           Icons.open_in_new,
                          //           color: Colors.white,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // )
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
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
