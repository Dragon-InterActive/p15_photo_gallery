import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:p15_bildergalerie/core/controller/navigation_controller.dart';
import 'package:p15_bildergalerie/widgets/colored_appbar.dart';
import 'package:p15_bildergalerie/features/galery/gallery_data.dart';

class GaleryDetails extends StatelessWidget {
  final int id;
  const GaleryDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2E2E2),
      appBar: ColoredAppBar(
        title: 'Details: ${galleryData[id].imageTitle}',
        isHome: false,
        onHomePressed: () {
          final navController = Provider.of<NavigationController>(
            context,
            listen: false,
          );
          navController.setCurrentScreenIndex(0);
          Navigator.pop(context);
        },
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          overscroll: false, // Kein Overscroll-Effekt
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(galleryData[id].imagePath),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF505050),
                          ),
                          children: [
                            TextSpan(
                              text: galleryData[id].imageTitle,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        galleryData[id].imageDate,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF505050),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        galleryData[id].imageDescription,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
