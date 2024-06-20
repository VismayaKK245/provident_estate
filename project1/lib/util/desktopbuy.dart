// import 'package:flutter/material.dart';

// class desktopBuy extends StatefulWidget {
//   const desktopBuy({required Key key}) : super(key: key);

//   @override
//   State<desktopBuy> createState() => _desktopBuyState();
// }

// class _desktopBuyState extends State<desktopBuy> {
//   bool _isPopupVisible = false;
//   IconData iconData = Icons.keyboard_arrow_down;

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return  Container(
//                               decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 255, 255, 255),
//                                 borderRadius: BorderRadius.circular(5),
//                                 border: Border.all(
//                                   color: Colors.black38,
//                                 ),
//                               ),
//                               width: screenWidth > 800
//                                   ? MediaQuery.of(context).size.width * 0.55
//                                   : MediaQuery.of(context).size.width * 0.45,
//                               height: MediaQuery.of(context).size.height *
//                                   0.07, // Adjusted height
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 8),
//                                     child: Row(
//                                       children: [
//                                         GestureDetector(
//                                           onTap: () {
//                                             setState(() {
//                                               _isPopupVisible =
//                                                   !_isPopupVisible;
//                                               iconData = _isPopupVisible
//                                                   ? Icons.keyboard_arrow_up
//                                                   : Icons.keyboard_arrow_down;
//                                             });
//                                           },
//                                           child: Text("Buy"),
//                                         ),
//                                         IconButton(
//                                           icon: Icon(iconData),
//                                           onPressed: () {
//                                             setState(() {
//                                               _isPopupVisible =
//                                                   !_isPopupVisible;
//                                               iconData = _isPopupVisible
//                                                   ? Icons.keyboard_arrow_up
//                                                   : Icons.keyboard_arrow_down;
//                                             });
//                                           },
//                                           color:
//                                               Color.fromARGB(255, 212, 204, 204),
//                                           iconSize: 30,
//                                         ),
//                                       ],
//                                     ),
//                               )]));

//   }
// }
