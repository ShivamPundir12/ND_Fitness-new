import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/materials/inputtext.dart';
import 'package:nd_fitness/services/Message.dart';

class ProfileController with ChangeNotifier {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController agecontroller = new TextEditingController();
  TextEditingController addresscontroller = new TextEditingController();
  final namefocusnode = FocusNode();
  final picker = ImagePicker();
  final firebaseuser = FirebaseAuth.instance.currentUser?.uid;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  File? _image;
  File? get image => _image;

//  Saving image In Local Storage Function
  Future<File?> saveImageLocally(File? image) async {
    if (image == null) return null;

    final savedImagePath = '/profileImage' + firebaseuser.toString();

    try {
      // copy the picked image file to a new file at the saved path
      await image.copy(savedImagePath);

      // return the new File object representing the saved image
      return File(savedImagePath);
    } catch (e) {
      // handle errors here
      print('Error saving image: $e');
      return null;
    }
  }

  // Choosing  image from the gallery
  Future pickGlleryImage(BuildContext context) async {
    final pickFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    if (pickFile != null) {
      _image = File(pickFile.path);
      notifyListeners();
      final savedImage = await saveImageLocally(image);
      uploadImage(context, savedImage ?? image);
    } else
      Message.custommessage("No Photo Selected", context);
    notifyListeners();
  }

  // Taking image from the camera
  Future pickCameraImage(BuildContext context) async {
    final pickFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);

    if (pickFile != null) {
      _image = File(pickFile.path);
      notifyListeners();
      final savedImage = await saveImageLocally(image);
      uploadImage(context, savedImage ?? image);
    } else
      Message.custommessage("No Photo Selected", context);
    notifyListeners();
  }

  // Alert box for Choosing to Take the Image from camera or gallery
  void pickImage(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 120,
            child: Column(children: [
              ListTile(
                onTap: () {
                  pickCameraImage(context);
                  Navigator.pop(context);
                },
                leading: Icon(Icons.camera, color: aclevel),
                title: Text("Camera"),
              ),
              ListTile(
                onTap: () {
                  pickGlleryImage(context);
                  Navigator.pop(context);
                },
                leading: Icon(Icons.image, color: aclevel),
                title: Text("Gallery"),
              ),
            ]),
          ),
        );
      },
    );
  }

  // upload profile image funtion
  void uploadImage(BuildContext context, File? imageFile) async {
    setLoading(true);
    var collection = FirebaseFirestore.instance.collection('userdetail');
    var docSnapshot = await collection.doc(firebaseuser).get();
    firebase_storage.Reference storageRef = firebase_storage
        .FirebaseStorage.instance
        .ref('/profileImage' + firebaseuser.toString());
    firebase_storage.UploadTask uploadTask =
        storageRef.putFile(File(image!.path).absolute);
    await Future.value(uploadTask);
    final newurl = await storageRef.getDownloadURL();
    var e;
    collection.doc(docSnapshot.id).update({
      'ProfileImage': newurl.toString(),
    }).then((value) {
      Message.custommessage("Profile Updated", context);
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      Message.custommessage(e, context);
    });
  }

  Future<void> showUserNameDialogAlert(
      BuildContext context, String name) async {
    var collection = FirebaseFirestore.instance.collection('userdetail');
    var docSnapshot = await collection.doc(firebaseuser).get();
    namecontroller.text = name;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Update Name'),
            content: SingleChildScrollView(
                child: Column(
              children: [
                InputTextField(
                  controller: namecontroller,
                  hint: 'Enter name',
                  focusNode: namefocusnode,
                  obscuretext: false,
                  keyBoardType: TextInputType.text,
                )
              ],
            )),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  collection
                      .doc(docSnapshot.id)
                      .update({"Name": namecontroller.text.toString()});
                  Navigator.pop(context);
                },
                child:
                    Text('Ok', style: Theme.of(context).textTheme.titleSmall),
              ),
            ],
          );
        });
  }

  Future<void> showUserAgeDialogAlert(BuildContext context, String age) async {
    var collection = FirebaseFirestore.instance.collection('userdetail');
    var docSnapshot = await collection.doc(firebaseuser).get();
    agecontroller.text = age;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Update Age'),
            content: SingleChildScrollView(
                child: Column(
              children: [
                InputTextField(
                  controller: agecontroller,
                  hint: 'Enter Age',
                  focusNode: namefocusnode,
                  obscuretext: false,
                  keyBoardType: TextInputType.text,
                )
              ],
            )),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  collection
                      .doc(docSnapshot.id)
                      .update({"Age": agecontroller.text.toString()});
                  Navigator.pop(context);
                },
                child:
                    Text('Ok', style: Theme.of(context).textTheme.titleSmall),
              ),
            ],
          );
        });
  }

  Future<void> showUserAddressDialogAlert(
      BuildContext context, String address) async {
    var collection = FirebaseFirestore.instance.collection('userdetail');
    var docSnapshot = await collection.doc(firebaseuser).get();
    addresscontroller.text = address;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Update Address'),
            content: SingleChildScrollView(
                child: Column(
              children: [
                InputTextField(
                  controller: addresscontroller,
                  hint: 'Enter Aaddress',
                  focusNode: namefocusnode,
                  obscuretext: false,
                  keyBoardType: TextInputType.text,
                )
              ],
            )),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  collection
                      .doc(docSnapshot.id)
                      .update({"Address": addresscontroller.text.toString()});
                  Navigator.pop(context);
                },
                child:
                    Text('Ok', style: Theme.of(context).textTheme.titleSmall),
              ),
            ],
          );
        });
  }
}
