import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sprinkler_system/utils/colors_palette.dart';

import 'custom_card.dart';
import 'garden_card/local_widgets/garden_sprinkle.dart';

class GardenCard extends StatelessWidget {
  final String heroTag;
  final VoidCallback? onTap;

  const GardenCard({
    Key? key,
    required this.heroTag,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: heroTag,
        child: Stack(
          children: const [
            CustomCard(
              child: SizedBox(
                height: 150,
                width: double.infinity,
              ),
            ),
            GardenSprinkle(
              x: 30,
              y: 70,
            ),
            GardenSprinkle(
              x: 80,
              y: 20,
            ),
            GardenSprinkle(
              x: 200,
              y: 130,
            ),
            GardenSprinkle(
              isActive: false,
              x: 60,
              y: 130,
            ),
            GardenSprinkle(
              isActive: false,
              x: 250,
              y: 40,
            ),
            GardenSprinkle(
              isActive: false,
              x: 140,
              y: 80,
            ),
          ],
        ),
      ),
    );
  }
}
