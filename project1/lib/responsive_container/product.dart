import 'package:flutter/material.dart';

class Product {
  final String title;
  final String text;
  final int id;
  final Color color;
  final IconData iconData; // Add this field for the icon

  Product({
    required this.id,
    required this.color,
    required this.title,
    required this.text,
    required this.iconData, // Initialize iconData in the constructor
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Find an Agent",
    text: "We’ve got a team of over 180 agents here to help",
    color: Color.fromARGB(255, 233, 242, 249),
    iconData: Icons.search, // Specify icon data for the product
  ),
  Product(
    id: 2,
     color: Color.fromARGB(255, 233, 242, 249),
    title: 'List your property',
    text: "Sell or Rent your property with the best prices.",
    iconData: Icons.home,
  ),
  Product(
    id: 3,
  color: Color.fromARGB(255, 233, 242, 249),
    title: 'Download Report',
    text: "Download 2023 Full Dubai Real Estate Sales & Trend Report.",
    iconData: Icons.file_download,
  ),
  Product(
    id: 4,
       color: Color.fromARGB(255, 233, 242, 249),
    title: 'Projects',
    text: "Discover the perfect home for you in Dubai.",
    iconData: Icons.folder,
  ),
];
