import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final IconData icon;

  MyDrawerTile(
      {super.key, 
      required this.onTap, 
      required this.text, 
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        onTap: onTap,
        title: Text(
          text,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
