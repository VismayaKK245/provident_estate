import"package:flutter/material.dart";

class Mytile extends StatelessWidget {
  const Mytile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(color: Color.fromARGB(255, 5, 182, 32),
          height: 80,),
        );
  }
}
