import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  const MyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: 300, // Set the desired width here
        height: 100, // Set the desired height here
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
