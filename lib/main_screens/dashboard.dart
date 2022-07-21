import 'package:flutter/material.dart';
import 'package:multi_store/widgets/appbar_widgets.dart';

List<String> labels = [
  'my store',
  'orders',
  'edit profile',
  'manage products',
  'balance',
  'statistcs',
];

List<IconData> icons = [
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.show_chart,
];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                '/welcome_screen',
              );
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 50,
          mainAxisSpacing: 50,
          children: List.generate(
            labels.length,
            (index) {
              return Card(
                shadowColor: Colors.purpleAccent,
                elevation: 20,
                color: Colors.blueGrey.withOpacity(0.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      icons[index],
                      size: 50,
                      color: Colors.tealAccent,
                    ),
                    Text(
                      labels[index].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 24,
                        letterSpacing: 2,
                        color: Colors.tealAccent,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Acme',
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
