import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:p15_bildergalerie/core/controller/navigation_controller.dart';

class ColoredAppBar extends AppBar {
  ColoredAppBar({
    super.key,
    required String title,
    bool isHome = false,
    VoidCallback? onSettingsPressed,
    VoidCallback? onHomePressed,
    VoidCallback? onMenuPressed,
  }) : super(
         flexibleSpace: Container(
           decoration: const BoxDecoration(
             gradient: RadialGradient(
               radius: 1.9,
               colors: [Color(0xFF3E0102), Color(0xFF9B0406)],
             ),
           ),
         ),
         centerTitle: true,
         title: Text(
           title,
           style: const TextStyle(
             color: Color(0xFFCCAC00),
             fontWeight: FontWeight.bold,
             fontSize: 24,
           ),
         ),
         elevation: 5,
         leading: _buildLeading(isHome, onMenuPressed),
         actions: _buildActions(isHome, onSettingsPressed, onHomePressed),
       );
  static Widget? _buildLeading(bool isHome, VoidCallback? onMenuPressed) {
    if (isHome) {
      /*return Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, size: 38, color: Color(0xFFE2E2E2)),
          onPressed: onMenuPressed ?? () => Scaffold.of(context).openDrawer(),
        ),
      );*/
      return const SizedBox.shrink();
    } else {
      return Builder(
        builder: (context) => IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 38,
            color: Color(0xFFE2E2E2),
          ),
          onPressed: () {
            final navController = Provider.of<NavigationController>(
              context,
              listen: false,
            );
            navController.goBack();
          },
        ),
      );
    }
  }

  static List<Widget> _buildActions(
    bool isHome,
    VoidCallback? onSettingsPressed,
    VoidCallback? onHomePressed,
  ) {
    if (isHome) {
      return [
        /*Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.settings,
              size: 32,
              color: Color(0xFFE2E2E2),
            ),
            onPressed:
                onSettingsPressed ??
                () {
                  Navigator.pushNamed(context, '/settings');
                },
          ),
        ),*/
      ];
    } else {
      return [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.home, size: 32, color: Color(0xFFE2E2E2)),
            onPressed:
                onHomePressed ??
                () {
                  final navController = Provider.of<NavigationController>(
                    context,
                    listen: false,
                  );
                  navController.setCurrentScreenIndex(0);
                  //Navigator.popUntil(context, (route) => route.isFirst);
                },
          ),
        ),
      ];
    }
  }
}
