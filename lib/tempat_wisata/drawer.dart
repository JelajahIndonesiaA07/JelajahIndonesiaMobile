import 'package:flutter/material.dart';
import '../main.dart';
import 'page/tempat_wisata_page.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

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
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'JelajahIndonesiaMobile')),
              );
            },
          ),
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
        ],
      ),
    );
  }
}