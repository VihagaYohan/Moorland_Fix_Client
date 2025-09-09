import 'package:flutter/material.dart';

class UIAppBar extends StatelessWidget {
  final String title;


  const UIAppBar({
    super.key,
    required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge
      ), 
      centerTitle: true,
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_left))
    );
  }
}
