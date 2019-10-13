import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class ScannerPage extends StatefulWidget {
  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  CameraController cameraController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> openCamera() async{
    var picture = await ImagePicker.pickImage(
    source: ImageSource.camera,
);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
          child: Center(
            child: Container(
        child: GestureDetector(
            child: Text('Scan Now'),
            onTap: openCamera,
        ),
      ),
          ),
    );
  }
}
