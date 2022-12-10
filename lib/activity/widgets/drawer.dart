import 'package:flutter/material.dart';
import '../../main.dart';
import '../page/activity_form.dart';
import '../page/myactivity.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('JelajahIndonesiaMobile'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Aktivitas'),
            onTap: () {
              // Route menu ke halaman Form Budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Things To DO'),
            onTap: () {
              // Route menu ke halaman data budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ActivityPage()),
              );
            },
          ),
          // ListTile(
          //   title: const Text('test'),
          //   onTap: () {
          //     // Route menu ke halaman data budget
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const FormBookingPage()),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
