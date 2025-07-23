import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:p15_bildergalerie/core/controller/navigation_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //hole den Navigation-Controller
    final navController = Provider.of<NavigationController>(
      context,
      listen: false,
    );
    //Navigation-Controller konfigurieren
    navController.configure(
      visible: true,
      destinations: [
        const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        const NavigationDestination(
          icon: Icon(Icons.photo_album_outlined),
          label: 'Photo Gallery',
        ),
        const NavigationDestination(
          icon: Icon(Icons.person),
          label: 'About me',
        ),
      ],
      onDestinationSelected: (index) {
        //Leite an die entsprechende Seite weiter
        navController.setCurrentScreenIndex(index);
      },
    );

    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 25),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Nemo\'s Gallery!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
