import 'package:flutter/material.dart';
import 'package:p15_bildergalerie/core/config/gallery_item.dart';
import 'package:p15_bildergalerie/widgets/animated_card.dart';
import 'package:p15_bildergalerie/features/galery_details/galery_details.dart';
import 'package:p15_bildergalerie/features/galery/gallery_data.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CardListView extends StatelessWidget {
  final int countRows;
  const CardListView({super.key, this.countRows = 2});

  @override
  Widget build(BuildContext context) {
    List<GalleryItem> items = galleryData;

    return MasonryGridView.count(
      crossAxisCount: countRows,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 12),
          child: AnimatedCard(
            animationDuration: Duration(seconds: 3),
            onTap: () {
              //zur Detail-Seite
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GaleryDetails(id: index),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  Image.asset(items[index].imagePath),
                  Text(
                    items[index].imageTitle,
                    style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
