 import 'package:flutter/material.dart';

class FindOutMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/assets/more.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Dark shade overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Text widgets
          Positioned(
  top: 100,
  left: 50,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
    children: [
      Text(
        'DO YOU OWN A PROPERTY IN DUBAI ?',
        style: TextStyle(
          color: const Color.fromARGB(255, 201, 197, 197),
          fontSize: 15,
        ),
      ),
      Text(
        'Property Management Services',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
      ),
      Text(
        'Increase Your Return On Investment by Using our Dedicated Property Management ',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      SizedBox(height: 30,),
      Container(
              width: 200,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 231, 103, 39),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'Find out more',
                  style: TextStyle(
                    color: Colors.white, // Example text color
                    fontSize: 18, // Example font size
                  ),
                ),
              ),
            ),
    ],
  ),
),

          // Orange container
         
          // GestureDetector
          GestureDetector(
            onTap: () {
              // Add onTap functionality here if needed
            },
          ),
        ],
      ),
    );
  }
}

// class findoutmore extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//   width:MediaQuery.of(context).size.width * 0.75,
//   height: 400,
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(10),
//     image: DecorationImage(
//       image: AssetImage('assets/assets/more.png'),
//       fit: BoxFit.cover,
//     ),
//   ),
//   child: Stack(
//     children: [
//       // Dark shade overlay
//       Positioned.fill(
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),
//       Positioned(
//         bottom: 25, 
//         left: 150, 
//         child: Container(
//           width: 250,
//           padding: EdgeInsets.all(15),
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 231, 103, 39), 
           
//           ),
//           child: Center(
//             child: Text(
//               'Find out more',
//               style: TextStyle(
//                 color: Colors.white, // Example text color
//                 fontSize: 18, // Example font size
//               ),
//             ),
//           ),
//         ),
//       ),
  
// GestureDetector(
//   onTap: () {
//     // Add onTap functionality here if needed
//   },
// )]));

//   }}
