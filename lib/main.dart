import 'package:flutter/material.dart';
import 'activity/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'auth/pages/login_page.dart';
import 'auth/models/models_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) {
            CookieRequest request = CookieRequest();
            return request;
          },
        ),
        ChangeNotifierProvider(create: (_) => UserManagement())
      ],
      child: MaterialApp(
        title: 'Jelajah Indonesia',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(),
        initialRoute: "/login",
        routes: {
          "/login": (BuildContext context) => const LoginPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jelajah Indonesia'),
      ),
      drawer: DrawerApp(),
      body: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.7,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(48, 72, 171, 1)),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "Selamat datang di Jelajah Indonesia ",
                      ),
                      TextSpan(
                          text: 'Jelajah Indonesia',
                          style: TextStyle(
                              color: Color.fromRGBO(185, 243, 185, 1)))
                    ],
                  ),
                ),
              ]))),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}