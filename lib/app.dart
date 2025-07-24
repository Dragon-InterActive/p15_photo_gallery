import 'package:flutter/material.dart';
import 'package:p15_bildergalerie/core/controller/navigation_controller.dart';
import 'package:p15_bildergalerie/widgets/colored_appbar.dart';
import 'package:p15_bildergalerie/widgets/colored_navbar.dart';
import 'package:provider/provider.dart';

//Seiten-Imports
import 'package:p15_bildergalerie/features/home/home.dart';
import 'package:p15_bildergalerie/features/profile/profile.dart';
import 'package:p15_bildergalerie/features/galery/galery.dart';
//import 'package:p15_bildergalerie/features/galery_details/galery_details.dart';

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  static const List<Map<String, dynamic>> screenList = [
    {'screen': Home(), 'title': 'Gallery by Kaya', 'isHome': true},
    {'screen': Galery(), 'title': 'Photo Gallery', 'isHome': false},
    {'screen': Profile(), 'title': 'About me', 'isHome': false},
    //{'screen': GaleryDetails(), 'title': 'Details', 'isHome': false},
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final controller = NavigationController();
        //Screenliste übergeben
        controller.setScreenList(screenList);
        return controller;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<NavigationController>(
          builder: (context, controller, child) {
            final currentScreen = controller.currentScreen;

            return Scaffold(
              backgroundColor: Color(0xFFE2E2E2),
              appBar: ColoredAppBar(
                title: currentScreen['title'] ?? 'Gallery by Kaya',
                isHome: currentScreen['isHome'] ?? false,
              ),
              body: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                child: Container(
                  key: ValueKey(controller.currentScreenIndex),
                  child: SafeArea(
                    child: currentScreen['screen'] ?? Container(),
                  ),
                ),
              ),
              bottomNavigationBar: const ColoredNavbar(),
            );
          },
        ),
      ),
    );
  }
}
