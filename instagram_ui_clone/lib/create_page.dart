import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreatePage extends StatefulWidget {
  final User user;
  CreatePage(this.user);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _image;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              _uploadPost(context);
              /*
              final firebaseStorageRef = FirebaseStorage.instance
                  .ref()
                  .child('post')
                  .child('${DateTime.now().millisecondsSinceEpoch}.png');

              final task = firebaseStorageRef.putFile(
                  _image!, SettableMetadata(contentType: 'image/png'));

              task.then((value) {
                var downloadUrl = value.ref.getDownloadURL();
                downloadUrl.then((uri) {
                  var doc = FirebaseFirestore.instance.collection('post').doc();
                  doc.set({
                    'id': doc.id,
                    'photoUrl': uri.toString(),
                    'contents': textEditingController.text,
                    'email': widget.user.email,
                    'displayName': widget.user.displayName,
                    'userPhotoUrl': widget.user.photoURL,
                  }).then((onValue) {
                    Navigator.pop(context);
                  });
                });
              });
              */
            })
      ],
      backgroundColor: Colors.white,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _postImage(),
          TextField(
            decoration: const InputDecoration(hintText: 'Enter your text'),
            controller: textEditingController,
          )
        ],
      ),
    );
  }

  Widget _postImage() {
    return _image == null ? const Text('No Image') : Image.file(_image!);
  }

  Future _getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    } else {
      //사진 미 선택 처리
    }
  }

  Future<void> _uploadPost(BuildContext context) async {
    final firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('post')
        .child('${DateTime.now().millisecondsSinceEpoch}.png');

    final task = await firebaseStorageRef.putFile(
        _image!, SettableMetadata(contentType: 'image/png'));

    final uri = await task.ref.getDownloadURL();

    final doc = FirebaseFirestore.instance.collection('post').doc();

    await doc.set({
      'id': doc.id,
      'photoUrl': uri.toString(),
      'contents': textEditingController.text,
      'email': widget.user.email,
      'displayName': widget.user.displayName,
      'userPhotoUrl': widget.user.photoURL,
    });

    Navigator.pop(context);
  }
}
