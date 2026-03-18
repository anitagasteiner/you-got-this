import 'package:flutter/material.dart';
import '../common/colors.dart';

class AppBarTop extends StatelessWidget implements PreferredSizeWidget {
  const AppBarTop ({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.all(8.0),
        child: Image.asset('/images/coffee.png'),
        ),
      title: const Text('You got this!'),
      actions: [
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ],
      backgroundColor: AppBarColors.background,
      shadowColor: AppBarColors.shadow,
      elevation: 3.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}