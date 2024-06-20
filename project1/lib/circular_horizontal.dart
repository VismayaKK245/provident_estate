import 'package:flutter/material.dart';

class CircularHorizontal extends StatefulWidget {
  const CircularHorizontal({super.key});

  @override
  State<CircularHorizontal> createState() => _CircularHorizontalState();
}

class _CircularHorizontalState extends State<CircularHorizontal> {
  ScrollController _scrollController = ScrollController();
  bool _showBackArrow = false;
  bool _showForwardArrow = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    setState(() {
      _showBackArrow = _scrollController.position.pixels > 0;
      _showForwardArrow =
          _scrollController.position.pixels < _scrollController.position.maxScrollExtent;
    });
  }

  void _scroll(bool forward) {
    double offset =
        forward ? _scrollController.offset + 200 : _scrollController.offset - 200;
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width * 0.8,
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: 15,
            itemBuilder: (context, index) {
              return Row(
                children: <Widget>[
                  Container(
                    width: 20, // Adjust the width as needed for the space between containers
                  ),
                  Container(
                    height: 170,
                    width: 170, // Set the width and height to be equal for a circular container
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Use BoxShape.circle for circular containers
                      border: Border.all(
                        color: const Color.fromARGB(255, 103, 102, 102), // Adjust the color as needed
                        width: 1, // Adjust the width of the border
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/assets/Circle.png', // Path to your asset image
                        // Adjust the fit as needed
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          if (_showBackArrow)
            Positioned(
              left: 0,
              top: 100,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 205, 204, 204),
                  shape: BoxShape.circle, // Use BoxShape.circle for circular containers
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _scroll(false);
                  },
                ),
              ),
            ),
          if (_showForwardArrow)
            Positioned(
              right: 0,
              top: 100,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 205, 204, 204),
                  shape: BoxShape.circle, // Use BoxShape.circle for circular containers
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    _scroll(true);
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}