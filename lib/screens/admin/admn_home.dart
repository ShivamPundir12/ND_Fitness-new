import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/screens/admin/member/member_profile.dart';
import 'package:nd_fitness/screens/admin/usr_card.dart';
import 'package:nd_fitness/screens/auth/admin_auth.dart';

import '../onboard/material/photo_hero.dart';

class Admin_Home extends StatefulWidget {
  const Admin_Home({Key? key}) : super(key: key);

  @override
  State<Admin_Home> createState() => _Admin_HomeState();
}

class _Admin_HomeState extends State<Admin_Home> {
  final firebasefirestore =
      FirebaseFirestore.instance.collection('userdetail').get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                await AdminAuth.adminlogout(context);
              },
              icon: Icon(Icons.logout_rounded)),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        color: background_color,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: PhotoHero(
                    photo: 'assets/logo.png',
                    width: 70,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.08),
                  child: Text(
                    'Members',
                    style: TextStyle(
                        color: text_color2,
                        fontSize: 38,
                        fontFamily: 'Mukta',
                        fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
            Container(
              color: text_color2,
              height: 2,
              width: MediaQuery.of(context).size.width,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: StreamBuilder(
                      stream: firebasefirestore.asStream(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        } else {
                          final users = snapshot.data!.docs;
                          List<Usr_Card> userList = [];
                          for (var user in users) {
                            final name = user['Name'];
                            final age = user['Age'];
                            final profile = user['Picurl'];
                            final plan = user['Plan'];
                            final aclevel = user['Physical Activity'];
                            String userprofile;
                            final userdata = user.data();
                            if (userdata.containsKey('ProfileImage')) {
                              // Check if field exists
                              userprofile = user['ProfileImage'];
                            } else {
                              userprofile = profile;
                            }
                            userList.add(
                              Usr_Card(
                                  name: name,
                                  age: age,
                                  aclevel: aclevel,
                                  plan: plan,
                                  image: userprofile),
                            );
                          }
                          return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: userList.length,
                            itemBuilder: (context, index) {
                              final name = userList[index].name;
                              final age = userList[index].age;
                              final image = userList[index].image;
                              final aclevel = userList[index].aclevel;
                              final plan = userList[index].plan;
                              return GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Member_Profile(
                                            name: name,
                                            age: age,
                                            image: image,
                                            aclevel: aclevel,
                                            plan: plan),
                                      )),
                                  child: userList[index]);
                            },
                          );
                        }
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
