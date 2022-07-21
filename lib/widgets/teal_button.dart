import 'package:flutter/material.dart';

class TealButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final double width;
  const TealButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(25)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          label,
        ),
      ),
    );
  }
}
