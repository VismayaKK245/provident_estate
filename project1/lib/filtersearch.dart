import 'package:flutter/material.dart';

class FilterSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9, // Adjust width as needed
      child: Container(
        padding: const EdgeInsets.only(left: 0, top: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children at the start and end
          children: [
            GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>FilterPage()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.43,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 122, 122, 122),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 2.0, left: 25),
                        child: Text(
                          'Filters',
                          style: TextStyle(
                            color: Color.fromARGB(255, 7, 0, 0),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.0, right: 40),
                      child: Icon(
                        Icons.filter_3,
                        size: 25.0,
                        color: Color.fromARGB(255, 0, 4, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04), // Adjust spacing between the two containers
            Container(
              width: MediaQuery.of(context).size.width * 0.43,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 105, 27),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.0, left: 25),
                      child: Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.0, right: 40),
                    child: Icon(
                      Icons.search,
                      size: 25.0,
                      color: Color.fromARGB(255, 243, 244, 243),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
