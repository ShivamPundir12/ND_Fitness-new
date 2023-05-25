import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/generated/assets.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/screens/user/edit_profile.dart';
import 'package:nd_fitness/screens/user/plan.dart';
import 'package:nd_fitness/screens/user/user_drawer.dart';
import '../../services/authservice.dart';
import '../../services/secure_storage.dart';

class Usr_Profile extends StatefulWidget {
  const Usr_Profile({Key? key}) : super(key: key);

  @override
  State<Usr_Profile> createState() => _Usr_ProfileState();
}

class _Usr_ProfileState extends State<Usr_Profile> {
  final secure_storage secureStorage = secure_storage();
  final user = FirebaseAuth.instance.currentUser?.email;
  final firebasefirestore = FirebaseFirestore.instance
      .collection('userdetail')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .snapshots();
  // bool _isClicked = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // Method to toggle the drawer state
  // void _toggleDrawer() {
  //   setState(() {
  //     _isClicked = !_isClicked;
  //   });
  //   _scaffoldKey.currentState!.openEndDrawer(); // Open Drawer
  // }

  @override
  Widget build(BuildContext context) {
    // main body
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      key: _scaffoldKey,
      endDrawer: CustomDrawer.drawer(context),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                await AuthServices.signout(context);
              },
              icon: Icon(Icons.logout_rounded)),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.bottomCenter,
        children: [
          StreamBuilder(
              stream: firebasefirestore,
              builder: (context, snapshot) {
                var userDocument = snapshot.data?.data();
                var profileImageUrl = userDocument?['ProfileImage'];
                if (profileImageUrl != null) {
                  return Stack(
                    children: [
                      Center(
                        child:
                            CircularProgressIndicator(color: background_color),
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
                  return Stack(
                    children: [
                      Center(
                        child:
                            CircularProgressIndicator(color: background_color),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.assetsPerson),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
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
                  stream: firebasefirestore,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return new Text("Loading...");
                    }
                    var userDocument = snapshot.data;
                    String planName = userDocument?["Plan"];
                    Color planColor;
                    switch (planName) {
                      case "Bronze Plan":
                        planColor = Color(0xffCD7F32);
                        break;
                      case 'Gold Plan':
                        planColor = Color(0xffffd700);
                        break;
                      case 'Silver Plan':
                        planColor = Color(0xff808080);
                        break;
                      case 'Platinum Plan':
                        planColor = Color(0xffe5e4e2);
                        break;
                      default:
                        planColor = Colors.grey;
                    }
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
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Plan(),
                                    )),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: planColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    userDocument?["Plan"],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Mukta',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
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
                            user.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Mukta',
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          child: Text(
                            userDocument?["Mobile no"],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Mukta',
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 15,
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
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.height * 0.025,
                              vertical:
                                  MediaQuery.of(context).size.width * 0.06,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProfile(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.height *
                                          0.025,
                                  vertical:
                                      MediaQuery.of(context).size.width * 0.035,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Icon(Icons.edit),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
