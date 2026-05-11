import 'package:flutter/material.dart';
import '../../../data/colors.dart';
import 'logo_widget.dart';


class AppBarTop extends StatelessWidget implements PreferredSizeWidget {
  const AppBarTop ({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: Padding(
        padding: EdgeInsets.all(8.0),
        child: const Logo(),
        ),
      title: Text(
        'You got this!',
        style: TextStyle(
          color: BaseColors.dark,
          // fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.menu,
            size: 35,
            color: BaseColors.grey,
            ),
          onPressed: () {},
        ),
      ],
      backgroundColor: BaseColors.light,
      surfaceTintColor: Colors.transparent,
      shadowColor: BaseColors.shadow,
      elevation: 5.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}

