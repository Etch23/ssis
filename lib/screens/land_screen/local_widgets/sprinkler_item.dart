import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:sprinkler_system/utils/assets_manager.dart';

import '../../../utils/colors_palette.dart';
import '../../../utils/gaps.dart';

class SprinklerItem extends StatelessWidget {
  const SprinklerItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsManager.sprinkler,
          width: 30,
          height: 30,
        ),
        Gaps.gap12,
        Text(
          Random().nextInt(1000000000).toString(),
          style: const TextStyle(
            color: ColorsPalette.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Transform.scale(
          scale: 0.75,
          child: CupertinoSwitch(
            value: true,
            onChanged: (value) {},
            activeColor: ColorsPalette.primaryColor,
          ),
        ),
      ],
    );
  }
}
