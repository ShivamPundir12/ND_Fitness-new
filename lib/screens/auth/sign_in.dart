import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/screens/auth/sign_up.dart';
import 'package:nd_fitness/services/secure_storage.dart';

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
  late AnimationController controller;
  late Animation<double> animation;

  initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    animation = Tween<double>(begin: 0, end: 600).animate(controller);

    controller.forward();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  final formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState!.validate()) {
      print('Ok');
    } else {
      print('error');
    }
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Onboard_screen()),
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
              child: PhotoHero(
                photo: 'assets/logo.png',
                width: 60,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Align(
                  alignment: AlignmentDirectional(0, 0.7),
                  child: Transform.translate(
                    offset: Offset(0, animation.value),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
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
                            height: 50,
                          ),
                          Container(
                            child: Text(
                              'Username or Email',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 18,
                                  fontFamily: 'Mukta',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Enter your username or email',
                              suffixIcon: Icon(CupertinoIcons.mail),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 15,
                                fontFamily: 'Mukta',
                                fontWeight: FontWeight.w500),
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
                            height: 15,
                          ),
                          Container(
                            child: Text(
                              'Password',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 18,
                                  fontFamily: 'Mukta',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
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
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 15,
                                fontFamily: 'Mukta',
                                fontWeight: FontWeight.w500),
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
                            height: 20,
                          ),
                          GestureDetector(
                            // onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=> ()),);},
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
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
                              try {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    });
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: emailController.text.trim(),
                                            password:
                                                passwordController.text.trim());
                                await secureStorage.writeSecureData('email',
                                    userCredential.user!.email.toString());
                                secureStorage.writeSecureData(
                                    'name',
                                    userCredential.user!.displayName
                                        .toString());
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/gend', ((route) => false));
                              } on FirebaseAuthException catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.blueGrey.shade300,
                                  content: Text(
                                    e.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  duration: Duration(seconds: 3),
                                  behavior: SnackBarBehavior.floating,
                                ));
                                Navigator.of(context).pop();
                              }
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
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Didn't have an account?",
                  style: TextStyle(
                    color: background_color.withOpacity(0.6),
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 05,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sign_up(),
                      ),
                    );
                    SizedBox(
                      width: 05,
                    );
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/adsignin');
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            color: background_color,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                    );
                  },
                ),
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't have an account?",
                    style: TextStyle(
                      color: background_color.withOpacity(0.6),
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 05,
                  ),
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
        ),
      ),
    );
  }
}
