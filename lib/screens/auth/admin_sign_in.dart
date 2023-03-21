import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/generated/assets.dart';

class admin_sign_in extends StatefulWidget {
  const admin_sign_in({Key? key}) : super(key: key);

  @override
  State<admin_sign_in> createState() => _admin_sign_inState();
}

class _admin_sign_inState extends State<admin_sign_in> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      appBar: AppBar(
        backgroundColor: background_color,
        elevation: 0,
        leading: IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.back)),
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
                      decoration: InputDecoration(
                        hintText: 'Enter your owner id',
                        suffixIcon: Icon(CupertinoIcons.mail),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)),
                      ),
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 15,
                          fontFamily: 'Mukta',
                          fontWeight: FontWeight.w500),
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
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        suffixIcon: Icon(CupertinoIcons.eye),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)),
                      ),
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 15,
                          fontFamily: 'Mukta',
                          fontWeight: FontWeight.w500),
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
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                          color: background_color,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text('Sign in', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: text_color2),),
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

