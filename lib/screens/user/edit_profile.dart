import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/generated/assets.dart';
import 'package:nd_fitness/materials/reuseablerow.dart';
import 'package:nd_fitness/screens/info/profilecontroller/profilecontroller.dart';
import 'package:provider/provider.dart';
import '../../materials/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final user = FirebaseAuth.instance.currentUser!;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  final firebasefirestore = FirebaseFirestore.instance
      .collection('userdetail')
      .doc(FirebaseAuth.instance.currentUser?.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.chevron_back,
              color: Colors.black,
              size: 35,
            )),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.01,
                vertical: MediaQuery.of(context).size.width * 0.01),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff08074C),
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 25,
                  )),
            ),
          )
        ],
      ),
      body: ChangeNotifierProvider(
        create: (_) => ProfileController(),
        child: Consumer<ProfileController>(
          builder: (context, provider, child) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.025,
                vertical: MediaQuery.of(context).size.width * 0.02,
              ),
              child: StreamBuilder<DocumentSnapshot>(
                  stream: firebasefirestore.snapshots(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    var userDocument = snapshot.data;
                    var profileImageUrl = userDocument?['ProfileImage'];
                    var name = userDocument?['Name'];
                    var age = userDocument?['Age'];
                    var address = userDocument?['Address'];
                    var gender = userDocument?['Gender'];
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Account',
                              style: TextStyle(
                                fontSize: 36,
                                fontFamily: 'Mukta',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Image',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Mukta',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                              ),
                              Column(
                                children: [
                                  Builder(builder: (context) {
                                    if (profileImageUrl != null) {
                                      return Stack(
                                        children: [
                                          CircleAvatar(
                                            radius: 55,
                                            child: Stack(children: [
                                              Center(
                                                child: CircularProgressIndicator
                                                    .adaptive(),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        profileImageUrl),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage(Assets.assetsPerson),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    }
                                  }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () => provider.pickImage(context),
                                    child: Container(
                                      child: Text(
                                        'Edit Image',
                                        style: TextStyle(
                                          color: background_color,
                                          fontSize: 20,
                                          fontFamily: 'Mukta',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          GestureDetector(
                            onTap: () =>
                                provider.showUserNameDialogAlert(context, name),
                            child: InfoRow(
                              title: "Name",
                              value: name ?? "",
                              width: MediaQuery.of(context).size.width * 0.18,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  'Gender',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Mukta',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.18,
                              ),
                              Container(
                                width: 120,
                                child: DropdownButtonFormField(
                                  value: gender,
                                  items: <String>['Male', 'Female']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: text_color),
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                  ),
                                  onChanged: (Object? value) async {
                                    setState(() {
                                      firebasefirestore
                                          .update({"Gender": value});
                                      gender = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          GestureDetector(
                            onTap: () =>
                                provider.showUserAgeDialogAlert(context, age),
                            child: InfoRow(
                              title: "Age",
                              width: MediaQuery.of(context).size.width * 0.25,
                              value: age,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          GestureDetector(
                            onTap: () => provider.showUserAddressDialogAlert(
                                context, address),
                            child: InfoRow(
                                title: "Email",
                                width: MediaQuery.of(context).size.width * 0.18,
                                value: user.email.toString()),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          InfoRow(
                              title: "Address",
                              width: MediaQuery.of(context).size.width * 0.13,
                              value: address ?? ""),
                        ],
                      ),
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}
