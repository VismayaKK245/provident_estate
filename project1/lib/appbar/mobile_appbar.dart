import 'package:flutter/material.dart';

AppBar myAppBar(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double iconSize = 30.0;
    double textSize = 15.0;

 if (screenWidth < 275) {
  iconSize = 5.0;
  textSize = 5.0;
} else if (screenWidth < 400) {
  iconSize = 20.0;
  textSize = 10.0;
}


    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Text(
            'ABED REALTORS',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: textSize,
              color: Color.fromARGB(255, 0, 0, 7),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Image.asset(
            'assets/assets/whatsapp.png',
            width: iconSize,
            height: iconSize,
          ),
          onPressed: () {
            // Handle WhatsApp onPressed
          },
        ),
        IconButton(
          icon: Icon(
            Icons.call_outlined,
            size: iconSize,
            color: Color.fromARGB(255, 0, 9, 0),
          ),
          onPressed: () {
            // Handle Call onPressed
          },
        ),
        IconButton(
          icon: Icon(
            Icons.search,
            size: iconSize,
            color: Color.fromARGB(255, 0, 10, 0),
          ),
          onPressed: () {
            // Handle Search onPressed
          },
        ),
        IconButton(
          icon: Icon(
            Icons.menu,
            size: iconSize,
            color: Color.fromARGB(255, 0, 10, 0),
          ),
          onPressed: () {
            // Handle Menu onPressed
          },
        ),
      ],
    );
  }
