import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/generated/assets.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/screens/user/user_drawer.dart';
import '../../services/secure_storage.dart';

class Usr_Profile extends StatefulWidget {
  const Usr_Profile({Key? key}) : super(key: key);

  @override
  State<Usr_Profile> createState() => _Usr_ProfileState();
}

class _Usr_ProfileState extends State<Usr_Profile> {
  final secure_storage secureStorage = secure_storage();
  final user = FirebaseAuth.instance.currentUser!;
  bool _isClicked = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // Method to toggle the drawer state
  void _toggleDrawer() {
    setState(() {
      _isClicked = !_isClicked;
    });
    _scaffoldKey.currentState!.openEndDrawer(); // Open Drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: CustomDrawer.drawer(context),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => _toggleDrawer(),
              icon: Transform.rotate(
                angle: _isClicked ? pi / 2 : 0,
                child: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.bottomCenter,
          children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('userdetail')
                    .doc(user.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  var userDocument = snapshot.data!.data();
                  var profileImageUrl = userDocument?['ProfileImage'];
                  if (profileImageUrl != null) {
                    return Stack(
                      children: [
                        Center(
                          child: CircularProgressIndicator(
                              color: background_color),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(profileImageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.assetsPerson),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }
                }),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.03),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03,
                    vertical: MediaQuery.of(context).size.height * 0.01),
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: text_color.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('userdetail')
                        .doc(user.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return new CircularProgressIndicator(
                          color: text_color,
                        );
                      }
                      var userDocument = snapshot.data;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  userDocument?["Name"],
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Mukta',
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: card,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    'Member',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Mukta',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              user.email.toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Mukta',
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Text(
                              userDocument?["Mobile no"],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Mukta',
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(
                              userDocument?["Address"],
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Mukta',
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ));
  }
}
