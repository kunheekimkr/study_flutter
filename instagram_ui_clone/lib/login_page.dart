import 'package:flutter/material.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Instagram Clone',
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(50.0),
          ),
          SignInButton(Buttons.GoogleDark, onPressed: () {
            _handleSignIn();
          }),
        ],
      )),
    );
  }

  Future<UserCredential> _handleSignIn() async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = (await googleUser?.authentication)!;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
