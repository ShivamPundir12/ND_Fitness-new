import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/screens/auth/sign_up.dart';
import 'package:nd_fitness/services/authservice.dart';
import 'package:nd_fitness/services/secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/textstyle.dart';
import '../onboard/material/photo_hero.dart';

class Sign_in extends StatefulWidget {
  const Sign_in({Key? key}) : super(key: key);

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  var email;
  bool _obscuretext = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpassController = TextEditingController();
  final secure_storage secureStorage = secure_storage();
  final user = FirebaseAuth.instance.currentUser;
  final firebasefirestore = FirebaseFirestore.instance
      .collection('userdetail')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .snapshots();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void validate() {
    if (formkey.currentState!.validate()) {
      print('Ok');
    } else {
      print('error');
    }
  }

  Future _saveFieldValues() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      appBar: AppBar(
        backgroundColor: background_color,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/onboard");
            },
            icon: Icon(CupertinoIcons.back)),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.03,
              ),
              child: PhotoHero(
                photo: 'assets/logo.png',
                width: MediaQuery.of(context).size.width * 0.2,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  decoration: BoxDecoration(
                    color: text_color,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: formkey,
                    child: StreamBuilder(
                        stream: firebasefirestore,
                        builder: (context, snapshot) {
                          var userdata = snapshot.data;
                          // String loginkey = userdata?["Name"];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Container(
                                child: Text(
                                  "Welcome Back",
                                  style: TextStyle(
                                      color: background_color,
                                      fontSize: 30,
                                      fontFamily: 'Mukta',
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Hey there, Sign in to continue!",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 18,
                                      fontFamily: 'Mukta',
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                              Container(
                                child: Text('Username or Email',
                                    style: customstyle(
                                        color: black.withOpacity(0.7))),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your username or email',
                                  suffixIcon: Icon(CupertinoIcons.mail),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                                style: customstyle(
                                    size: 15, color: black.withOpacity(0.4)),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email is required";
                                  }
                                  if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return 'Please a valid Email';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  email = value;
                                },
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Container(
                                child: Text('Password',
                                    style: customstyle(
                                        color: black.withOpacity(0.7))),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              TextFormField(
                                controller: passwordController,
                                obscureText: _obscuretext,
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                      _obscuretext = !_obscuretext;
                                    },
                                    child: Icon(
                                      _obscuretext
                                          ? CupertinoIcons.eye_fill
                                          : CupertinoIcons.eye_slash_fill,
                                    ),
                                  ),
                                  hintText: 'Enter your password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                                style: customstyle(
                                    size: 15, color: black.withOpacity(0.4)),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password is required';
                                  } else if (value.trim().length < 6) {
                                    return 'Password must be at least 8 characters in length';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              GestureDetector(
                                onTap: () async {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      });
                                  // save the email field value
                                  _saveFieldValues();
                                  // User login Function
                                  await AuthServices.login(
                                    emailController.text,
                                    passwordController.text,
                                    context,
                                  );
                                  // check if the user has data
                                  if (userdata!.exists) {
                                    // proceed to user profile page
                                    Navigator.pushNamed(context, '/usrprofile');
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.025),
                                  decoration: BoxDecoration(
                                      color: background_color,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: text_color2),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                              GestureDetector(
                                onTap: () =>
                                    Navigator.pushNamed(context, "/ForgotPass"),
                                child: Container(
                                  child: Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                        color: background_color,
                                        fontSize: 16,
                                        fontFamily: "Mukta",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.04),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Admin?',
                                      style: TextStyle(
                                        color:
                                            background_color.withOpacity(0.6),
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/adsignin');
                                      },
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                            color: background_color,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Didn't have an account?",
                                      style: TextStyle(
                                        color:
                                            background_color.withOpacity(0.6),
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Sign_up(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Sign up',
                                        style: TextStyle(
                                            color: background_color,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        }),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
