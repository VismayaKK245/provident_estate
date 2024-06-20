import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FooterPage extends StatefulWidget {
  @override
  State<FooterPage> createState() => _FooterPageState();
}

class _FooterPageState extends State<FooterPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 1, 35, 62),
        width: double.infinity,
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            int columnsCount;
            double paddingValue;
            double containerHeight;

            if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
              columnsCount = 6;
              paddingValue = 100.0;
              containerHeight = 1000.0;
            } else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
              columnsCount = 3;
              paddingValue = 50.0;
              containerHeight = 919.0; // Adjust the height as needed
            } else {
              columnsCount = 2;
              paddingValue = 20.0;
              containerHeight = 600.0; // Adjust the height as needed
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingValue),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('BUY', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Properties for Sale', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Guide to Buying', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Signature Collection', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Mortgages', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Property', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 100),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('SELL', style: TextStyle(color: Colors.white)),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('List your Property', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Guide to Selling', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Book a Valuation', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 100),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('OFF PLAN', style: TextStyle(color: Colors.white)),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('New Projects', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Buying Off Plan', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Dubai Communities', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Dubai Developers', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Snagging & Inspection', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 100),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('RENT', style: TextStyle(color: Colors.white)),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Properties to Rent', style: TextStyle(color: Colors.white)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Guide to Renting', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Short Term Rentals', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Property Management', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 100),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ABOUT', style: TextStyle(color: Colors.white)),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('New Projects', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Buying Off Plan', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Dubai Communities', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Dubai Developers', style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Text('Snagging & Inspection', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Add more columns as needed
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: paddingValue, right: paddingValue, top: 45),
                  child: Divider(color: Color.fromARGB(255, 115, 129, 250)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingValue, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Handle social media icon tap
                            },
                            icon: Icon(Icons.facebook, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              // Handle social media icon tap
                            },
                            icon: Icon(Icons.facebook, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              // Handle social media icon tap
                            },
                            icon: Icon(Icons.facebook, color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('John Doe', style: TextStyle(color: Colors.white)),
                          Text('+1234567890', style: TextStyle(color: Colors.white)),
                          Text('john.doe@example.com', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}