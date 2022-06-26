import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountPage extends StatefulWidget {
  final User user;
  AccountPage(this.user);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  int _postCount = 0;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('post')
        .where('email', isEqualTo: widget.user.email)
        .get()
        .then((snapshot) {
      setState(() {
        _postCount = snapshot.docs.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            _googleSignIn.signOut();
          },
          color: Colors.black,
        )
      ],
      backgroundColor: Colors.white,
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                      width: 80.0,
                      height: 80.0,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(widget.user.photoURL!),
                      )),
                  Container(
                      width: 80.0,
                      height: 80.0,
                      alignment: Alignment.bottomRight,
                      child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            SizedBox(
                              width: 28.0,
                              height: 28.0,
                              child: FloatingActionButton(
                                onPressed: null,
                                backgroundColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: FloatingActionButton(
                                onPressed: null,
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.add),
                              ),
                            )
                          ]))
                ],
              ),
              const Padding(padding: EdgeInsets.all(8.0)),
              Text(
                widget.user.displayName!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              )
            ],
          ),
          Text(
            '$_postCount\nPosts',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18.0),
          ),
          Text(
            '0\nFollowers',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18.0),
          ),
          Text(
            '0\nFollowing',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
