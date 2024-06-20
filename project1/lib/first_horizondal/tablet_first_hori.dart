import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TabletFirstHorizontal extends StatefulWidget {
  const TabletFirstHorizontal({super.key});

  @override
  State<TabletFirstHorizontal> createState() => ___TabletFirstHorizontalState();
}

class ___TabletFirstHorizontalState extends State<TabletFirstHorizontal> {
   Color _container1Color = const Color.fromARGB(255, 0, 5, 8);
  Color _container2Color = const Color.fromARGB(255, 216, 218, 216);
  Color _container3Color = const Color.fromARGB(255, 216, 218, 216);
  PageController _controller = PageController();
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _container1Color = const Color.fromARGB(255, 0, 5, 8);
                      _container2Color = const Color.fromARGB(255, 216, 218, 216);
                      _container3Color = const Color.fromARGB(255, 216, 218, 216);
                      _currentPageIndex = 0;
                      _controller.jumpToPage(0);
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 50,
                    color: _container1Color,
                    child: Center(
                      child: Text(
                        "For sale",
                        style: TextStyle(
                          color: _container1Color ==
                              const Color.fromARGB(255, 0, 5, 8)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _container1Color = const Color.fromARGB(255, 216, 218, 216);
                      _container2Color = const Color.fromARGB(255, 11, 7, 0);
                      _container3Color = const Color.fromARGB(255, 216, 218, 216);
                      _currentPageIndex = 1;
                      _controller.jumpToPage(0);
                    });
                  },
                  child: Container(
                    width: 110,
                    height: 50,
                    color: _container2Color,
                    child: Center(
                      child: Text(
                        "For rent",
                        style: TextStyle(
                          color: _container2Color ==
                              const Color.fromARGB(255, 11, 7, 0)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _container1Color = const Color.fromARGB(255, 216, 218, 216);
                      _container2Color = const Color.fromARGB(255, 216, 218, 216);
                      _container3Color = const Color.fromARGB(255, 0, 3, 0);
                      _currentPageIndex = 2;
                      _controller.jumpToPage(0);
                    });
                  },
                  child: Container(
                    width: 110,
                    height: 50,
                    color: _container3Color,
                    child: Center(
                      child: Text(
                        "OFF Plan",
                        style: TextStyle(
                          color: _container3Color ==
                              const Color.fromARGB(255, 0, 3, 0)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // onTap logic
                    });
                  },
                  child: Container(
                    width: 110,
                    height: 50,
                    color: Color.fromARGB(255, 226, 95, 20),
                    child: Center(
                      child: Text(
                        "More Properties",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 15),
         LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double itemSpacing = screenWidth * 0.01; // Adjust this value as needed

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  height: 500,
                  width: screenWidth > 500
                      ? MediaQuery.of(context).size.width * 1
                      : double.infinity,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: PageView.builder(
                              controller: _controller,
                              scrollDirection: Axis.horizontal,
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                String imagePath;
                                if (_currentPageIndex == 0) {
                                  imagePath = "assets/room2.jpg";
                                } else if (_currentPageIndex == 1) {
                                  imagePath = "assets/room3.jpg";
                                } else if (_currentPageIndex == 2) {
                                  imagePath = "assets/room4.jpg";
                                }
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: itemSpacing),
                                  child: Container(
                                    width: screenWidth * 0.05,
                                    decoration: BoxDecoration(
                                      color: _currentPageIndex == index
                                          ? Colors.black
                                          : Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      _currentPageIndex == 0
                                          ? "assets/room2.jpg"
                                          : _currentPageIndex == 1
                                              ? "assets/room3.jpg"
                                              : _currentPageIndex == 2
                                                  ? "assets/room4.jpg"
                                                  : "",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                           SizedBox(height: 30),
                          SizedBox(
                            height: 16,
                            child: SmoothPageIndicator(
                              controller: _controller,
                              count: 7,
                              effect: JumpingDotEffect(
                                activeDotColor: const Color.fromARGB(255, 43, 145, 196),
                                dotColor: Colors.deepPurple.shade100,
                                dotHeight: 15,
                                dotWidth: 15,
                                spacing: 16,
                                jumpScale: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 16,
                        top: 200,
                        bottom: 200,
                        child: GestureDetector(
                          onTap: () {
                            _controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.arrow_back, color: Colors.black),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 16,
                        top: 200,
                        bottom: 200,
                        child: GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.arrow_forward, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
                ],
              );
  }
  }


