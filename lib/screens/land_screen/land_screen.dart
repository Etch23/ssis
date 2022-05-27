import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprinkler_system/utils/gaps.dart';
import 'package:sprinkler_system/widgets/custom_card.dart';

import '../../utils/colors_palette.dart';
import '../../utils/util_values.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/garden_card.dart';
import 'local_widgets/sprinkler_item.dart';

class LandScreen extends StatelessWidget {
  static const String routeName = '/land';

  const LandScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Front Garden',
        actions: [
          Row(
            children: [
              const Text(
                'Auto',
                style: TextStyle(
                  color: ColorsPalette.primaryColor,
                ),
              ),
              Transform.scale(
                scale: 0.75,
                child: CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: ColorsPalette.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
                      physics: UtilValues.scrollPhysics,

        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const GardenCard(heroTag: 'garden'),
              Gaps.gap24,
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sprinklers',
                  style: TextStyle(
                    color: ColorsPalette.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gaps.gap24,
              CustomCard(
                child: Column(
                  children: [
                    for (int i = 0; i < 10; i++) const SprinklerItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
