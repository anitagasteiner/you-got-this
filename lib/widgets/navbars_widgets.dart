import 'package:flutter/material.dart';
import '../common/colors.dart';
import 'logo_widget.dart';


class AppBarTop extends StatelessWidget implements PreferredSizeWidget {
  const AppBarTop ({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            color: BaseColors.main,
            ),
          onPressed: () {},
        ),
      ],
      backgroundColor: BaseColors.light,
      surfaceTintColor: Colors.transparent,
      shadowColor: BaseColors.light,
      elevation: 4.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}


class AppBarBottom extends StatelessWidget {
  const AppBarBottom ({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,     
        child: Container(
          color: BaseColors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Impressum',
                    style: TextStyle(
                      color: BaseColors.light,
                      fontSize: 16
                    ),
                    ),
                  Text(
                    'Datenschutz',
                    style: TextStyle(
                      color: BaseColors.light,
                      fontSize: 16
                    ),
                    ),
                ],
              ),
              Text(
                '\u00A9 2026 Anita Gasteiner',
                style: TextStyle(
                  color: BaseColors.light,
                  fontSize: 14
                ),
              ),
              SizedBox(height: 4),
            ],
          ),
        ),
      );
  }

}

