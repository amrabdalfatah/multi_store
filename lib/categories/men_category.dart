import 'package:flutter/material.dart';

import '../utilities/categ_list.dart';
import '../widgets/categ_widgets.dart';

class MenCategory extends StatelessWidget {
  const MenCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CategHeaderLabel(
                    headerLabel: 'Men',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                      children: List.generate(
                        men.length,
                        (index) {
                          return SubCategModel(
                            mainCategName: 'men',
                            subCategName: men[index],
                            assetName: 'images/men/men$index.jpg',
                            subCategLabel: men[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            right: 0,
            bottom: 0,
            child: SliderBar(
              mainCategName: 'men',
            ),
          ),
        ],
      ),
    );
  }
}
