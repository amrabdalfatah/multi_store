import 'package:flutter/material.dart';

import '../widgets/fake_search.dart';

List<ItemsData> items = [
  ItemsData(label: 'Men'),
  ItemsData(label: 'Women'),
  ItemsData(label: 'Shoes'),
  ItemsData(label: 'Bags'),
  ItemsData(label: 'Electronics'),
  ItemsData(label: 'Accessories'),
  ItemsData(label: 'Home & Garden'),
  ItemsData(label: 'Kids'),
  ItemsData(label: 'Beauty'),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    for (var element in items) {
      element.isSelected = false;
    }
    items[0].isSelected = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const FakeSearch(),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: sideNavigator(size),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: categView(size),
          ),
        ],
      ),
    );
  }

  Widget sideNavigator(Size size) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.2,
      color: Colors.grey.shade300,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 100),
                curve: Curves.bounceInOut,
              );
              // for (var element in items) {
              //   element.isSelected = false;
              // }
              // setState(() {
              //   items[index].isSelected = true;
              // });
            },
            child: Container(
              height: size.height * 0.2,
              color: items[index].isSelected ? Colors.white : null,
              child: Center(
                child: Text(
                  items[index].label,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget categView(Size size) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.8,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          for (var element in items) {
            element.isSelected = false;
          }
          setState(() {
            items[value].isSelected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: const [
          Center(child: Text('men category')),
          Center(child: Text('women category')),
          Center(child: Text('shoes category')),
          Center(child: Text('bags category')),
          Center(child: Text('electronics category')),
          Center(child: Text('Accessories category')),
          Center(child: Text('Home & Garden category')),
          Center(child: Text('Kids category')),
          Center(child: Text('Beauty category')),
        ],
      ),
    );
  }
}

class ItemsData {
  String label;
  bool isSelected;

  ItemsData({required this.label, this.isSelected = false});
}
