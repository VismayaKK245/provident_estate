
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class SavedDataPage extends StatefulWidget {
//   @override
//   _SavedDataPageState createState() => _SavedDataPageState();
// }

// class _SavedDataPageState extends State<SavedDataPage> {
//   List<DataModel> savedDataList = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse('http://localhost:4001/data'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       setState(() {
//         savedDataList = data.map((json) => DataModel.fromJson(json)).toList();
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Saved Data'),
//       ),
//       body: ListView.builder(
//         itemCount: savedDataList.length,
//         itemBuilder: (context, index) {
//           final data = savedDataList[index];
//           return ListTile(
//             title: Text('Name: ${data.name}'),
//             subtitle: Text('Place: ${data.place}'),
//             leading: Image.network(
//               data.imageUrl,
//               width: 50,
//               height: 50,
//               fit: BoxFit.cover,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class DataModel {
//   final String id;
//   final String name;
//   final String place;
//   final String imageUrl;

//   DataModel({
//     required this.id,
//     required this.name,
//     required this.place,
//     required this.imageUrl,
//   });

//   factory DataModel.fromJson(Map<String, dynamic> json) {
//     return DataModel(
//       id: json['_id'] as String,
//       name: json['name'] as String,
//       place: json['place'] as String,
//       imageUrl: json['imageUrl'] as String,
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SavedDataPage extends StatefulWidget {
  @override
  _SavedDataPageState createState() => _SavedDataPageState();
}

class _SavedDataPageState extends State<SavedDataPage> {
  List<DataModel> savedDataList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:4001/data'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        savedDataList = data.map((json) => DataModel.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Data'),
      ),
      body: ListView.builder(
        itemCount: savedDataList.length,
        itemBuilder: (context, index) {
          final data = savedDataList[index];
          return ListTile(
            title: Text('Name: ${data.name}'),
            subtitle: Text('Place: ${data.place}'),
            leading: Image.network(
              data.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

class DataModel {
  final String id;
  final String name;
  final String place;
  final String imageUrl;

  DataModel({
    required this.id,
    required this.name,
    required this.place,
    required this.imageUrl,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      place: json['place'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
}