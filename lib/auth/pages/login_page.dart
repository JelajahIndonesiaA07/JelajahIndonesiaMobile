import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'register.dart';
import '../../../../main.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../models/models_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String? username ;
  String? password1;

  // void submit(String username, String password1) async {
  //   var url = Uri.parse(
  //       'https://jelajah-indonesia.up.railway.app/auth/login');
  //   var map = <String, dynamic>{};
  //   map["username"] = username;
  //   map["password"] = password1;
  //   var response = await http.post(url, body: map);
  //   print(response.body);
  //   onPressed(BuildContext context) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text('Data sedang diproses. Mohon tunggu...')));
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final user = context.watch<UserManagement>();
    return Scaffold(
      body: Form(
        key: _loginFormKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      username = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      username = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This field cannot be empty!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      password1 = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      password1 = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This field cannot be empty!';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 90,
                height: 35,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () async {
                    if (_loginFormKey.currentState!.validate()) {
                      // 'username' and 'password' should be the values of the user login form.
                      final response = await request.login(
                          "https://jelajah-indonesia.up.railway.app/auth/login/",
                          {
                            'username': username,
                            'password': password1,
                          });
                      if (request.loggedIn) {
                        // Code here will run if the login succeeded.
                        _loginFormKey.currentState!.reset();
                        // var users = User.fromJson(response["user"]);
                        // user.setUser(users);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()),
                        );
                      } else {
                        // Code here will run if the login failed (wrong username/password).
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: Container(
                                child: ListView(
                                  padding: const EdgeInsets.all(20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    SizedBox(height: 20),
                                    Center(
                                      child: Column(children: [
                                        Text(response["message"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 16)),
                                      ]),
                                    ),
                                    SizedBox(height: 20),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'ok',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                        padding: const EdgeInsets.only(bottom: 35.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.blue,
                          ),
                          child: const Text(
                            "Don't have account yet?",
                            style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _loginFormKey = GlobalKey<FormState>();
//   bool isPasswordVisible = false;
//   void togglePasswordView() {
//     setState(() {
//       isPasswordVisible = !isPasswordVisible;
//     });
//   }

//   String? _username ;
//   String? _password1;
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final request = context.watch<CookieRequest>();
//     final user = context.watch<UserManagement>();
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             alignment: Alignment.center,
//             padding: EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Image logo

//                 Container(
//                   padding: EdgeInsets.all(10),
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Column(
//                       children: [
//                         // Login text
//                         const Text(
//                           "Login",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 28,
//                           ),
//                         ),
//                         Form(
//                           key: _loginFormKey,
//                           child: Column(
//                             children: [
//                               // Username Input
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 15, bottom: 15),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Padding(
//                                       padding:
//                                           const EdgeInsets.only(right: 10.0),
//                                       child: const Icon(
//                                         Icons.person,
//                                         size: 32,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: TextFormField(
//                                         controller: _usernameController,
//                                         decoration: const InputDecoration(
//                                           hintText: 'Username',
//                                           enabledBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color: Colors.grey)),
//                                           focusedBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color: Colors.blue)),
//                                         ),
//                                         onChanged: (String? value) {
//                                           setState(() {
//                                             _username = value!;
//                                           });
//                                         },
//                                         onSaved: (String? value) {
//                                           setState(() {
//                                             _username = value!;
//                                           });
//                                         },
//                                         validator: (String? value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'Username tidak boleh kosong!';
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               // Password input
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 15, bottom: 15),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     const Padding(
//                                       padding: EdgeInsets.only(right: 10.0),
//                                       child: Icon(
//                                         Icons.lock_rounded,
//                                         size: 32,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: TextFormField(
//                                         controller: _passwordController,
//                                         obscureText: !isPasswordVisible,
//                                         decoration: InputDecoration(
//                                           hintText: 'Password',
//                                           enabledBorder:
//                                               const UnderlineInputBorder(
//                                                   borderSide: BorderSide(
//                                                       color: Colors.grey)),
//                                           focusedBorder:
//                                               const UnderlineInputBorder(
//                                                   borderSide: BorderSide(
//                                                       color: Colors.blue)),
//                                           suffixIcon: Padding(
//                                             padding: const EdgeInsets.fromLTRB(
//                                                 0, 0, 4, 0),
//                                             child: InkWell(
//                                               onTap: togglePasswordView,
//                                               child: Icon(
//                                                 isPasswordVisible
//                                                     ? Icons.visibility_rounded
//                                                     : Icons
//                                                         .visibility_off_rounded,
//                                                 size: 24,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         onChanged: (String? value) {
//                                           setState(() {
//                                             _password1 = value!;
//                                           });
//                                         },
//                                         onSaved: (String? value) {
//                                           setState(() {
//                                             _password1 = value!;
//                                           });
//                                         },
//                                         validator: (String? value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'Password tidak boleh kosong!';
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               // Button Login
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(bottom: 25, top: 25),
//                                 child: TextButton(
//                                   style: TextButton.styleFrom(
//                                     minimumSize: const Size.fromHeight(45),
//                                     foregroundColor: Colors.white,
//                                     backgroundColor: Colors.blue,
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16.0),
//                                     shape: const RoundedRectangleBorder(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(10)),
//                                     ),
//                                   ),
//                                   child: const Text(
//                                     "Login",
//                                     style: TextStyle(fontSize: 18),
//                                   ),
//                                   onPressed: () async {
//                                     if (_loginFormKey.currentState!
//                                         .validate()) {
//                                       // 'username' and 'password' should be the values of the user login form.
//                                       final response = await request.login(
//                                           "https://jelajah-indonesia.up.railway.app/auth/login/",
//                                           {
//                                             'username': _username!,
//                                             'password': _password1!,
//                                           });
//                                       if (request.loggedIn) {
//                                         // Code here will run if the login succeeded.
//                                         _loginFormKey.currentState!.reset();
//                                         var cust =
//                                             User.fromJson(response["user"]);
//                                         user.setUser(cust);
//                                         Navigator.pushReplacement(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   const MyHomePage()),
//                                         );
//                                       } else {
//                                         // Code here will run if the login failed (wrong username/password).
//                                         showDialog(
//                                           context: context,
//                                           builder: (context) {
//                                             return Dialog(
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                               ),
//                                               elevation: 15,
//                                               child: Container(
//                                                 child: ListView(
//                                                   padding:
//                                                       const EdgeInsets.all(20),
//                                                   shrinkWrap: true,
//                                                   children: <Widget>[
//                                                     SizedBox(height: 20),
//                                                     Center(
//                                                       child: Column(children: [
//                                                         Text(
//                                                             response["message"],
//                                                             textAlign: TextAlign
//                                                                 .center,
//                                                             style: TextStyle(
//                                                                 fontSize: 16)),
//                                                       ]),
//                                                     ),
//                                                     SizedBox(height: 20),
//                                                     TextButton(
//                                                       onPressed: () {
//                                                         Navigator.pop(context);
//                                                       },
//                                                       child: Text(
//                                                         'ok',
//                                                         style: TextStyle(
//                                                             fontSize: 18),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         );
//                                       }
//                                     }
//                                   },
//                                 ),
//                               ),

//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 25, bottom: 35),
//                                 child: const Text(
//                                   "OR",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   const Text(
//                                     "New to our Journey?",
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                   TextButton(
//                                       onPressed: () {},
//                                       child: Text(
//                                         "Register",
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           color: Colors.blue,
//                                         ),
//                                       ))
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
