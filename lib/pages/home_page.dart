import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'scanner_page.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  File _image;

  Future openCamera() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = picture;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height;

    return CupertinoPageScaffold(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: Text(
                    'HiPlant',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Container(
                width: sWidth,
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Your Plant. ',
                      style: TextStyle(
                          color: CupertinoColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    Text(
                      'BAYAM',
                      style: TextStyle(
                          color: Color(0xFF0CC6B7),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: CupertinoColors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: _image == null
                        ? NetworkImage(
                            'https://www.elegantthemes.com/blog/wp-content/uploads/2016/03/500-internal-server-error-featured-image-1.png')
                        : FileImage(_image),
                  ),
                ),
                width: sWidth,
                height: sHeight,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    width: sWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF29D990),
                              Color(0xFF0CC6B7),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight)),
                    child: CupertinoButton(
                      onPressed: openCamera,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.fullscreen,
                            color: CupertinoColors.white,
                          ),
                          Text(
                            'Scan',
                            style: TextStyle(color: CupertinoColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: sWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: CupertinoButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ScannerPage()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Get Result',
                            style:
                                TextStyle(color: CupertinoColors.activeGreen),
                          ),
                          Icon(
                            CupertinoIcons.info,
                            color: CupertinoColors.activeGreen,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
