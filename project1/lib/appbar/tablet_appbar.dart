import 'package:flutter/material.dart';

AppBar buildTabletAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Added this line
      children: [
        Text(
          'ABED REALTORS',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 23.0,
            color: Color.fromARGB(255, 0, 0, 7),
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 170,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Color.fromARGB(255, 255, 253, 253),
          ),
          child: Center(
            child: Text(
              "List Your Property",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ),
        IconButton(
          icon: Image.asset(
            'assets/assets/whatsapp.png',
            width: 33.0,
            height: 33.0,
          ),
          onPressed: () {
            // Add your onPressed function here
          },
        ),
      ],
    ),
    actions: [
      IconButton(
        icon: Icon(
          Icons.call_outlined,
          size: 30.0,
          color: Color.fromARGB(255, 0, 9, 0),
        ),
        onPressed: () {
          // Add your onPressed function here
        },
      ),
      IconButton(
        icon: Icon(
          Icons.search,
          size: 30.0,
          color: Color.fromARGB(255, 0, 10, 0),
        ),
        onPressed: () {
          // Add your onPressed function here
        },
      ),
      IconButton(
        icon: Icon(
          Icons.menu,
          size: 30.0,
          color: Color.fromARGB(255, 0, 10, 0),
        ),
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));
        },
      ),
    ],
  );
}
