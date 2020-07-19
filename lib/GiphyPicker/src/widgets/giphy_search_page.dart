import 'package:chatapp/GiphyPicker/src/widgets/giphy_search_view.dart';
import 'package:chatapp/const.dart';
import 'package:flutter/material.dart';

class GiphySearchPage extends StatelessWidget {
  final Widget title;

  const GiphySearchPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ChatTheme,
        child: Scaffold(
            appBar: AppBar(title: Image.asset('assets/giphy.png')),
            body: SafeArea(child: GiphySearchView(), bottom: false)));
  }
}
