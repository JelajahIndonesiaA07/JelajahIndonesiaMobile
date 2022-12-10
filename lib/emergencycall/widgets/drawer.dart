import 'package:flutter/material.dart';
import 'package:jim/main.dart';
import 'package:jim/emergencycall/pages/emergencycallpage.dart';
import 'package:jim/activity/page/myactivity.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        ListTile(
          title: const Text('counter_7'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyHomePage(
                        title: "Program Counter",
                      )),
            );
          },
        ),
        ListTile(
          title: const Text('My Watch List'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const EmergencycallPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Activity'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ActivityPage()),
            );
          },
        ),
      ],
    ),
  );
}
