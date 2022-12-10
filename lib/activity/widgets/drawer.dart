import 'package:flutter/material.dart';
import '../../main.dart';
import '../../tempat_wisata/page/tempat_wisata_form.dart';
import '../../tempat_wisata/page/tempat_wisata_page.dart';
import '../page/budget_form.dart';
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
                        const MyHomePage(title: 'JelajahIndonesiaMobile')),
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
          ListTile(
            title: const Text('Tempat Wisata'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TempatWisataPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tempat Wisata Form'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TempatWisataForm()),
              );
            },
          ),
        ],
      ),
    );
  }
}
