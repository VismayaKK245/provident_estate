import 'package:flutter/material.dart';

class SellOrBuy extends StatefulWidget {
  @override
  _SellOrBuyState createState() => _SellOrBuyState();
}

class _SellOrBuyState extends State<SellOrBuy> {
  String dropdownValue = 'Buy'; // Initial dropdown value
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 148, 147, 147)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    focusNode: _focusNode,
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          dropdownValue = newValue; // Update dropdown value
                        });
                      }
                    },
                    items: <String>['Buy', 'Sell'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 8.0), // Adjust the padding as needed
                          child: Row(
                            children: [
                              SizedBox(width: 15), // Add space here
                              Text(value),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    underline: Container(), // Remove the underline
                    onTap: () {
                      _focusNode.requestFocus();
                    },
                  ),
                ),
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 148, 147, 147),
              thickness: 1,
              height: 5,
            ),
            const SizedBox(height: 10), // Add some space
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 20.0,
                  color: Color.fromARGB(255, 91, 92, 91),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Area, project, or community',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
