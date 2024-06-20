// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:project1/placeby_placename.dart';

// class RowDesktop extends StatefulWidget {
//   const RowDesktop({Key? key}) : super(key: key);

//   @override
//   State<RowDesktop> createState() => _RowDesktopState();
// }

// class _RowDesktopState extends State<RowDesktop> {
//   String selectedOption = 'Buy';
//   String? _selectedOption1;
//   String? _selectedOption; // Initially set to 'Buy'

//   bool _isPopupVisible = false;
//   bool _isPopupVisible1 = false;
//   IconData iconData = Icons.keyboard_arrow_down;
//   final TextEditingController _textEditingController = TextEditingController();
//   final FocusNode _focusNode = FocusNode();
//   final LayerLink _layerLink = LayerLink();
//   OverlayEntry? _overlayEntry;
//   List<String> _suggestions = [];

//   void _showOverlay() {
//     _overlayEntry = _createOverlayEntry();
//     Overlay.of(context)!.insert(_overlayEntry!);
//   }

//   void _hideOverlay() {
//     _overlayEntry?.remove();
//     _overlayEntry = null;
//     // Clear the text field after selecting a suggestion
//     _suggestions.clear();
//   }

//   OverlayEntry _createOverlayEntry() {
//     RenderBox renderBox = context.findRenderObject() as RenderBox;
//     var size = renderBox.size;

//     return OverlayEntry(
//       builder: (context) => Positioned(
//         width: size.width,
//         child: CompositedTransformFollower(
//           link: _layerLink,
//           showWhenUnlinked: false,
//           offset: Offset(0.0, size.height + 5.0),
//           child: Material(
//             elevation: 4.0,
//             child: ListView(
//               padding: EdgeInsets.zero,
//               shrinkWrap: true,
//               children: _suggestions.map((suggestion) {
//                 return ListTile(
//                   title: Text(suggestion),
//                   onTap: () {
//                     _hideOverlay();
//                     // Navigate to new page here
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => PlaceDetailsPage(placeName: suggestion)),
//                     );
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _fetchSuggestions(String input) async {
//     final String requestUrl = 'http://localhost:4000/places?query=$input';
//     final response = await http.get(Uri.parse(requestUrl));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final List<dynamic> predictions = data['predictions'];

//       setState(() {
//         _suggestions = predictions.map((prediction) => prediction['description'] as String).toList();
//       });

//       if (_suggestions.isNotEmpty) {
//         _showOverlay();
//       } else {
//         _hideOverlay();
//       }
//     } else {
//       throw Exception('Failed to load suggestions');
//     }
//   }

//   void _updateSuggestions(String input) {
//     if (input.isNotEmpty) {
//       _fetchSuggestions(input);
//     } else {
//       _hideOverlay();
//     }
//   }

//   @override
//   void dispose() {
//     _textEditingController.dispose();
//     _focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CompositedTransformTarget(
//       link: _layerLink,
//       child: Container(
//         child: Row(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 255, 255, 255),
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(
//                   color: Colors.black38,
//                 ),
//               ),
//               width: MediaQuery.of(context).size.width * 0.55,
//               height: 50, // Fixed height for the container
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: Row(
//                       children: [
//                         Text(_selectedOption ?? 'Buy'),
//                         GestureDetector(
//                           onLongPress: () {
//                             setState(() {
//                               _isPopupVisible = true;
//                             });
//                           },
//                           onTap: () {
//                             if (_isPopupVisible) {
//                               setState(() {
//                                 _isPopupVisible = false;
//                               });
//                             }
//                           },
//                           child: Container(
//                             width: 80,
//                             child: PopupMenuButton<String>(
//                               onSelected: (value) {
//                                 setState(() {
//                                   _isPopupVisible = false;
//                                   _selectedOption = value;
//                                 });
//                                 // Handle selection here
//                               },
//                               icon: _isPopupVisible ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
//                               offset: Offset(-30, 50),
//                               itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//                                 const PopupMenuItem<String>(
//                                   value: 'Buy',
//                                   child: Text('Buy'),
//                                 ),
//                                 const PopupMenuItem<String>(
//                                   value: 'Rent',
//                                   child: Text('Rent'),
//                                 ),
//                               ],
//                               onCanceled: () {
//                                 setState(() {
//                                   _isPopupVisible = false;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   VerticalDivider(),
//                   Expanded(
//                     child: Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.location_on_outlined, color: Colors.grey),
//                         ),
//                         Expanded(
//                           child: TextField(
//                             controller: _textEditingController,
//                             focusNode: _focusNode,
//                             decoration: InputDecoration(
//                               hintText: 'Area, project or community',
//                               border: InputBorder.none,
//                             ),
//                             onChanged: (value) {
//                               _updateSuggestions(value);
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(width: 18),
//             Container(
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 209, 108, 8),
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(
//                   color: Colors.black38,
//                 ),
//               ),
//               width: MediaQuery.of(context).size.width * 0.1,
//               height: 50, // Fixed height for the container
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 13.0, right: 10),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Search',
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.search_outlined),
//                       color: Colors.white,
//                       iconSize: 15,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1/placeby_placename.dart';

class RowDesktop extends StatefulWidget {
  const RowDesktop({Key? key}) : super(key: key);

  @override
  State<RowDesktop> createState() => _RowDesktopState();
}

class _RowDesktopState extends State<RowDesktop> {
  String selectedOption = 'Buy';
  String? _selectedOption1;
  String? _selectedOption; // Initially set to 'Buy'

  bool _isPopupVisible = false;
  bool _isPopupVisible1 = false;
  IconData iconData = Icons.keyboard_arrow_down;
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  List<String> _suggestions = [];

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context)!.insert(_overlayEntry!);
  }

  void _hideOverlay(String selectedSuggestion) {
    _overlayEntry?.remove();
    _overlayEntry = null;
    // Set the text of the text field to the selected suggestion
    _textEditingController.text = selectedSuggestion;
    // Clear the suggestions list
    _suggestions.clear();
  }

  void _onSearchButtonPressed() {
    // Get the value from the text field
    String searchText = _textEditingController.text;
    // Perform navigation only if the search text is not empty
    if (searchText.isNotEmpty) {
      // Send a POST request to save the selected place to MongoDB
      http.post(
        Uri.parse('http://localhost:4000/places'),
        body: json.encode({
          'selectedPlaceName': searchText,
          'storeInDB': true, // Flag indicating to store in MongoDB
        }),
        headers: {'Content-Type': 'application/json'},
      ).then((response) {
        if (response.statusCode == 200) {
          // If the request is successful, navigate to the details page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlaceDetailsPage(placeName: searchText)),
          );
        } else {
          // Handle error
          print('Failed to save place to MongoDB');
        }
      }).catchError((error) {
        // Handle error
        print('Error: $error');
      });
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: _suggestions.map((suggestion) {
                return ListTile(
                  title: Text(suggestion),
                  onTap: () {
                    if (_suggestions.isNotEmpty) {
                      _hideOverlay(suggestion);
                    }
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _fetchSuggestions(String input) async {
    final String requestUrl = 'http://localhost:4000/places?query=$input';
    final response = await http.get(Uri.parse(requestUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> predictions = data['predictions'];

      setState(() {
        _suggestions = predictions.map((prediction) => prediction['description'] as String).toList();
      });

      if (_suggestions.isNotEmpty) {
        _showOverlay();
      } else {
        _hideOverlay('');
      }
    } else {
      throw Exception('Failed to load suggestions');
    }
  }

  void _updateSuggestions(String input) {
    if (input.isNotEmpty) {
      _fetchSuggestions(input);
    } else {
      _hideOverlay('');
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: () {
          // Remove navigation logic from here
        },
        child: Container(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black38,
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.55,
                height: 50, // Fixed height for the container
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          Text(_selectedOption ?? 'Buy'),
                          GestureDetector(
                            onLongPress: () {
                              setState(() {
                                _isPopupVisible = true;
                              });
                            },
                            onTap: () {
                              if (_isPopupVisible) {
                                setState(() {
                                  _isPopupVisible = false;
                                });
                              }
                            },
                            child: Container(
                              width: 80,
                              child: PopupMenuButton<String>(
                                onSelected: (value) {
                                  setState(() {
                                    _isPopupVisible = false;
                                    _selectedOption = value;
                                  });
                                  // Handle selection here
                                },
                                icon: _isPopupVisible ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
                                offset: Offset(-30, 50),
                                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                  const PopupMenuItem<String>(
                                    value: 'Buy',
                                    child: Text('Buy'),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: 'Rent',
                                    child: Text('Rent'),
                                  ),
                                ],
                                onCanceled: () {
                                  setState(() {
                                    _isPopupVisible = false;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.location_on_outlined, color: Colors.grey),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _textEditingController,
                              focusNode: _focusNode,
                              decoration: InputDecoration(
                                hintText: 'Area, project or community',
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                _updateSuggestions(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 18),
              GestureDetector(
                onTap: _onSearchButtonPressed, // Changed to call _onSearchButtonPressed
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 209, 108, 8),
                    borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                      color: Colors.black38,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: 50, // Fixed height for the container
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13.0, right: 10),
                    child: Row(
                      children: [
                        Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search_outlined),
                          color: Colors.white,
                          iconSize: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

