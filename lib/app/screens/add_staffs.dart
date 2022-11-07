import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/gradient_button.dart';
import '../widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

class AddStaffs extends StatefulWidget {
  const AddStaffs({super.key});

  @override
  State<AddStaffs> createState() => _AddStaffsState();
}

class _AddStaffsState extends State<AddStaffs> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _departments = [
    'HR',
    'Finance',
    'Housekeeping',
    'Marketing',
  ];

  String? _staffDepartment;
  File? _selectedImage;

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
        _selectedImage = pickedImage;
      },
    );
  }

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      if (_staffDepartment == null) {
        var snackBar = const SnackBar(
          content: Text('Department not selected!'),
          padding: EdgeInsets.all(20),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      } else if (_selectedImage == null) {
        var snackBar = const SnackBar(
          content: Text('Image not selected!'),
          padding: EdgeInsets.all(20),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      } else {
        /// TODO: Need to save data on firebase.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Staff Manager',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.pink.shade400,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'HELLO THERE!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "Put your details Here!",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Stack(
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
                    child: _selectedImage != null
                        ? ClipOval(
                            child: Image.file(
                              _selectedImage!,
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
            ),
          ),
          const SizedBox(height: 30),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Enter Your Name.',
                  keyboardType: TextInputType.name,
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'This field is Required!';
                    } else if (name.length < 4) {
                      return 'Name should be 4 character long!';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _ageController,
                  hintText: 'Enter Your Age.',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 2) {
                      return 'This field is Required!';
                    } else if (value.length > 2) {
                      return 'Enter your real age!';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _phoneNumberController,
                  hintText: 'Enter Your Phone Number.',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 10) {
                      return 'This field is Required!';
                    } else if (value.length > 10) {
                      return 'Phone number must have 10 digits!';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: const Text('Select Department'),
                      focusColor: Colors.blue,
                      enableFeedback: true,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 25,
                      elevation: 0,
                      isExpanded: true,
                      dropdownColor: Colors.white.withOpacity(.9),
                      items: _departments.map(
                        (String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(
                          () {
                            _staffDepartment = value;
                          },
                        );
                      },
                      value: _staffDepartment,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  child: GradientButton(
                    buttonText: 'Submit',
                    onPressed: onSubmit,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
