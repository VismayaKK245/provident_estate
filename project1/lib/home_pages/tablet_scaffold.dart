import 'package:flutter/material.dart';
import 'package:project1/appbar/tablet_appbar.dart';
import 'package:project1/circular_horizontal.dart';
import 'package:project1/filtersearch.dart';
import 'package:project1/first_horizondal/tablet_first_hori.dart';
import 'package:project1/footer.dart';
import 'package:project1/responsive_container/FourContainers.dart';
import 'package:project1/sellorbuy.dart';
import 'package:project1/style/style.dart';

class TabletScaffold extends StatelessWidget {
  const TabletScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tabletAppBar = buildTabletAppBar(context);

    return Scaffold(
         backgroundColor:   Color.fromARGB(255, 255, 255, 255),
      appBar: tabletAppBar,
       body: SingleChildScrollView(
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                double scaleFactor = screenWidth / 510.0; // Adjust as needed

                String headingText = 'Find your perfect property\nin Dubai';
                TextStyle headlineStyle = MyTextStyles.headline.copyWith(
                  fontSize: MyTextStyles.headline.fontSize! * scaleFactor,
                );

                return Container(
                  width: MediaQuery.of(context).size.width,
                   padding: const EdgeInsets.only(top: 100.0, left: 80.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: headlineStyle,
                              children: [
                                TextSpan(
                                  text: 'Find your perfect property',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5, // Adjust the spacing as needed
                          ),
                          if (screenWidth > 360) // Only display "in Dubai" on larger screens
                            Text(
                              'in Dubai',
                              style: headlineStyle,
                            ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: [
                          Text(
                            'Explore our exceptional range of residences Apartments, villas, duplexes, and more ',
                            style: MyTextStyles.body.copyWith(
                              fontSize: MyTextStyles.body.fontSize! * scaleFactor,
                            ),
                          ),
                          SizedBox(width: 5), // Adjust the spacing as needed
                          Text(
                            'are ready for you to uncover',
                            style: MyTextStyles.body.copyWith(
                              fontSize: MyTextStyles.body.fontSize! * scaleFactor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
               const SizedBox(height: 48),
            SellOrBuy(),
             const SizedBox(height: 5),
          FilterSearch(),
            const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 40.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/gif.gif",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Text(
                  " PROVIDENT ESTATE SERVICES",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 111, 109, 109),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Add some space
            LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                double scaleFactor = screenWidth / 360.0; // Adjust as needed

                String longSentence =
                    'Dubai real estate solutions focused around excellent customer service.';
                TextStyle longSentenceStyle = TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14 * scaleFactor, // Adjust font size based on screen width
                );

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Text(
                    longSentence,
                    style: longSentenceStyle,
                    textAlign: TextAlign.left,
                  ),
                );
              },
            ),
             SizedBox(height: 10,),
          
                        FourContainers(),
                          TabletFirstHorizontal(),
                           SizedBox(height: 20),
                CircularHorizontal(),
                           SizedBox(height: 20),
                FooterPage(),
 


            
    ]  ),
     ) );
  }
}
