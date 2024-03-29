import 'package:flutter/material.dart';
import 'package:sprinkler_system/utils/assets_manager.dart';

import '../../../utils/colors_palette.dart';
import '../../../utils/gaps.dart';
import '../../../widgets/custom_card.dart';

class TodaysAnalytic extends StatelessWidget {
  const TodaysAnalytic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Today',
                style: TextStyle(
                  color: ColorsPalette.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                'Sat, 10 Aug', // TODO: Replace with today date
                style: TextStyle(
                  color: ColorsPalette.primarySwatch.shade300,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Gaps.gap32,
          Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '20',
                    style: TextStyle(
                      color: ColorsPalette.primaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '°C',
                    style: TextStyle(
                      color: ColorsPalette.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Gaps.gap16,
              Text.rich(
                TextSpan(
                  children: const [
                    TextSpan(text: 'Precip: '),
                    TextSpan(
                      text: '0%\n',
                      style: TextStyle(
                        color: ColorsPalette.primarySwatch,
                      ),
                    ),
                    TextSpan(text: 'Humidity: '),
                    TextSpan(
                      text: '23%\n',
                      style: TextStyle(
                        color: ColorsPalette.primarySwatch,
                      ),
                    ),
                    TextSpan(text: 'Wind: '),
                    TextSpan(
                      text: '29 km/h',
                      style: TextStyle(
                        color: ColorsPalette.primarySwatch,
                      ),
                    ),
                  ],
                  style: TextStyle(
                    color: ColorsPalette.primarySwatch.shade300,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              Gaps.gap16,
              Image.asset(
                AssetsManager.weather,
                width: 80,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
