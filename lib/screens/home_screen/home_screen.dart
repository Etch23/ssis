import 'package:flutter/material.dart';
import 'package:sprinkler_system/screens/land_screen/land_screen.dart';
import 'package:sprinkler_system/utils/gaps.dart';

import '../../utils/colors_palette.dart';
import '../../utils/util_values.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/divider.dart';
import '../../widgets/garden_card.dart';
import '../../widgets/logout_button.dart';
import 'local_widgets/todays_analytic.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(
            title: 'Home',
            actions: [LogoutButton()],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: UtilValues.scrollPhysics,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const TodaysAnalytic(),
                    Gaps.gap24,
                    const CustomDivider(),
                    Gaps.gap24,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Front Garden',
                        style: TextStyle(
                          color: ColorsPalette.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Gaps.gap24,
                    GardenCard(
                      heroTag: 'garden',
                      onTap: () {
                        Navigator.of(context).pushNamed(LandScreen.routeName);
                      },
                    ),
                    Gaps.gap24,
                    const Text(
                      'Number of sprinklers: 10\nActive: 6\nInactive: 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsPalette.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
