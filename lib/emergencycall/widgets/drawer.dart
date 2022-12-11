import 'package:flutter/material.dart';
import 'package:jim/emergencycall/pages/postemergencycall.dart';
import 'package:jim/main.dart';
import 'package:jim/emergencycall/pages/emergencycallpage.dart';

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
          title: const Text('Daftar Rumah Sakit'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const EmergencycallPage()),
            );
          },
        ),

      ListTile(
            title: const Text('Tambah Rumah Sakit'),
            onTap: () {
              // Route menu ke halaman Form Budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHospitalFormPage()),
              );
            },
          ),

        ListTile(
          title: const Text('Activity'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHospitalFormPage()),
            );
          },
        ),
      ],
    ),
  );
}
