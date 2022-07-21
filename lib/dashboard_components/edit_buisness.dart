import 'package:flutter/material.dart';
import 'package:multi_store/widgets/appbar_widgets.dart';

class EditBuisness extends StatelessWidget {
  const EditBuisness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'Edit Buisness'),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
