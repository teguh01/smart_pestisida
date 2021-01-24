import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_pestisida/Login/auth_services.dart';

class MainPage extends StatelessWidget {

  static FirebaseAuth _auth = FirebaseAuth.instance;

  //String uid = "user.uid";

  void getCurrentUser() async {
    final FirebaseUser user = await _auth.currentUser();
    String uid = user.uid;
    // Similarly we can get email as well
    final uemail = user.email;
    print(uid);
    print(uemail);
  }

  final FirebaseUser user;
  MainPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page"),),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(user.uid),
            
            RaisedButton(
              child: Text("Sign Out"),
              onPressed: () async{
                await AuthServices.signOut();
              },
            ),

            RaisedButton(
              onPressed: () async{
                getCurrentUser();
              },
            ),

          ],
        ),
      ),
    );
  }
}