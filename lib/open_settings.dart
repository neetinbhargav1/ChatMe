import 'package:chatapp/const.dart';
import 'package:chatapp/utils.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class OpenSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Chat.getNTPWrappedWidget(Material(
        color: Black,
        child: Center(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: RaisedButton(
                    color: Colors.blue,
                    textColor: White,
                    onPressed: () {
                      PermissionHandler().openAppSettings();
                    },
                    child: Text('Open App Settings'))))));
  }
}
