import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/screens/info/activity_level.dart';
import 'package:nd_fitness/screens/info/age/widgets/wheeltile.dart';
import '../../../materials/colors.dart';
import '../info/age/data/statemodel.dart';

class Usr_Weight extends StatefulWidget {
  const Usr_Weight({Key? key}) : super(key: key);

  @override
  State<Usr_Weight> createState() => _Usr_WeightState();
}

class _Usr_WeightState extends State<Usr_Weight> {
  List<Age> states = [];

  String currentstate = '19';

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
                  top: MediaQuery.of(context).size.height * 0.08),
              child: Text(
                "Tell Us About Your Weight!",
                style: TextStyle(
                    color: text_color2,
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Mukta"),
              ),
            ),
            Container(
              child: Text(
                "To give you a better experience and to get to know your Weight",
                style: TextStyle(
                  color: text_color2.withOpacity(0.5),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Mukta",
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Expanded(
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      left: 90,
                      right: 90,
                      top: 90,
                      bottom: 0,
                      child: Center(
                        child: Container(
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: RotatedBox(
                            quarterTurns: 15,
                            child: Icon(
                              CupertinoIcons.forward,
                              size: 38,
                              color: text_color,
                            ),
                          ),
                        ),
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 19,
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 50,
                        perspective: 0.0001,
                        diameterRatio: 1.5,
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
                              return RotatedBox(
                                quarterTurns: -15,
                                child: wheeltile(
                                    currentstate == states[index].age
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5),
                                    states[index].age!),
                              );
                            }),
                      ),
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
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/age");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.04,
                          horizontal:
                              MediaQuery.of(context).size.height * 0.04),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Activity_level(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.04,
                          horizontal:
                              MediaQuery.of(context).size.height * 0.05),
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
