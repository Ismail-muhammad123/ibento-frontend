import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool menuExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Row(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              color: Color.fromARGB(255, 0, 42, 75),
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
                          icon: Icon(Icons.calendar_today),
                          color: Colors.white,
                          onPressed: () => setState(() => menuExpanded
                              ? menuExpanded = false
                              : menuExpanded = true),
                        ),
                        menuExpanded
                            ? Text(
                                "Ibento Tech".toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  MenuTile(
                    title: "Dashboard",
                    icon: Icons.calendar_month,
                    expanded: menuExpanded,
                  ),
                  MenuTile(
                    title: "Bookings",
                    icon: Icons.book_online,
                    expanded: menuExpanded,
                  ),
                  MenuTile(
                    title: "Calender",
                    icon: Icons.calendar_view_month_rounded,
                    expanded: menuExpanded,
                  ),
                  MenuTile(
                    title: "Profile",
                    icon: Icons.person,
                    expanded: menuExpanded,
                  ),
                  MenuTile(
                    title: "Settings",
                    icon: Icons.settings,
                    expanded: menuExpanded,
                  ),
                  Spacer(),
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
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DashboardMetricsCard(
                            label: "Total Bookings",
                            value: 15,
                          ),
                        ),
                        Expanded(
                          child: DashboardMetricsCard(
                            label: "Canceled",
                            value: 6,
                          ),
                        ),
                        Expanded(
                          child: DashboardMetricsCard(
                            label: "Missed",
                            value: 9,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardMetricsCard extends StatelessWidget {
  final int value;
  final String label;
  const DashboardMetricsCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  bool expanded;
  Color color;
  MenuTile({
    Key? key,
    required this.title,
    required this.icon,
    this.color = Colors.white,
    this.expanded = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: Colors.grey,
                ),
              ),
              expanded
                  ? Text(
                      title,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        width: double.maxFinite,
        height: 50.0,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              width: 5.0,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
