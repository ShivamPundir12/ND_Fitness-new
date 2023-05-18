import 'package:flutter/material.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/screens/onboard/material/photo_hero.dart';

class Onboard_screen extends StatefulWidget {
  Onboard_screen({Key? key}) : super(key: key);

  @override
  State<Onboard_screen> createState() => _Onboard_screenState();
}

class _Onboard_screenState extends State<Onboard_screen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    controller.forward();
  }

  void dispose() {
    super.dispose();
    controller.dispose();
    animation.isDismissed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 200),
              child: PhotoHero(
                photo: 'assets/logo.png',
                width: 95,
              ),
            ),
            const SizedBox(height: 50),
            FadeTransition(
              opacity: animation,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontFamily: 'Mukta',
                        fontSize: 35,
                        color: text_color2,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Track your Growth',
                      style: TextStyle(
                        fontFamily: 'Mukta',
                        fontSize: 22,
                        color: text_color2.withOpacity(0.8),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'seamlessly & intuitively',
                      style: TextStyle(
                        fontFamily: 'Mukta',
                        fontSize: 22,
                        color: text_color2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 80),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/signup'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: text_color2,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'Create an account',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Mukta',
                            fontWeight: FontWeight.w900,
                            color: background_color,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, '/signin'),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              color: text_color,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
