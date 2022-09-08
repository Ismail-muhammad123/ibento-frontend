import 'package:flutter/material.dart';
import 'package:ibento/pages/bookings.dart';
import 'package:ibento/pages/bookings_calender.dart';
import 'package:ibento/pages/dashboard.dart';
import 'package:ibento/pages/new_booking.dart';
import 'package:ibento/pages/profile.dart';
import 'package:ibento/widgets/menuTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool menuExpanded = true;
  int selectedWidget = 0;
  List<Widget> pages = [
    Dashboard(),
    Bookings(),
    BookingsCalender(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: const Color.fromARGB(255, 0, 42, 75),
              height: double.maxFinite,
              width: menuExpanded ? 250.0 : 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Image.asset(
                            'images/icon.png',
                            width: 100,
                            height: 100,
                          ),
                          color: Colors.white,
                          onPressed: () => setState(() => menuExpanded
                              ? menuExpanded = false
                              : menuExpanded = true),
                        ),
                        menuExpanded
                            ? Text(
                                "Ibento Tech".toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  GestureDetector(
                    onTap: () => setState(() => selectedWidget = 0),
                    child: MenuTile(
                      current: selectedWidget == 0,
                      title: "Dashboard",
                      icon: Icons.calendar_month,
                      expanded: menuExpanded,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => selectedWidget = 1),
                    child: MenuTile(
                      current: selectedWidget == 1,
                      title: "Bookings",
                      icon: Icons.book_online,
                      expanded: menuExpanded,
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: SizedBox(
                                  width: 500.0,
                                  child: NewBooking(),
                                ),
                              );
                            },
                          ),
                          icon: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => selectedWidget = 2),
                    child: MenuTile(
                      current: selectedWidget == 2,
                      title: "Calender",
                      icon: Icons.calendar_view_month_rounded,
                      expanded: menuExpanded,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => selectedWidget = 3),
                    child: MenuTile(
                      current: selectedWidget == 3,
                      title: "Profile",
                      icon: Icons.person,
                      expanded: menuExpanded,
                    ),
                  ),
                  // MenuTile(
                  //   title: "Settings",
                  //   icon: Icons.settings,
                  //   expanded: menuExpanded,
                  // ),
                  const Spacer(),
                  MenuTile(
                    title: "Logout",
                    icon: Icons.logout,
                    color: Colors.red,
                    expanded: menuExpanded,
                  )
                ],
              ),
            ),
            Expanded(
              child: pages[selectedWidget],
            ),
          ],
        ),
      ),
    );
  }
}
