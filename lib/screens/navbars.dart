import 'package:flutter/material.dart';
import '../common/colors.dart';
import '../common/painting.dart';


const IconData copyright = IconData(0xe198, fontFamily: 'MaterialIcons');

class AppBarTop extends StatelessWidget implements PreferredSizeWidget {
  const AppBarTop ({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.all(8.0),
        // child: Image.asset('/images/coffee.png'),
        child: CustomPaint(
          size: Size(200, 200),
          painter: MyPainting(),
        ),
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


class AppBarBottom extends StatelessWidget {
  const AppBarBottom ({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,     
        child: Container(
          color: AppBarColors.background,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'Impressum',
                style: TextStyle(fontSize: 16),
                ),
              Text(
                '\u00A9 2026 \n Anita Gasteiner',
                textAlign: TextAlign.center,
              ),
              Text(
                'Datenschutz',
                style: TextStyle(fontSize: 16),
                ),
            ],
          ),
        ),             
      );
  }

}

