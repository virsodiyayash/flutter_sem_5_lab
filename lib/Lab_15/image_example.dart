import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(MaterialApp(home: ProfilePhotoUploader(),));
}

class ProfilePhotoUploader extends StatefulWidget {
  const ProfilePhotoUploader({Key? key}) : super(key: key);

  @override
  State<ProfilePhotoUploader> createState() => _ProfilePhotoUploaderState();
}

class _ProfilePhotoUploaderState extends State<ProfilePhotoUploader> {
  File? _imageFile;
  String? uploadedImageUrl;

  final String userId = '688b62ce5c89d345fbd345c5';
  final String serverUrl = 'http://10.26.60.41:5398';

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _imageFile = File(picked.path));
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) return;

    final uri = Uri.parse('$serverUrl/profile/$userId');
    final request = http.MultipartRequest('PUT', uri);

    request.files.add(await http.MultipartFile.fromPath('profile_photo', _imageFile!.path));

    // You can send other fields along with the image
    // request.fields['name'] = 'Yash Updated';
    // request.fields['location'] = 'Gujarat';

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final json = jsonDecode(responseBody);
      setState(() {
        uploadedImageUrl = json['profile_photo'];
      });
    } else {
      print('Upload failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Profile Photo"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text("Pick Image"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: const Text("Upload to Server"),
            ),
            const SizedBox(height: 30),
            if (uploadedImageUrl != null)
              Column(
                children: [
                  const Text("Uploaded Profile Photo:"),
                  const SizedBox(height: 10),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(uploadedImageUrl!),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
