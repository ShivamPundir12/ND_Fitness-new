import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/generated/assets.dart';
import 'package:nd_fitness/screens/auth/admin_auth.dart';
import '../../widgets/textstyle.dart';
import 'sign_in.dart';

class Admin_sign_in extends StatefulWidget {
  const Admin_sign_in({Key? key}) : super(key: key);

  @override
  State<Admin_sign_in> createState() => _Admin_sign_inState();
}

class _Admin_sign_inState extends State<Admin_sign_in> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscuretext = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: background_color,
      appBar: AppBar(
        backgroundColor: background_color,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Sign_in(),
                ),
              );
            },
            icon: Icon(CupertinoIcons.back)),
      ),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Image.asset(
              Assets.assetsLogo,
              scale: 35,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: text_color,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: Text(
                          "Welcome",
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
                        height: 50,
                      ),
                      Container(
                        child: Text(
                          'Owner Id',
                          style: customstyle(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email is required";
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please a valid Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your owner id',
                          suffixIcon: Icon(CupertinoIcons.mail),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                        style: customstyle(
                          size: 15,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Text(
                          'Password',
                          style: customstyle(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        obscureText: obscuretext,
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          } else if (value.trim().length < 6) {
                            return 'Password must be at least 8 characters in length';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {});
                              obscuretext = !obscuretext;
                            },
                            child: Icon(
                              obscuretext
                                  ? CupertinoIcons.eye_fill
                                  : CupertinoIcons.eye_slash_fill,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                        style: customstyle(
                          size: 15,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          "Forgot password?",
                          style: customstyle(
                            size: 16,
                            color: background_color,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              });
                          await AdminAuth.adminSignIn(context,
                              emailController.text, passwordController.text);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 18),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
