import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProfileImage extends StatefulWidget {
  const AddProfileImage({super.key});

  @override
  State<AddProfileImage> createState() => _AddProfileImageState();
}

class _AddProfileImageState extends State<AddProfileImage> {
  File? image;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image == null) {
      return;
    }

    final pickedImage = File(image.path);
    setState(
      () {
        this.image = pickedImage;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: pickImage,
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              border: Border.all(width: 4, color: Colors.pink.shade300),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
              shape: BoxShape.circle,
            ),
            child: image != null
                ? ClipOval(
                    child: Image.file(
                      image!,
                      height: 160,
                      width: 160,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Center(
                    child: Text(
                      'Select an Image',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
          ),
        ),
        Positioned(
          bottom: 8,
          right: 3,
          top: 100,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: Colors.white,
              ),
            ),
            child: const Icon(
              Icons.image_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
