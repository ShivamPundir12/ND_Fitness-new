import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/generated/assets.dart';
import 'package:nd_fitness/materials/colors.dart';
import '../../services/secure_storage.dart';

class Usr_Profile extends StatefulWidget {
  const Usr_Profile({Key? key}) : super(key: key);

  @override
  State<Usr_Profile> createState() => _Usr_ProfileState();
}

class _Usr_ProfileState extends State<Usr_Profile> {
  final secure_storage secureStorage = secure_storage();
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut().whenComplete(
                        () => secureStorage
                            .deleteSecureData('email')
                            .whenComplete(
                              () => Navigator.pushNamedAndRemoveUntil(
                                  context, '/signin', (route) => false),
                            ),
                      );
                },
                icon: Icon(Icons.logout_outlined))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(Assets.assetsPerson))),
            ),
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
                        return new Text("Loading...");
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
                              userDocument?["email"],
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
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Settings',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Mukta',
                                    fontWeight: FontWeight.w700,
                                    color: text_color2),
                              ),
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
