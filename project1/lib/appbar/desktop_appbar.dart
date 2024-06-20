// custom_app_bar.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey loginKey;

  CustomAppBar({required this.loginKey});

  void _scrollToSection(GlobalKey key, BuildContext context) {
    Scrollable.ensureVisible(key.currentContext!,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Stack(
        children: [
          Row(
            children: [
              SizedBox(width: 50),
              Text(
                'ABED REALTORS',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 23.0,
                  color: Color.fromARGB(255, 0, 0, 7),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(),
                    Text(
                      'Buy',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      'Rent',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      'New Projects',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      'Areas',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      'Services',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      'Blogs',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      'More',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      '|',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => _scrollToSection(loginKey, context),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Color.fromARGB(255, 255, 253, 253),
                        ),
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 70),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
