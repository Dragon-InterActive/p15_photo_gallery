import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:p15_bildergalerie/core/controller/navigation_controller.dart';
import 'package:p15_bildergalerie/features/galery/widgets/card_list_view.dart';

class Galery extends StatelessWidget {
  const Galery({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context, navController, child) {
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            overscroll: false, // Kein Overscroll-Effekt
          ),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => navController.setGalleryCrossAxisCount(2),
                    icon: Icon(Icons.grid_view),
                    color: navController.galleryCrossAxisCount == 2
                        ? Color(0xFF9B0406)
                        : Color(0xFF505050),
                  ),
                  IconButton(
                    onPressed: () => navController.setGalleryCrossAxisCount(3),
                    icon: Icon(Icons.grid_on_sharp),
                    color: navController.galleryCrossAxisCount == 3
                        ? Color(0xFF9B0406)
                        : Color(0xFF505050),
                  ),
                ],
              ),
              Expanded(
                child: CardListView(
                  countRows: navController.galleryCrossAxisCount,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
