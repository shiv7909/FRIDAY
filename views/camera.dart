import 'dart:typed_data';

import 'package:FRIDAY/controllers/controller_api.dart';
import 'package:FRIDAY/controllers/picimagecontroller.dart';
import 'package:FRIDAY/views/Home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraCaptureScreen extends StatefulWidget {
  const CameraCaptureScreen({super.key});

  @override
  _CameraCaptureScreenState createState() => _CameraCaptureScreenState();
}

class _CameraCaptureScreenState extends State<CameraCaptureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  ImagePic APi=Get.put(ImagePic());

  @override
  void initState() {
    super.initState();
    // Call the _initializeCamera() method in the initState() method
    _initializeCamera();
  }

  void _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final firstCamera = cameras.first;
      _controller = CameraController(firstCamera, ResolutionPreset.max);
      _initializeControllerFuture = _controller.initialize();
      // Set state after initializing
      setState(() {});
    } catch (e) {
      // Handle initialization error
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    // Dispose of the camera controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        // Wait until the controller is initialized
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the camera preview
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // Ensure the camera is initialized before attempting to take a picture
            await _initializeControllerFuture;
            // Capture the image
            final image = await _controller.takePicture();
            // Do something with the captured image (e.g., upload it to an API)
            // For simplicity, we'll just display the image file path

            final Uint8List imageBytes = await image.readAsBytes();

            APi.path?.value=image.path;
            APi.cameraImagebytes=imageBytes;

            setState(() {
            });

            // Close the camera screen and pass the captured image path back to the previous screen
            Get.back();
          } catch (e) {
            // If an error occurs, log the error message
            print('Error taking picture: $e');
          }
        },
        child: const Icon(Icons.camera),
      ),
    );
  }

}
