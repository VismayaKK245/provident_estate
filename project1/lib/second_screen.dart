
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:project1/searchresult.dart';

class GalleryAccess extends StatefulWidget {
  const GalleryAccess({Key? key}) : super(key: key);

  @override
  State<GalleryAccess> createState() => _GalleryAccessState();
}

class _GalleryAccessState extends State<GalleryAccess> {
  XFile? galleryFile;
  Uint8List? webImage;
  final picker = ImagePicker();
  bool isAppBarButtonPressed = false;
  late TextEditingController nameController;
  late TextEditingController placeController;
  bool isDataSaved = false;
  late String savedName;
  late String savedPlace;
  late String savedImageUrl;
  bool showDataContainer = false;
  List<Map<String, String>> savedDataList = [];

  bool _validateForm() {
    return nameController.text.isNotEmpty &&
        placeController.text.isNotEmpty &&
        galleryFile != null;
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    placeController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    placeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            title: Text('My Page'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    isAppBarButtonPressed = true;
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white24,
                ),
                child: Text(
                  'Add Property',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: isAppBarButtonPressed
          ? _buildBodyContainer()
          : (showDataContainer ? _buildSavedDataContainer() : SizedBox()),
    );
  }

  Widget _buildBodyContainer() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: 700,
        height: 500,
        color: Color.fromARGB(255, 176, 226, 245),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter Name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: placeController,
              decoration: InputDecoration(
                hintText: 'Enter Place',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text('Select Image from Gallery and Camera'),
              onPressed: () {
                _showPicker();
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200.0,
              width: 300.0,
              child: _buildImageWidget(),
            ),
            const SizedBox(height: 20),
            if (galleryFile != null)
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: const Text('Save'),
                onPressed: () {
                  if (_validateForm()) {
                    _saveData();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Please fill in all fields and select an image')),
                    );
                  }
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedDataContainer() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: 700,
        height: 500,
        color: Color.fromARGB(255, 176, 226, 245),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Saved Data:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text('Name: $savedName'),
            Text('Place: $savedPlace'),
            Image.network(
            savedImageUrl,
            width: 200, // Adjust the width as needed
            height: 200, // Adjust the height as needed
            fit: BoxFit.cover, // Use BoxFit.cover to ensure the image fits within the constraints
          ),
          const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

Widget _buildImageWidget() {
  if (kIsWeb) {
    return webImage == null
        ? const Center(child: Text('Sorry nothing selected!!'))
        : Image.memory(webImage!);
  } else {
    return galleryFile == null
        ? const Center(child: Text('Sorry nothing selected!!'))
        : FutureBuilder<Uint8List>(
            future: galleryFile!.readAsBytes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error loading image'));
              } else {
                return Image.memory(snapshot.data!);
              }
            },
          );
  }
}


  void _showPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> getImage(ImageSource img) async {
    final pickedFile = await picker.pickImage(source: img);
    setState(() {
      if (pickedFile != null) {
        galleryFile = pickedFile;
        if (kIsWeb) {
          galleryFile!.readAsBytes().then((bytes) {
            webImage = Uint8List.fromList(bytes);
            setState(() {});
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nothing is selected')),
        );
      }
    });
  }


   void _saveData() async {
    final uri = Uri.parse('http://localhost:4001/upload');
    final request = http.MultipartRequest('POST', uri);

    request.fields['name'] = nameController.text;
    request.fields['place'] = placeController.text;

    if (galleryFile != null) {
      if (kIsWeb) {
        var multipartFile = http.MultipartFile.fromBytes(
          'image',
          webImage!,
          filename: galleryFile!.name,
        );
        request.files.add(multipartFile);
      } else {
        var multipartFile = await http.MultipartFile.fromPath(
          'image',
          galleryFile!.path,
        );
        request.files.add(multipartFile);
      }
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);

      setState(() {
        savedName = jsonResponse['data']['name'];
        savedPlace = jsonResponse['data']['place'];
        savedImageUrl = jsonResponse['data']['imageUrl'];
        showDataContainer = true;
        isAppBarButtonPressed = false;
      });

      savedDataList.add({
        'name': savedName,
        'place': savedPlace,
        'imageUrl': savedImageUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data saved successfully!')),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SavedDataPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to save data.')),
      );
    }
  }
}