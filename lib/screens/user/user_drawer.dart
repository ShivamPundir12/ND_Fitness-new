import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/generated/assets.dart';
import 'package:nd_fitness/screens/info/profilecontroller/profilecontroller.dart';
import 'package:provider/provider.dart';
import '../../materials/colors.dart';
import '../../services/secure_storage.dart';

class CustomDrawer {
  static drawer(BuildContext context) {
    final secure_storage secureStorage = secure_storage();
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: ChangeNotifierProvider(
              create: (context) => ProfileController(),
              child: Consumer<ProfileController>(
                builder: (
                  context,
                  provider,
                  child,
                ) {
                  return Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                          child: Text(
                            "Edit Profile",
                          ),
                          alignment: Alignment.topRight),
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
                                CircleAvatar(
                                  radius: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(profileImageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 60,
                                  left: 75,
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 3, color: Colors.white),
                                        color: indi_color),
                                    child: IconButton(
                                      onPressed: () {
                                        provider.pickImage(context);
                                      },
                                      icon: Icon(Icons.edit_outlined),
                                      color: Colors.white,
                                      iconSize: 15,
                                    ),
                                  ),
                                ),
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
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
              title: Text('Logout'),
              trailing: IconButton(
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
                icon: Icon(
                  Icons.logout_outlined,
                  color: black,
                ),
              )),
          // ListTile(
          //   title: Text('Item 2'),
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }
}
