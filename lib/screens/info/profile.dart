import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/materials/colors.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.06),
              alignment: Alignment.center,
              child: Text(
                'Fill Your Profile',
                style: TextStyle(
                    color: text_color2,
                    fontSize: 35,
                    fontFamily: 'Mukta',
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: text_color2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 130,
                      width: 130,
                      child: Icon(Icons.person, color: text_color2, size: 100),
                      decoration: BoxDecoration(
                          color: background_color, shape: BoxShape.circle),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your fullname',
                                  suffixIcon: Icon(CupertinoIcons.person),
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
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your D.O.B',
                                  suffixIcon:
                                      Icon(CupertinoIcons.calendar_today),
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
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your Address',
                                  suffixIcon: Icon(CupertinoIcons.home),
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
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your Mobile no.',
                                  suffixIcon: Icon(CupertinoIcons.phone),
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
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your Email',
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
                                height: 30,
                              ),
                              Container(
                                child: Text(
                                  'Emergency contact',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 20,
                                      fontFamily: 'Mukta',
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your fullname',
                                  suffixIcon: Icon(CupertinoIcons.person),
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
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your Mobile no.',
                                  suffixIcon: Icon(CupertinoIcons.phone),
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
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your Relationship.',
                                  suffixIcon: Icon(CupertinoIcons.person_2),
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
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          bottom: MediaQuery.of(context).size.height * 0.06),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: background_color,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Next',
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
