import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

void main(){
  runApp(MaterialApp(home: UploadProfilePhoto(),));
}

class UploadProfilePhoto extends StatefulWidget {
  const UploadProfilePhoto({super.key});

  @override
  State<UploadProfilePhoto> createState() => _UploadProfilePhotoState();
}

class _UploadProfilePhotoState extends State<UploadProfilePhoto> {
  File? _image;
  final picker = ImagePicker();
  final String userId = '6890b56b11d9031429f169e1'; // 🔁 Replace with your actual user ID
  late String serverUrl = 'http://10.120.15.203:5398/user/profile/$userId/photo'; // ✅ Update with your IP if needed
  var image_url = "";

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> uploadImage() async {
    if (_image == null) {
      print('No image selected');
      return;
    }

    try {
      var request = http.MultipartRequest('PUT', Uri.parse(serverUrl));

      // 🟢 This is the key expected by Multer: profile_photo
      request.files.add(await http.MultipartFile.fromPath(
        'profile_photo',
        _image!.path,
      ));

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        print("Json Response : $jsonResponse :::::::::::::");
        setState(() {
          image_url = jsonResponse["user"]["profile_photo"];
        });
        print('✅ Success: ${jsonResponse["message"]}');
      } else {
        print('❌ Failed: ${response.statusCode}');
      }
    } catch (e) {
      print('⚠️ Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Profile Photo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(_image!, width: 150, height: 150, fit: BoxFit.cover)
                : const Text("No image selected"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickImage,
              child: const Text("Pick Image"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: uploadImage,
              child: const Text("Upload Image"),
            ),

            image_url.isNotEmpty
                ? Image.network(image_url, width: 150, height: 150)
                : Container(),
          ],
        ),
      ),
    );
  }
}
