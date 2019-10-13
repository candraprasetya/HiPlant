import 'package:flutter/cupertino.dart';
import 'pages/home_page.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

void main() => runApp(HiPlant());

class HiPlant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'HiPlant';

    return CupertinoApp(
      title: appName,
      home: MyHome(),
      theme: CupertinoThemeData(

          //primaryColor: Color(0xFF29D990),
          primaryColor: Color(0xFF0CC6B7)),
    );
  }
}
