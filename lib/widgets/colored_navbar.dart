import 'package:flutter/material.dart';
import 'package:p15_bildergalerie/core/controller/navigation_controller.dart';
import 'package:provider/provider.dart';

class ColoredNavbar extends StatelessWidget {
  const ColoredNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context, controller, child) {
        //Wenn nicht sichtbar, gib leeren Container zurück
        if (!controller.isVisible || controller.destinations.isEmpty) {
          return const SizedBox.shrink();
        }

        //NavigationBar mit aktueller Konfiguration zurückgeben
        return Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              radius: 1.9,
              colors: [Color(0xFF3E0102), Color(0xFF9B0406)],
            ),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              navigationBarTheme: NavigationBarThemeData(
                labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return const TextStyle(
                      color: Color(0xFFCCAC00),
                      fontWeight: FontWeight.bold,
                    );
                  }
                  return const TextStyle(color: Color(0xFFE2E2E2));
                }),
                iconTheme: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return const IconThemeData(
                      color: Color(0xFFCCAC00),
                      size: 36,
                    );
                  }
                  return const IconThemeData(
                    color: Color(0xFFE2E2E2),
                    size: 24,
                  );
                }),
                indicatorColor: Colors.transparent,
              ),
            ),
            child: NavigationBar(
              indicatorColor: Colors.transparent,
              selectedIndex: controller.selectedIndex,
              destinations: controller.destinations,
              onDestinationSelected: (index) {
                controller.setSelectedIndex(index);
                //Callback an die Seite weiterleiten falls vorhanden
                controller.onDestinationSelected?.call(index);
              },
              elevation: 8,
              backgroundColor: Colors.transparent,
            ),
          ),
        );
      },
    );
  }
}
