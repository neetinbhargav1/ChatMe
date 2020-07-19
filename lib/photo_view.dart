import 'package:chatapp/open_settings.dart';
import 'package:chatapp/utils.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:chatapp/save.dart';
import 'package:permission_handler/permission_handler.dart';

class PhotoViewWrapper extends StatelessWidget {
  const PhotoViewWrapper(
      {this.imageProvider,
      this.loadingChild,
      this.backgroundDecoration,
      this.minScale,
      this.maxScale,
      @required this.tag});

  final String tag;
  final ImageProvider imageProvider;
  final Widget loadingChild;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return Chat.getNTPWrappedWidget(Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Chat.checkAndRequestPermission(PermissionGroup.storage)
                .then((res) {
              if (res) {
                Save.saveToDisk(imageProvider, tag);
                Chat.toast('Saved!');
              } else {
                Chat.showRationale(
                    'Permission to access storage needed to save photos to your phone.');
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => OpenSettings()));
              }
            });
          },
          child: Icon(Icons.file_download),
        ),
        body: Container(
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height,
            ),
            child: PhotoView(
              imageProvider: imageProvider,
              loadingChild: loadingChild,
              backgroundDecoration: backgroundDecoration,
              minScale: minScale,
              maxScale: maxScale,
              heroTag: tag,
            ))));
  }
}
