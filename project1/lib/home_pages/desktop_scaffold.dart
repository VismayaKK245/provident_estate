import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:project1/appbar/desktop_appbar.dart';
import 'package:project1/circular_horizontal.dart';
import 'package:project1/findoutmore.dart';
import 'package:project1/first_horizondal/first_horizontal.dart';
import 'package:project1/footer.dart';
import 'package:project1/responsive_container/FourContainers.dart';
import 'package:project1/row_desktop.dart';
import 'package:project1/submit_d,etails.dart';
// import 'package:project1/login_container.dart'; // Import the LoginContainer

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  final GlobalKey loginKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  bool _isSignUp = false;

  void _toggleFormType() {
    setState(() {
      _isSignUp = !_isSignUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: CustomAppBar(loginKey: loginKey),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth > 1000 ? 200 : 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Find your perfect property in Dubai",
                        style: TextStyle(
                          fontSize: 53,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 20),
                      AutoSizeText(
                        "Explore our exceptional range of residences. Apartments, villas, duplexes, and more are ready for you to uncover!",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                      padding: EdgeInsets.only(top: 100, left: screenWidth > 1000 ? 200 : 20),
                      child: RowDesktop()
                    ),
                    SizedBox(height: 50), 
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth > 1000 ? 200 : 20),
                      child: Container(
                        width: screenWidth > 1000 ? MediaQuery.of(context).size.width * 0.73 : double.infinity,
                        height: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          child: Image.asset(
                            "assets/gif.gif",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                     SizedBox(height: 20),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth > 1000 ? 200 : 20, vertical: 20),
                      child: Text("EXPLORE PROVIDENT ESTATE SERVICES"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth > 1000 ? 200 : 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "Dubai real estate solutions focused around excellent customer service.",
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                         
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth > 1000 ? 200 : 20, vertical: 20),
                      child: FourContainers(),
                    ),
                    
                    FirstHorizontal(),
                  
                    SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth > 1000 ? 200 : 20),
                      child: FindOutMore(),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth > 1000 ? 200 : 20, vertical: 20),
                      child: Text("PARTNERS WITH DUBAI’S LEADING DEVELOPERS"),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth > 1000 ? 200 : 20),
                      child:  CircularHorizontal(),
                    ),
                    // Place the LoginContainer here
                    Container(
                      key: loginKey,
                      child: LoginContainer(
                        isSignUp: _isSignUp,
                        toggleFormType: _toggleFormType,
                      ),
                    ),
                    SizedBox(height: 20),
                    FooterPage(),
                  ],
                ),
              );
            },
          ),
       
    
    );
  }
}
