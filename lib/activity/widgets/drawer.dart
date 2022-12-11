import 'package:flutter/material.dart';
import '../../main.dart';
import '../page/activity_form.dart';
import '../page/myactivity.dart';
import 'package:http/http.dart' as http;
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:jim/auth/pages/login_page.dart';
import 'package:jim/auth/models/models_login.dart';
import 'package:flutter/material.dart';
import 'package:jim/main.dart';
import 'package:jim/kuliner/pages/kulinerpage.dart';
import 'package:jim/kuliner/pages/form_kuliner.dart';
import 'package:flutter/material.dart';
import 'package:jim/emergencycall/pages/postemergencycall.dart';
import 'package:jim/main.dart';
import 'package:jim/emergencycall/pages/emergencycallpage.dart';
import 'package:jim/Profile_User/form.dart';
import 'package:jim/Profile_User/profile.dart';
import 'package:jim/Profile_User/summary.dart';



class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text(''),
          ),
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Home Page',
            style : const TextStyle(
              fontSize: 17,)),
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
            title: const Text('Tambah Aktivitas',
            style : const TextStyle(
              fontSize: 17,)
            ),
            onTap: () {
              // Route menu ke halaman Form Budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyActivityPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Things To DO',
            style : const TextStyle(
              fontSize: 17,)),
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
            title: const Text('Logout',
            style : const TextStyle(
              fontSize: 17,)),
            onTap: () async {
              Uri url = Uri.parse("https://jelajah-indonesia.up.railway.app/auth/logout/");
              await http.get(url);

              // final response =
              //     await request.logout("http://localhost:8000/logout/");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
           ListTile(
            title: const Text('List Tempat Kuliner',
            style : const TextStyle(
              fontSize: 17,)),
            onTap: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const kulinerPage()),
                );
            },
        ),
        ListTile(
            title: const Text('Tambah Tempat Kuliner',
            style : const TextStyle(
              fontSize: 17,)),
            onTap: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
            },
        ),
        ListTile(
          title: const Text('Daftar Rumah Sakit',
            style : const TextStyle(
              fontSize: 17,)),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const EmergencycallPage()),
            );
          },
        ),

      ListTile(
            title: const Text('Tambah Rumah Sakit',
            style : const TextStyle(
              fontSize: 17,)),
            onTap: () {
              // Route menu ke halaman Form Budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHospitalFormPage()),
              );
            },
          ),
        ListTile(
                title: Text('Other User',
            style : const TextStyle(
              fontSize: 17,)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  );
                },
                ),
                ListTile(
                  title: Text('Form',
            style : const TextStyle(
              fontSize: 17,)),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Profile',
            style : const TextStyle(
              fontSize: 17,)),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShowPage()),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
