import 'package:flutter/material.dart';
import '../../services/authservice.dart';

class CustomDrawer {
  static drawer(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffEDEDFF),
      width: MediaQuery.of(context).size.width * 0.85,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          ListTile(
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 36,
                fontFamily: 'Mukta',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ListTile(
            leading: Icon(
              Icons.person_rounded,
              size: 30,
              color: Colors.black,
            ),
            title: Text(
              'Account',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mukta'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            title: Text(
              'Edit Profile',
              style: TextStyle(
                  fontFamily: 'Mukta',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios_rounded),
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text(
              'Change Password',
              style: TextStyle(
                fontFamily: 'Mukta',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: IconButton(
              onPressed: () => Navigator.pushNamed(context, "/ForgotPass"),
              icon: Icon(Icons.arrow_forward_ios_rounded),
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text(
              'Membership',
              style: TextStyle(
                  fontFamily: 'Mukta',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios_rounded),
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: Icon(
              Icons.add_box_outlined,
              size: 30,
              color: Colors.black,
            ),
            title: Text(
              'More',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mukta'),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.2),
            child: InkWell(
              onTap: () async {
                await AuthServices.signout(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffEDEDFF),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.logout_rounded,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      fontFamily: 'Mukta',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
