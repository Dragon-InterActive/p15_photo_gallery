import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:p15_bildergalerie/core/controller/navigation_controller.dart';
import 'package:p15_bildergalerie/widgets/animated_card.dart';
import 'package:p15_bildergalerie/widgets/rich_text_row.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigation NACH dem Build konfigurieren
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 25),
        const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: AnimatedCard(
                  autoStart: true,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    elevation: 0,
                    clipBehavior: Clip.hardEdge,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Welcome to Kaya\'s Gallery!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF505050),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Card(
                margin: EdgeInsets.all(8),
                elevation: 6,
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Dieses Projekt ist im Rahmen unserer Weiterbildung entstanden. '
                    'Es zeigt nur einen kleinen Teil der Möglichkeiten, die Flutter einem Entwickler bietet.',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Card(
                color: Color(0xFF505050),
                margin: EdgeInsets.all(8),
                elevation: 6,
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Projekt-Infomationen:',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFFE2E2E2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: RichTextRow(
                          firstText: 'Handgeschrieneme Code-Zeilen: ',
                          secondText: '1043', // ohne Home
                          fontSize: 18,
                          firstFontWeight: FontWeight.bold,
                          secondFontWeight: FontWeight.normal,
                          textColor: Color(0xFFE2E2E2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: RichTextRow(
                          firstText: 'Eingebundene Libraries (pub.dev):     ',
                          secondText: '2', // ohne Home & richtextrow
                          fontSize: 18,
                          firstFontWeight: FontWeight.bold,
                          secondFontWeight: FontWeight.normal,
                          textColor: Color(0xFFE2E2E2),
                        ),
                      ),
                      Divider(),
                      Text(
                        'Libraries:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFE2E2E2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 2, 2, 2),
                        child: Text(
                          '- provider v6.1.5',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFE2E2E2),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 2, 2, 2),
                        child: Text(
                          '- flutter_staggered_grid_view v0.7.0',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFE2E2E2),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
