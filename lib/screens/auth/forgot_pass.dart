import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/generated/assets.dart';
import 'package:nd_fitness/services/authservice.dart';

import '../../widgets/textstyle.dart';
import 'sign_in.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
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
                        "Forgot Password",
                        style: TextStyle(
                            color: background_color,
                            fontSize: 30,
                            fontFamily: 'Mukta',
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Text(
                        'Enter Your Email',
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
                      decoration: InputDecoration(
                        hintText: "Your Email",
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
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => AuthServices.forgotpass(
                          context, emailController.text),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 18),
                        decoration: BoxDecoration(
                            color: background_color,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          'Send OTP',
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
            )
          ],
        ),
      ),
    );
  }
}
