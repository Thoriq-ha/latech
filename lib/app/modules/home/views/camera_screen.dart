import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  late List<CameraDescription> cameras;
  CameraController? cameraController;

  late File imageTaken;

  bool isImageTaken = false;



  @override
  void initState() {
    // TODO: implement initState
    startCamera();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cameraController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController?.value.isInitialized ?? true ) {
      return cameraPreview();
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  
  void startCamera() async{
    cameras  = await availableCameras();

    cameraController = CameraController(cameras[0], ResolutionPreset.high, enableAudio: false);

    await cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e){
      print(e.code);
    });
  }
  
  Widget cameraPreview() {
    return Stack(
      children: [
        (cameraController != null) 
        ? CameraPreview(cameraController!)
        : Container(),
        button(Icons.camera)
      ],
    );
  }
  
  Widget button(IconData iconData) {
    return GestureDetector(
      onTap: () {
        cameraController?.takePicture().then((XFile? file) {
          if (mounted) {
            if (file != null) {
              print("file saved at ${file.path}");
              imageTaken = File(file.path);
              
            }
          }
        });
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FittedBox(
          child: Container(
            margin: const EdgeInsets.only(bottom: 32),
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(2, 2),
                  blurRadius: 10,
                )
              ]      
            ),
            child: Icon(iconData, size: 48,)
          ),
        ),
      ),
    );
  }


}

