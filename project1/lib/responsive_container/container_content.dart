import 'package:flutter/material.dart';
import 'package:project1/responsive_container/product.dart';

class ContainerContent extends StatelessWidget {
  final Product product;
  final VoidCallback press;
  final bool isIconOnTop;

  const ContainerContent({
    Key? key,
    required this.product,
    required this.press,
    required this.isIconOnTop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.all(9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: product.color,
        ),
        child: isIconOnTop ? _buildContentWithIconOnTop() : _buildContentWithIconBelow(),
      ),
    );
  }

 Widget _buildContentWithIconOnTop() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            product.iconData,
            size: 35,
            color: const Color.fromARGB(255, 5, 0, 0),
          ),
        ),
         SizedBox(width: 12),
       
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start (left)
            children: [
              Padding(
                padding: const EdgeInsets.only(top:18.0),
                child: Text(
                  product.title,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 5, 0, 0),
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                product.text,
                style: TextStyle(
                  color: const Color.fromARGB(255, 3, 0, 0),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


  Widget _buildContentWithIconBelow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            product.iconData,
            size: 35,
            color: const Color.fromARGB(255, 8, 0, 0),
          ),
        ),
        Text(
          product.title,
          style: TextStyle(
            color: const Color.fromARGB(255, 5, 0, 0),
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            product.text,
            style: TextStyle(
              color: const Color.fromARGB(255, 8, 0, 0),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
