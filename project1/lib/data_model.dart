// lib/data_model.dart
class Data {
  final String name;
  final String place;
  final String imageUrl;

  Data({required this.name, required this.place, required this.imageUrl});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json['name'],
      place: json['place'],
      imageUrl: json['imageUrl'],
    );
  }
}
