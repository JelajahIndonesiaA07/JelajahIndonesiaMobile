import 'package:flutter/material.dart';
import 'package:jim/main.dart';
import 'package:jim/kuliner/pages/kulinerpage.dart';
import 'package:jim/kuliner/pages/form_kuliner.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        ListTile(
          title: const Text('counter_7'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage(title: "",)),
            );
          },
        ),
         ListTile(
            title: const Text('Tempat Kuliner'),
            onTap: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const kulinerPage()),
                );
            },
        ),
        ListTile(
            title: const Text('Tambah Tempat Kuliner'),
            onTap: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
            },
        ),
      ],
    ),
  );
}