import 'package:flutter/material.dart';

import '../minor_screens/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchScreen();
              }));
            },
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.teal,
                  width: 1.4,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'What are you looking for?',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 32,
                    width: 75,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.teal,
            indicatorWeight: 4,
            tabs: [
              RepeatedTab(
                label: 'Men',
              ),
              RepeatedTab(
                label: 'Women',
              ),
              RepeatedTab(
                label: 'Shoes',
              ),
              RepeatedTab(
                label: 'Bags',
              ),
              RepeatedTab(
                label: 'Electronics',
              ),
              RepeatedTab(
                label: 'Accessories',
              ),
              RepeatedTab(
                label: 'Home & Garden',
              ),
              RepeatedTab(
                label: 'Kids',
              ),
              RepeatedTab(
                label: 'Beauty',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Men Screen')),
            Center(child: Text('Women Screen')),
            Center(child: Text('Shoes Screen')),
            Center(child: Text('Bags Screen')),
            Center(child: Text('Electronics Screen')),
            Center(child: Text('Accessories Screen')),
            Center(child: Text('Home & Garden Screen')),
            Center(child: Text('Kids Screen')),
            Center(child: Text('Beauty Screen')),
          ],
        ),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  const RepeatedTab({required this.label, Key? key}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }
}
