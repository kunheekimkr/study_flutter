import 'package:flutter/material.dart';

import 'package:instagram_ui_clone/tab_page.dart';
import 'package:instagram_ui_clone/login_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return TabPage(snapshot.data!);
          } else {
            return LoginPage();
          }
        });
  }
}
