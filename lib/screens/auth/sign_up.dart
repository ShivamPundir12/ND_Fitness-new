import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/services/authservice.dart';

import '../../services/Message.dart';
import '../../widgets/textstyle.dart';
import '../onboard/material/photo_hero.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  var email;
  bool _obscuretext = true;
  bool _obsecuretxt = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpassController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpassController.dispose();
    super.dispose();
  }

  bool passwordConfirmed() {
    var e;
    if (passwordController.text.trim() == confirmpassController.text.trim()) {
      return true;
    } else {
      Message.custommessage(e, context);
    }
    return false;
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
              Navigator.pushNamed(context, '/onboard');
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
                width: MediaQuery.of(context).size.width * 0.2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
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
                  child: Form(
                    key: _formkey,
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
                            "Hey there, Sign up to continue!",
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
                            'Email',
                            style: customstyle(
                                color: black.withOpacity(0.7)
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            suffixIcon: Icon(CupertinoIcons.mail),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18)),
                          ),
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
                          style: customstyle(
                              size: 15,
                              color: black.withOpacity(0.4)
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Text(
                            'Password',
                            style: customstyle(
                                color: black.withOpacity(0.7)
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _obscuretext,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18)),
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
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.trim().length < 6) {
                              return 'Password must be at least 8 characters in length';
                            }
                            return null;
                          },
                          style: customstyle(
                              size: 15,
                              color: black.withOpacity(0.4)
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Text(
                            'Confirm password',
                            style: customstyle(
                                color: black.withOpacity(0.7)
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: confirmpassController,
                          obscureText: _obsecuretxt,
                          decoration: InputDecoration(
                            hintText: 'Confirm your password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18)),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {});
                                _obsecuretxt = !_obsecuretxt;
                              },
                              child: Icon(
                                _obsecuretxt
                                    ? CupertinoIcons.eye_fill
                                    : CupertinoIcons.eye_slash_fill,
                              ),
                            ),
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Enter Something'),
                          ]),
                          style: customstyle(
                              size: 15,
                              color: black.withOpacity(0.4)
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                                color: background_color,
                                fontSize: 16,
                                fontFamily: "Mukta",
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            try {
                              if (passwordConfirmed()) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    });
                                AuthServices.signup(emailController.text,
                                    passwordController.text, context);
                              }
                            } catch (e) {
                              Message.custommessage(e.toString(), context)
                                  .Navigator
                                  .of(context)
                                  .pop();
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                                color: background_color,
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: text_color2),
                            ),
                          ),
                        )
                      ],
                    ),
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
