import 'package:flutter/material.dart';

class DetailPostPage extends StatelessWidget {
  final dynamic document;

  DetailPostPage(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Browse',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                      backgroundImage: NetworkImage(document['userPhotoUrl'])),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(document['email'],
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Text(document['displayName']),
                      ],
                    ),
                  )
                ],
              )),
          Hero(
              tag: document['photoUrl'],
              child: Image.network(document['photoUrl'])),
          Text(
            document['contents'],
            style: const TextStyle(fontSize: 20.0),
          ),
        ],
      )),
    );
  }
}
