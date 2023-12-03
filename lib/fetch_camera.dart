import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.title});
  final String title;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? fileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: fileImage == null
            ? const SizedBox()
            : Image(image: FileImage(File(fileImage!.path))),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: openGallary,
            tooltip: 'gallary',
            heroTag: 'a',
            child: const Icon(Icons.image),
          ),
          FloatingActionButton(
            onPressed: openCamera,
            tooltip: 'camera',
            heroTag: 'b',
            child: const Icon(Icons.camera_alt_sharp),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  //== test ====

  void openCamera() async {
    var pickImage = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      fileImage = File(pickImage!.path);
    });
  }

  void openGallary() async {
    var pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      fileImage = File(pickImage!.path);
    });
  }
}
