import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../materials/colors.dart';
// import 'member/model.dart';

class Usr_Card extends StatefulWidget {
  final String name;
  final String image;
  final String age;
  final String aclevel;
  final String plan;
  Usr_Card({
    Key? key,
    required this.name,
    required this.age,
    required this.aclevel,
    required this.plan,
    required this.image,
  }) : super(key: key);

  @override
  State<Usr_Card> createState() => _Usr_CardState();
}

class _Usr_CardState extends State<Usr_Card> {
  final firebasefirestore =
      FirebaseFirestore.instance.collection('userdetail').get();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        decoration: BoxDecoration(
            color: text_color2, borderRadius: BorderRadius.circular(20)),
        height: 190,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(
            stream: firebasefirestore.asStream(),
            builder: (context, snapshot) {
              return Row(
                children: [
                  Container(
                    clipBehavior: Clip.none,
                    padding: EdgeInsets.all(20),
                    child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.contain,
                          width: 100,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Mukta',
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              widget.age,
                              style: TextStyle(
                                  fontSize: 26,
                                  fontFamily: 'Mukta',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                color: card,
                                borderRadius: BorderRadius.circular(25)),
                            child: Text(
                              widget.plan,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Mukta',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                            color: aclevel,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          widget.aclevel,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Mukta',
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      )
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
