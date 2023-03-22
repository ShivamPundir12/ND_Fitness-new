import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/screens/info/activity_level.dart';
import 'package:nd_fitness/screens/info/age/widgets/wheeltile.dart';
import 'package:nd_fitness/screens/info/gender.dart';
import '../../../materials/colors.dart';
import 'data/statemodel.dart';

class age extends StatefulWidget {
  const age({Key? key}) : super(key: key);

  @override
  State<age> createState() => _ageState();
}

class _ageState extends State<age> {
  List<Age> states = [];

  String currentstate = '16';

  @override
  void initState() {
    super.initState();
    states = allStates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.13),
              child: Text(
                "How Old Are You!",
                style: TextStyle(
                    color: text_color2,
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Mukta"),
              ),
            ),
            Container(
              child: Text(
                "To give you a better experience and to get to know your gender",
                style: TextStyle(
                  color: text_color2.withOpacity(0.5),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Mukta",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      left: 90,
                      right: 90,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                CupertinoIcons.forward,
                                size: 38,
                                color: text_color,
                              ),
                              Icon(
                                CupertinoIcons.back,
                                size: 38,
                                color: text_color,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ListWheelScrollView.useDelegate(
                      itemExtent: 50,
                      perspective: 0.001,
                      diameterRatio: 2.0,
                      physics: FixedExtentScrollPhysics(),
                      squeeze: 0.7,
                      useMagnifier: true,
                      magnification: 2.0,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          currentstate = states[index].age!;
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                          childCount: states.length,
                          builder: (context, index) {
                            return wheeltile(
                                currentstate == states[index].age
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5),
                                states[index].age!);
                          }),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.06,
                  bottom: MediaQuery.of(context).size.height * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap:(){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> gender(),),);},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: text_color2.withOpacity(0.15),
                        border: Border.all(
                            strokeAlign: 1.0, width: 2, color: Colors.white),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Back',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: text_color2),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=> activity_level(),),);},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: text_color2,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: background_color),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
