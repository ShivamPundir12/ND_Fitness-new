import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/services/firestore.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _emrccontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _namecontroller = TextEditingController();
  final _dobcontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _mobnocontroller = TextEditingController();
  final _relatvnamecontroller = TextEditingController();
  final _reltioncontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _namecontroller.dispose();
    _dobcontroller.dispose();
    _addresscontroller.dispose();
    _mobnocontroller.dispose();
    _relatvnamecontroller.dispose();
    _reltioncontroller.dispose();
    _emrccontroller.dispose();
    super.dispose();
  }

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
                                controller: _namecontroller,
                                decoration: InputDecoration(
                                  hintText: 'Enter your full name',
                                  suffixIcon: Icon(CupertinoIcons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
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
                                controller: _dobcontroller,
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
                                controller: _addresscontroller,
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
                                controller: _mobnocontroller,
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
                                controller: _emailcontroller,
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
                                controller: _relatvnamecontroller,
                                decoration: InputDecoration(
                                  hintText: 'Enter your full name',
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
                                controller: _emrccontroller,
                                decoration: InputDecoration(
                                  hintText: 'Enter your Mobile no.',
                                  suffixIcon: Icon(CupertinoIcons.phone),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
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
                                controller: _reltioncontroller,
                                decoration: InputDecoration(
                                  hintText: 'Enter your Relationship.',
                                  suffixIcon: Icon(CupertinoIcons.person_2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
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
                      child: GestureDetector(
                        onTap: () {
                          Firecloud.adduserdetail(
                              _namecontroller.text.trim(),
                              _emailcontroller.text.trim(),
                              int.parse(_mobnocontroller.text.trim()),
                              int.parse(_dobcontroller.text.trim()),
                              _addresscontroller.text.trim(),
                              _relatvnamecontroller.text.trim(),
                              _reltioncontroller.text.trim(),
                              _emrccontroller.text.trim());
                          Navigator.pushNamedAndRemoveUntil(
                                  context, "/member", ((route) => false))
                              .whenComplete(
                            () => ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("All Set"),
                              ),
                            ),
                          );
                        },
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
