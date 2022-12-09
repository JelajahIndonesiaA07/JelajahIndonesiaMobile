import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'register.dart';
import '../../../main.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Invalid Username and Password"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Ok",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003566),
                  ),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: SafeArea(
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 400,
                          decoration: BoxDecoration(
                            color: Color(0xFF003566),
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 5, 16, 10),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 32),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 5, 20, 5),
                                    child: TextFormField(
                                      cursorColor: Color(0xFF003566),
                                      decoration: InputDecoration(
                                        hintText: "Username",
                                        hintStyle:
                                            TextStyle(color: Color(0xFF003566)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Color(0xFF003566),
                                        ),
                                      ),
                                      validator: (uname) {
                                        if (uname!.isEmpty) {
                                          return 'Username Tidak boleh kosong';
                                        }
                                        username = uname;
                                        return null;
                                      },
                                    )),
                                Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 5, 20, 5),
                                    child: TextFormField(
                                      obscureText: true,
                                      cursorColor: Color(0xFF003566),
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Color(0xFF003566)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Color(0xFF003566),
                                        ),
                                      ),
                                      validator: (pass) {
                                        if (pass!.isEmpty) {
                                          return 'Password Tidak boleh kosong';
                                        }
                                        password = pass;
                                        return null;
                                      },
                                    )),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 5, 20, 5),
                                    child: SizedBox(
                                      height: 40, //height of button
                                      width: double.infinity, //width of button
                                      child: ElevatedButton(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xFFFFC300),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            // 'username' and 'password' should be the values of the user login form.
                                            await request.login(
                                                "https://slowlab-core.herokuapp.com/auth/flutter/login",
                                                {
                                                  "username": username,
                                                  "password": password,
                                                });
                                            if (request.loggedIn) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return MyApp();
                                                  },
                                                ),
                                              );
                                            } else {
                                              // Code here will run if the login failed (wrong username/password).
                                              await showInformationDialog(
                                                  context);
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 20, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Don't have an account?  ",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 0, 0),
                                          child: SizedBox(
                                            height: 30, //height of button
                                            width: 100, //width of button
                                            child: ElevatedButton(
                                                child: Text(
                                                  "Sign up",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    primary: Color(0xFFFFC300),
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
                                                        return RegisterPage();
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
  }
}