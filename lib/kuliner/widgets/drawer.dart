import 'package:jim/kuliner/pages/databudget.dart';
import 'package:jim/kuliner/pages/homepage.dart';
import 'package:jim/kuliner/pages/mywatchlistpage.dart';
import 'package:jim/kuliner/pages/addbudget.dart';
import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key, required this.route});

  final String route;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              if (route == 'counter_7') {
                Navigator.pop(context);
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                      title: 'Program Counter',
                    ),
                  ),
                );
              }
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              if (route == 'tambah-budget') {
                Navigator.pop(context);
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const TambahBudget()),
                );
              }
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              if (route == 'data-budget') {
                Navigator.pop(context);
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const DataBudget()),
                );
              }
            },
          ),
          ListTile(
            title: const Text('My Watchlist'),
            onTap: () {
              if (route == 'mywatchlist') {
                Navigator.pop(context);
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MywatchlistPage()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}