


import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ImagePic extends GetxController {

RxString? path=''.obs;
Uint8List? cameraImagebytes;// Declare 'image' as a variable of type 'PickedFile?'

  Future<Uint8List?> getImage() async {
    final ImagePicker imagePicker = ImagePicker();
    // Use 'imagePicker.pickImage' to pick an image
    final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage!=null) {
      path!.value=pickedImage.path;
      print(path);
      final Uint8List imageBytes = await pickedImage.readAsBytes();
      return imageBytes;
    }
    else {
      return null;
    }
  }

  // Future<String?> getImagepath() async {
  //   final ImagePicker imagePicker = ImagePicker();
  //   // Use 'imagePicker.pickImage' to pick an image
  //   final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery) ;
  //
  //   if (pickedImage!=null) {
  //
  //     return pickedImage.path;
  //   }
  //   else {
  //     return null;
  //   }
  // }




}
