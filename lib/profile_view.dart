import 'package:chatapp/const.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/utils.dart';

class ProfileView extends StatelessWidget {
  final Map<String, dynamic> user;
  ProfileView(this.user);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    String name = Chat.getNickname(user), about = user[ABOUT_ME] ?? '';
    return Chat.getNTPWrappedWidget(Scaffold(
        backgroundColor: Black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Black,
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: _height / 8,
            ),
            Chat.avatar(user, radius: 100.0),
            Padding(
              child: new Text(
                name,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _width / 10,
                    color: Colors.white),
              ),
              padding: EdgeInsets.only(top: 20),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 10),
              child: new Text(
                about.isEmpty ? 'This user is quite secretive!' : about,
                style: new TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: _width / 25,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ))));
  }
}
