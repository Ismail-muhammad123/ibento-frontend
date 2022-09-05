import 'package:flutter/material.dart';

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
                  elevation: 8.0,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
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
                          Text("Address: Kano State Nigeria")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 8.0,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Ismail Muhammad lawan",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 42, 75),
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Address: Kano State Nigeria"),
                            Text("Email: ismaeelmuhammad123@gmail.com"),
                            Text("Phone Number: 08163351109"),
                            Text("Role: Manager"),
                            Text("Status: Active"),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MaterialButton(
                                color: Colors.blue,
                                onPressed: () {},
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Edit User Account",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                    ),
                                    Icon(
                                      Icons.open_in_new,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
