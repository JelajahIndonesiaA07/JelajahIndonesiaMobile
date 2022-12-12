import 'package:flutter/material.dart';
import '../../main.dart';
import '../../tempat_wisata/page/tempat_wisata_page.dart';
import '../page/activity_form.dart';
import '../page/myactivity.dart';
import 'package:http/http.dart' as http;
// import 'package:pbp_django_auth/pbp_django_auth.dart';
// import 'package:provider/provider.dart';
import 'package:jim/auth/pages/login_page.dart';
// import 'package:jim/auth/models/models_login.dart';
// import 'package:flutter/material.dart';
// import 'package:jim/main.dart';
import 'package:jim/kuliner/pages/kulinerpage.dart';
import 'package:jim/kuliner/pages/form_kuliner.dart';
// import 'package:flutter/material.dart';
import 'package:jim/emergencycall/pages/postemergencycall.dart';
// import 'package:jim/main.dart';
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
          
          // Menambahkan clickable menu
          ListTile(
            title: const Text('JelajahIndonesiaMobile'),
            leading: Icon(Icons.home),
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
          Divider(
          color: Colors.grey,
          ),
          ListTile(
            title: const Text('Tempat Wisata'),
            leading: Icon(Icons.landscape),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TempatWisataPage()),
              );
            },
          ),
          // ListTile(
          //   title: const Text('Tempat Wisata Form'),
          //   leading: Icon(Icons.add_rounded),
          //   onTap: () {
          //     // Route menu ke halaman form
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(builder: (context) => TempatWisataForm()),
          //     );
          //   },
          // ),
          ListTile(
            title: const Text('Tambah Aktivitas'),
            leading: Icon(Icons.add_rounded),
            onTap: () {
              // Route menu ke halaman Form Budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyActivityPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Things To Do'),
            leading: Icon(Icons.local_activity),
            onTap: () {
              // Route menu ke halaman data budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ActivityPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tempat Kuliner'),
            leading: Icon(Icons.local_dining),
            onTap: () {
              // Route menu ke halaman data budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const kulinerPage()),
              );
            },
          ),
          ListTile(
              title: const Text('Tambah Tempat Kuliner'),
              leading: Icon(Icons.add_rounded),
              onTap: () {
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                  );
              },
          ),
          ListTile(
            title: const Text('Daftar Rumah Sakit'),
            leading: Icon(Icons.local_hospital),
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
            leading: Icon(Icons.add_rounded),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHospitalFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Other User'),
            leading: Icon(Icons.supervisor_account),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfilePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Form'),
            leading: Icon(Icons.person_add),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const FormPage()),
              );
            },
          ),

          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person),
            dense: true,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ShowPage()),
              );
            },
          ),

          // ListTile(
          //   title: const Text('Logout'),
          //
          //   leading: Icon(Icons.logout),
          //   onTap: () async {
          //     Uri url = Uri.parse("https://jelajah-indonesia.up.railway.app/auth/logout/");
          //     await http.get(url);
          //
          //     // final response =
          //     //     await request.logout("http://localhost:8000/logout/");
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(builder: (context) => LoginPage()),
          //     );
          //   },
          // ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.logout,),
                title: const Text('Logout'),
                onTap: () async {
                  Uri url = Uri.parse("https://jelajah-indonesia.up.railway.app/auth/logout/");
                  await http.get(url);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
