import 'package:flutter/material.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/screens/auth/sign_in.dart';
import '../auth/sign_up.dart';
import 'photo_hero.dart';

class onbaording_screen extends StatefulWidget {
  onbaording_screen({Key? key}) : super(key: key);

  @override
  State<onbaording_screen> createState() => _onbaording_screenState();
}

class _onbaording_screenState extends State<onbaording_screen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 4500), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            child: PhotoHero(
              photo: 'assets/logo.png',
              width: 110,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FadeTransition(
                opacity: animation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          fontFamily: 'Mukta',
                          fontSize: 35,
                          color: text_color2,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        'Track your Growth',
                        style: TextStyle(
                          fontFamily: 'Mukta',
                          fontSize: 22,
                          color: text_color2.withOpacity(0.8),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'seamlessly & intuitively',
                        style: TextStyle(
                          fontFamily: 'Mukta',
                          fontSize: 22,
                          color: text_color2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                              strokeAlign: 1.0, width: 2, color: Colors.white),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Create an account',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Mukta',
                              fontWeight: FontWeight.w700,
                              color: text_color),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: text_color.withOpacity(0.6),
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
                                    builder: (context) => sign_in()),
                              );
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  color: text_color,
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
            ),
          ),
        ],
      ),
    );
  }
}
