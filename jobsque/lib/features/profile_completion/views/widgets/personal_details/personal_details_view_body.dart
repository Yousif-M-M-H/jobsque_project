import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/profile_completion/views/widgets/personal_details/personal_details_text_field.dart';

class PersonalDetailsViewBody extends StatefulWidget {
  final int index;

  const PersonalDetailsViewBody({Key? key, required this.index})
      : super(key: key);

  @override
  _PersonalDetailsViewBodyState createState() =>
      _PersonalDetailsViewBodyState();
}

class _PersonalDetailsViewBodyState extends State<PersonalDetailsViewBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  XFile? image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          image = pickedImage;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  void navigateBackAndUpdate() {
    try {
      Map<String, String> personalDetails = {
        'name': nameController.text,
        'bio': bioController.text,
        'address': addressController.text,
        'phone': phoneController.text,
        'imagePath': image?.path ?? '',
      };
      Navigator.pop(context, personalDetails);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save personal details: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          image != null ? FileImage(File(image!.path)) : null,
                      child:
                          image == null ? const Icon(Icons.add_a_photo) : null,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text("Change Photo",
                      style: AppStyles.mediumFont16
                          .copyWith(color: const Color(0xFF3366FF))),
                  PersonalDetailTextField(
                    controller: nameController,
                    title: "Name",
                    hintText: "Rafif dian",
                  ),
                  const SizedBox(height: 16),
                  PersonalDetailTextField(
                    controller: bioController,
                    title: "Bio",
                    hintText: "Senior UI/UX designer",
                  ),
                  const SizedBox(height: 16),
                  PersonalDetailTextField(
                    controller: addressController,
                    title: "Address",
                    hintText: "Ranjingan, Wangon, Washington City",
                  ),
                  const SizedBox(height: 16),
                  PersonalDetailTextField(
                    controller: phoneController,
                    title: "Phone",
                    hintText: "0100-666-7234",
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ElevatedButton(
              onPressed: navigateBackAndUpdate,
              child: const Text("save this"),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
