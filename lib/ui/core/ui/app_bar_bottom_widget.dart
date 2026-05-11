import 'package:flutter/material.dart';
import '../themes/colors.dart';


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

