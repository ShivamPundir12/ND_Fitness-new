// ignore_for_file: unnecessary_null_comparison, unused_field

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:nd_fitness/services/agecalc.dart';
import 'package:nd_fitness/services/validationservice.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/screens/info/profilecontroller/profilecontroller.dart';
import 'package:nd_fitness/services/Message.dart';
import 'package:nd_fitness/services/firestore.dart';
import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // All textfield controllers
  final _emrccontroller = TextEditingController();
  final _namecontroller = TextEditingController();
  final _dobcontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _mobnocontroller = TextEditingController();
  final _relatvnamecontroller = TextEditingController();
  final _reltioncontroller = TextEditingController();
  // instance of Agecalculator Class
  AgeCalc _ageCalc = AgeCalc();
  // instance of Validtor Class
  Valid validate = Valid();
  // instance of Firestore Class
  Firecloud userData = Firecloud();
  // Form key for validation
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  // Current date time
  DateTime _date = DateTime.now();
  // Prefix text for Mobile number field
  String _pretext = "+91 ";

  @override
  void dispose() {
    _namecontroller.dispose();
    _dobcontroller.dispose();
    _addresscontroller.dispose();
    _mobnocontroller.dispose();
    _relatvnamecontroller.dispose();
    _reltioncontroller.dispose();
    _emrccontroller.dispose();
    super.dispose();
  }

// Date Picker Method
  Future<Null> showDateSelector(BuildContext context) async {
    DateTime? datepicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2025));

    if (datepicker != null && datepicker != _date) {
      setState(() {
        _date = datepicker;
      });
    }
    _dobcontroller.text = "${(DateFormat('dd/MM/yy').format(datepicker!))}";
    _agecontroller.text = "${_ageCalc.calculateAge(datepicker)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: ChangeNotifierProvider(
        create: (_) => ProfileController(),
        child: Consumer<ProfileController>(
          builder: (context, provider, child) {
            return Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.06),
                    alignment: Alignment.center,
                    child: Text(
                      'Fill Your Profile',
                      style: TextStyle(
                          color: text_color2,
                          fontSize: 35,
                          fontFamily: 'Mukta',
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: text_color2,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Stack(children: [
                              Container(
                                height: 120,
                                width: 120,
                                child: provider.image == null
                                    ? Icon(Icons.person,
                                        color: text_color2, size: 75)
                                    : Image.file(
                                        File(provider.image!.path).absolute,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            child: Icon(
                                              Icons.error_outline,
                                              color: background_color,
                                            ),
                                          );
                                        },
                                      ),
                                decoration: BoxDecoration(
                                    color: background_color,
                                    shape: BoxShape.circle),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 3, color: Colors.white),
                                        color: Colors.blue),
                                    child: IconButton(
                                      onPressed: () {
                                        provider.pickImage(context);
                                      },
                                      icon: Icon(CupertinoIcons.plus),
                                      color: Colors.white,
                                      iconSize: 15,
                                    ),
                                  ))
                            ]),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              child: Form(
                                key: _formkey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      enableInteractiveSelection: true,
                                      validator: validate.formvaild,
                                      controller: _namecontroller,
                                      decoration: InputDecoration(
                                        labelText: 'Enter your full name',
                                        suffixIcon: Icon(CupertinoIcons.person),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 15,
                                          fontFamily: 'Mukta',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      readOnly: true,
                                      validator: validate.formvaild,
                                      keyboardType: TextInputType.none,
                                      onTap: () async {
                                        FocusScope.of(context)
                                            .requestFocus(new FocusNode());
                                        showDateSelector(context);
                                      },
                                      controller: _dobcontroller,
                                      decoration: InputDecoration(
                                        labelText: 'Enter your D.O.B',
                                        suffixIcon:
                                            Icon(CupertinoIcons.calendar_today),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                      ),
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 15,
                                          fontFamily: 'Mukta',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      validator: validate.formvaild,
                                      controller: _addresscontroller,
                                      decoration: InputDecoration(
                                        labelText: 'Enter your Address',
                                        suffixIcon: Icon(CupertinoIcons.home),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                      ),
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 15,
                                          fontFamily: 'Mukta',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.phone,
                                      onChanged: (value) {
                                        _formkey.currentState?.validate();
                                      },
                                      validator: validate.mobilevalid,
                                      controller: _mobnocontroller,
                                      decoration: InputDecoration(
                                        prefixText: _pretext,
                                        labelText: 'Enter your Mobile no.',
                                        suffixIcon: Icon(CupertinoIcons.phone),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                      ),
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 15,
                                          fontFamily: 'Mukta',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      child: Text(
                                        'Emergency contact',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            fontSize: 20,
                                            fontFamily: 'Mukta',
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      validator: validate.formvaild,
                                      controller: _relatvnamecontroller,
                                      decoration: InputDecoration(
                                        labelText: 'Enter your full name',
                                        suffixIcon: Icon(CupertinoIcons.person),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                      ),
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 15,
                                          fontFamily: 'Mukta',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.phone,
                                      controller: _emrccontroller,
                                      onChanged: (value) {
                                        _formkey.currentState?.validate();
                                      },
                                      validator: validate.mobilevalid,
                                      decoration: InputDecoration(
                                        prefixText: _pretext,
                                        labelText: 'Enter your Mobile no.',
                                        suffixIcon: Icon(CupertinoIcons.phone),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 15,
                                          fontFamily: 'Mukta',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      validator: validate.formvaild,
                                      controller: _reltioncontroller,
                                      decoration: InputDecoration(
                                        labelText: 'Enter your Relationship.',
                                        suffixIcon:
                                            Icon(CupertinoIcons.person_2),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 15,
                                          fontFamily: 'Mukta',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.05,
                                  bottom: MediaQuery.of(context).size.height *
                                      0.06),
                              child: InkWell(
                                onTap: () async {
                                  try {
                                    if (_formkey.currentState!.validate()) {
                                      userData.adduserdetail(
                                        _namecontroller.text,
                                        _mobnocontroller.text,
                                        _agecontroller.text,
                                        _addresscontroller.text,
                                        _relatvnamecontroller.text,
                                        _reltioncontroller.text,
                                        _emrccontroller.text,
                                      );
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        "/member",
                                        ((route) => false),
                                      );
                                    }
                                  } catch (e) {
                                    Message.custommessage(
                                        e.toString(), context);
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: background_color,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: text_color2),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
