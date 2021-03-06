import 'dart:core';
import 'package:chatapp/utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chatapp/const.dart';
import 'package:chatapp/chat.dart';
import 'package:chatapp/DataModel.dart';

class PreChat extends StatefulWidget {
  final String name, phone, currentUserNo;
  final DataModel model;
  const PreChat(
      {@required this.name,
      @required this.phone,
      @required this.currentUserNo,
      @required this.model});

  @override
  _PreChatState createState() => _PreChatState();
}

class _PreChatState extends State<PreChat> {
  bool isLoading, isUser = false;

  @override
  initState() {
    super.initState();
    getUser();
    isLoading = true;
  }

  getUser() {
    Firestore.instance
        .collection(USERS)
        .document(widget.phone)
        .get()
        .then((user) {
      setState(() {
        isLoading = false;
        isUser = user.exists;
        if (isUser) {
          var peer = user;
          widget.model.addUser(user);
          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (context) => new ChatScreen(
                      unread: 0,
                      currentUserNo: widget.currentUserNo,
                      model: widget.model,
                      peerNo: peer[PHONE])));
        }
      });
    });
  }

  Widget buildLoading() {
    return Positioned(
      child: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Blue)),
              ),
              color: Black.withOpacity(0.8),
            )
          : Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chat.getNTPWrappedWidget(Scaffold(
      appBar: AppBar(backgroundColor: Black, title: Text(widget.name)),
      body: Stack(children: <Widget>[
        Container(
            child: Center(
          child: !isUser
              ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(widget.name + " is not on ChatMe!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: White,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0)),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    color: Blue,
                    textColor: White,
                    child: Text('Invite ${widget.name}'),
                    onPressed: () {
                      Chat.invite();
                    },
                  )
                ])
              : Container(),
        )),
        // Loading
        buildLoading()
      ]),
      backgroundColor: Black,
    ));
  }
}
