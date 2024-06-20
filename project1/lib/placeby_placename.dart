import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlaceDetailsPage extends StatefulWidget {
  final String placeName;

  const PlaceDetailsPage({Key? key, required this.placeName}) : super(key: key);

  @override
  _PlaceDetailsPageState createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  List<Map<String, dynamic>> matchingData = [];

  @override
  void initState() {
    super.initState();
    fetchMatchingData();
  }

  Future<void> fetchMatchingData() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:4001/matching-data?placeName=${widget.placeName}'));

      if (response.statusCode == 200) {
        setState(() {
          matchingData = List<Map<String, dynamic>>.from(json.decode(response.body));
        });
      } else {
        throw Exception('Failed to fetch matching data');
      }
    } catch (error) {
      print('Error fetching matching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Details of ${widget.placeName}'),
            SizedBox(height: 20),
            if (matchingData.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: matchingData.length,
                  itemBuilder: (context, index) {
                    final data = matchingData[index];
                    return ListTile(
                      leading: data['imageUrl'] != null
                          ? Image.network(data['imageUrl'], width: 50, height: 50, fit: BoxFit.cover)
                          : null,
                      title: Text(data['name']),
                      subtitle: Text(data['place']),
                      // You can display more details here as needed
                    );
                  },
                ),
              )
            else
              Text('No data found for ${widget.placeName}'),
          ],
        ),
      ),
    );
  }
}
