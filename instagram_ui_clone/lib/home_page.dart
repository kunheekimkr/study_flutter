import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  User user;
  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instagram Clone',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Instargram에 오신 것을 환영합니다',
                style: TextStyle(fontSize: 24.0),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Text(
                '사진과 동영상을 보려면 팔로우하세요',
              ),
              Padding(padding: EdgeInsets.all(16.0)),
              SizedBox(
                width: 260.0,
                child: Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Padding(padding: EdgeInsets.all(1.0)),
                      SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(user.photoURL!),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8.0)),
                      Text(
                        user.email!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(user.displayName!),
                      Padding(padding: EdgeInsets.all(8.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: Image.network(
                                'https://picsum.photos/200/300?image=11',
                                fit: BoxFit.cover),
                          ),
                          Padding(padding: EdgeInsets.all(1.0)),
                          SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: Image.network(
                                'https://picsum.photos/200/300?image=31',
                                fit: BoxFit.cover),
                          ),
                          Padding(padding: EdgeInsets.all(1.0)),
                          SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: Image.network(
                                'https://picsum.photos/200/300?image=19',
                                fit: BoxFit.cover),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(4.0)),
                      Text('Facebook 친구'),
                      Padding(padding: EdgeInsets.all(4.0)),
                      ElevatedButton(
                        child: const Text("팔로우"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white, // text color
                        ),
                        onPressed: () {},
                      ),
                      Padding(padding: EdgeInsets.all(4.0)),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
