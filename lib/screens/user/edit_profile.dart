import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/generated/assets.dart';

import '../../materials/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
              horizontal: MediaQuery.of(context).size.height*0.01,
                vertical: MediaQuery.of(context).size.width*0.01
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff08074C),
                borderRadius: BorderRadius.circular(10)
              ),
              child: IconButton(onPressed: () {},
                  icon: Icon(Icons.done, color: Colors.white, size: 25,)
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height*0.025,
          vertical: MediaQuery.of(context).size.width*0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Text('Account',
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Mukta',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text('Image',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.2,
                ),
                Column(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 100,
                      width: 100,
                      child: Image.asset(Assets.assetsPerson, fit: BoxFit.cover,),
                      decoration: BoxDecoration(
                          color: background_color,
                          shape: BoxShape.circle),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text('Edit Image',
                        style: TextStyle(
                          color: background_color,
                          fontSize: 20,
                          fontFamily: 'Mukta',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
            Row(
              children: [
                Container(
                  child: Text('Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.2,
                ),
                Container(
                  child: Text('David Warner',
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
            Row(
              children: [
                Container(
                  child: Text('Gender',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.18,
                ),
                Container(
                  child: Text('Male',
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
            Row(
              children: [
                Container(
                  child: Text('Age',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.25,
                ),
                Container(
                  child: Text('28',
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
            Row(
              children: [
                Container(
                  child: Text('Email',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.2,
                ),
                Container(
                  child: Text('demouser111@gmail.c',
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
            Row(
              children: [
                Container(
                  child: Text('Address',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.18,
                ),
                Container(
                  child: Text('Ghar',
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
