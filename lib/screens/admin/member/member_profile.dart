import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/materials/colors.dart';

class Member_Profile extends StatefulWidget {
  final String name;
  final String image;
  final String age;
  final String aclevel;
  final String plan;
  Member_Profile(
      {Key? key,
      required this.name,
      required this.age,
      required this.aclevel,
      required this.plan,
      required this.image})
      : super(key: key);

  @override
  State<Member_Profile> createState() => _Member_ProfileState();
}

class _Member_ProfileState extends State<Member_Profile> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> _query;

  @override
  void initState() {
    super.initState();
    _query = FirebaseFirestore.instance
        .collection('userdetail')
        .where('Name', isEqualTo: widget.name) // add where clause here
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: text_color2,
      body: StreamBuilder(
        stream: _query,
        builder: (context, snapshot) {
          final user = snapshot.data?.docs.first;
          final mobno = user?['Mobile no'];
          final address = user?['Address'];
          final email = user?["Email"];
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                clipBehavior: Clip.none,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(300, 70),
                  ),
                  child: Image.network(widget.image, fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            widget.name,
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Mukta',
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            widget.age,
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Mukta',
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        "A Muscle freak with ambition and discipline to fulfill my dreams",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mukta',
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      child: Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Mukta',
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        email ?? "",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Mukta',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        "Mobile no.",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Mukta',
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        mobno ?? "",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Mukta',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        "Address",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Mukta',
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        address ?? "",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Mukta',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
