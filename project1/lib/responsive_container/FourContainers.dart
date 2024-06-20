
import 'package:flutter/material.dart';
import 'package:project1/responsive_container/container_content.dart';
import 'package:project1/responsive_container/product.dart';

class FourContainers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth;
    double containerHeight;
    int crossAxisCount;

    if (screenWidth >= 1100) {
      crossAxisCount = 4;
      containerWidth = screenWidth * 0.2;
      containerHeight = 250;
    } else if (screenWidth < 1100 && screenWidth >= 700) {
      crossAxisCount = 2;
      containerWidth = screenWidth * 0.4;
      containerHeight = 150;
    } else {
      crossAxisCount = 1;
      containerWidth = screenWidth * 0.8;
      containerHeight = 100;
    }

    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      constraints: const BoxConstraints(maxWidth: 1233),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: containerWidth / containerHeight,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          final isIconOnTop = crossAxisCount == 1;
          return ContainerContent(
            press: () {},
            product: product,
            isIconOnTop: isIconOnTop,
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
