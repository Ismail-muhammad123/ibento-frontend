import 'package:flutter/material.dart';


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
