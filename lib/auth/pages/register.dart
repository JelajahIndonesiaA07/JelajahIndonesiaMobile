// ignore_for_file: non_constant_identifier_names, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login_page.dart';

bool uname_availability = false;

Future<http.Response> registFlutter(
    String username, String email, String pass1, String pass2) {
  return http.post(
    Uri.parse('https://slowlab-core.herokuapp.com/auth/flutter/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'email': email,
      'password1': pass1,
      'password2': pass2,
    }),
  );
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

Future<bool> uname_check(String uname) async {
  String url = "https://slowlab-core.herokuapp.com/auth/ajax/uname_verif?username=$uname";
  try {
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    Map<String, dynamic> extractedData = jsonDecode(response.body);
    if (extractedData["user"] == true) {
      uname_availability = true;
      return true;
    }
    uname_availability = false;
    return false;
  } catch (error) {
    print("Username Checker Error");
    return false;
  }
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String username = "";
    String email = "";
    String password1 = "";
    String password2 = "";

    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: SafeArea(
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 550,
                          decoration: BoxDecoration(
                            color: const Color(0xFF003566),
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                          ),
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 5, 16, 10),
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 32),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20, 5, 20, 5),
                                    child: TextFormField(
                                      onChanged: (value) => uname_check(value),
                                      cursorColor: const Color(0xFF003566),
                                      decoration: InputDecoration(
                                        hintText: "Username",
                                        hintStyle:
                                            const TextStyle(color: Color(0xFF003566)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        prefixIcon: const Icon(
                                          Icons.person,
                                          color: Color(0xFF003566),
                                        ),
                                      ),
                                      validator: (uname) {
                                        if (uname!.isEmpty) {
                                          return 'Username Tidak boleh kosong';
                                        }
                                        uname_check(uname);
                                        if (!uname_availability) {
                                          return 'Username telah digunakan';
                                        }
                                        username = uname;
                                        return null;
                                      },
                                    )),
                                Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20, 5, 20, 5),
                                    child: TextFormField(
                                      obscureText: true,
                                      cursorColor: const Color(0xFF003566),
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                            const TextStyle(color: Color(0xFF003566)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color: Color(0xFF003566),
                                        ),
                                      ),
                                      validator: (pass1) {
                                        if (pass1!.isEmpty) {
                                          return 'Password Tidak boleh kosong';
                                        }
                                        password1 = pass1;
                                        return null;
                                      },
                                    )),
                                Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20, 5, 20, 5),
                                    child: TextFormField(
                                      obscureText: true,
                                      cursorColor: const Color(0xFF003566),
                                      decoration: InputDecoration(
                                        hintText: "Confirm Password",
                                        hintStyle:
                                            const TextStyle(color: Color(0xFF003566)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color: Color(0xFF003566),
                                        ),
                                      ),
                                      validator: (confirmPassword) {
                                        if (confirmPassword!.isEmpty) {
                                          return 'Confirm Password Tidak boleh kosong';
                                        }
                                        password2 = confirmPassword;
                                        return null;
                                      },
                                    )),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20, 5, 20, 5),
                                    child: SizedBox(
                                      height: 40, //height of button
                                      width: double.infinity, //width of button
                                      child: ElevatedButton(
                                        child: const Text(
                                          "Sign Up",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color(0xFFFFC300),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            if (password1 == password2) {
                                              registFlutter(username, email,
                                                  password1, password2);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return const LoginPage();
                                                  },
                                                ),
                                              );
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20, 20, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Already have an account?",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 0, 0),
                                          child: SizedBox(
                                            height: 30, //height of button
                                            width: 100, //width of button
                                            child: ElevatedButton(
                                                child: const Text(
                                                  "Login",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    primary: const Color(0xFFFFC300),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20))),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return const LoginPage();
                                                      },
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )))));
    // Size size = MediaQuery.of(context).size;
    // return Scaffold(
    //     appBar: AppBar(
    //       title: const Text("Auth"),
    //     ),
    //     body: Form(
    //       key: _formKey,
    //       child: Container(
    //         width: double.infinity,
    //         height: double.infinity,
    //         child: Align(
    //           alignment: Alignment.center,
    //           child: Container(
    //             constraints: BoxConstraints(
    //                 minHeight: 700,
    //                 minWidth: 200,
    //                 maxWidth: 700,
    //                 maxHeight: 700),
    //             padding: EdgeInsets.all(20.0),
    //             decoration: BoxDecoration(
    //                 color: Color(0xFF003566),
    //                 borderRadius: BorderRadius.all(Radius.circular(20))),
    //             margin: EdgeInsets.all(50),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Text(
    //                   "Register",
    //                   style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.white,
    //                       fontSize: 32),
    //                 ),
    //                 SizedBox(height: 16),
    //                 Container(
    //                   margin:
    //                       EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //                   padding:
    //                       EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    //                   decoration: BoxDecoration(
    //                     color: Colors.white,
    //                     borderRadius: BorderRadius.circular(29),
    //                   ),
    //                   child: TextFormField(
    //                     cursorColor: Color(0xFF003566),
    //                     decoration: InputDecoration(
    //                       hintText: "Username",
    //                       icon: Icon(
    //                         Icons.person,
    //                         color: Color(0xFF003566),
    //                       ),
    //                       border: InputBorder.none,
    //                     ),
    //                     validator: (username) {
    //                       if (username!.isEmpty) {
    //                         return 'Username Tidak boleh kosong';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                 ),
    //                 Container(
    //                   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    //                   decoration: BoxDecoration(
    //                     color: Colors.white,
    //                     borderRadius: BorderRadius.circular(29),
    //                   ),
    //                   child: TextFormField(
    //                     cursorColor: Color(0xFF003566),
    //                     decoration: InputDecoration(
    //                       hintText: "Email",
    //                       icon: Icon(
    //                         Icons.mail,
    //                         color: Color(0xFF003566),
    //                       ),
    //                       border: InputBorder.none,
    //                     ),
    //                     validator: (email) {
    //                       if (email!.isEmpty) {
    //                         return 'Email Tidak boleh kosong';
    //                       } if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
    //                         return 'Email Tidak Valid';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                 ),
    //                 Container(
    //                   margin:
    //                       EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //                   padding:
    //                       EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    //                   decoration: BoxDecoration(
    //                     color: Colors.white,
    //                     borderRadius: BorderRadius.circular(29),
    //                   ),
    //                   child: TextFormField(
    //                     cursorColor: Color(0xFF003566),
    //                     decoration: InputDecoration(
    //                       hintText: "Password",
    //                       icon: Icon(
    //                         Icons.lock,
    //                         color: Color(0xFF003566),
    //                       ),
    //                       border: InputBorder.none,
    //                     ),
    //                     validator: (password) {
    //                       if (password!.isEmpty) {
    //                         return 'Password Tidak boleh kosong';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                 ),
    //                 Container(
    //                   margin:
    //                       EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //                   padding:
    //                       EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    //                   decoration: BoxDecoration(
    //                     color: Colors.white,
    //                     borderRadius: BorderRadius.circular(29),
    //                   ),
    //                   child: TextFormField(
    //                     obscureText: true,
    //                     cursorColor: Color(0xFF003566),
    //                     decoration: InputDecoration(
    //                       hintText: "Confirm Password",
    //                       icon: Icon(
    //                         Icons.lock,
    //                         color: Color(0xFF003566),
    //                       ),
    //                       border: InputBorder.none,
    //                     ),
    //                     validator: (password1) {
    //                       if (password1!.isEmpty) {
    //                         return 'Password Tidak boleh kosong';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                 ),
    //                 SizedBox(height: 16),
    //                 SizedBox(
    //                   height: 40, //height of button
    //                   width: 200, //width of button
    //                   child: ElevatedButton(
    //                     child: Text(
    //                       "Sign-Up",
    //                       style: TextStyle(color: Colors.black),
    //                     ),
    //                     style: ButtonStyle(
    //                       shape: MaterialStateProperty.all<
    //                               RoundedRectangleBorder>(
    //                           RoundedRectangleBorder(
    //                               borderRadius: BorderRadius.circular(18.0),
    //                               side: BorderSide(color: Color(0xFFFFC300)))),
    //                       backgroundColor: MaterialStateProperty.all<Color>(
    //                           Color(0xFFFFC300)),
    //                     ),
    //                     onPressed: () {
    //                       if (_formKey.currentState!.validate()) {
    //                         Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                             builder: (context) {
    //                               return RegisterPage();
    //                             },
    //                           ),
    //                         );
    //                       }
    //                     },
    //                   ),
    //                 ),
    //                 SizedBox(height: 20),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: <Widget>[
    //                     Text(
    //                       "Already have an account?  ",
    //                       style: TextStyle(color: Colors.white),
    //                     ),
    //                     SizedBox(
    //                   height: 30, //height of button
    //                   width: 100, //width of button
    //                   child: ElevatedButton(
    //                       child: Text(
    //                         "Login",
    //                         style: TextStyle(color: Colors.black),
    //                       ),
    //                       style: ButtonStyle(
    //                         shape: MaterialStateProperty.all<
    //                                 RoundedRectangleBorder>(
    //                             RoundedRectangleBorder(
    //                                 borderRadius: BorderRadius.circular(18.0),
    //                                 side:
    //                                     BorderSide(color: Color(0xFFFFC300)))),
    //                         backgroundColor: MaterialStateProperty.all<Color>(
    //                             Color(0xFFFFC300)),
    //                       ),
    //                       onPressed: () {
    //                         Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                             builder: (context) {
    //                               return AuthPage();
    //                             },
    //                           ),
    //                         );
    //                       },
    //                     ),
    //                 ),

    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ));
  }
}