import 'package:flutter/material.dart';
import 'package:p15_bildergalerie/core/config/gallery_item.dart';
import 'package:p15_bildergalerie/features/galery/widgets/animated_card.dart';
import 'package:p15_bildergalerie/features/galery_details/galery_details.dart';
import 'package:p15_bildergalerie/features/galery/gallery_data.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CardListView extends StatelessWidget {
  const CardListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<GalleryItem> items = galleryData;
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 8,
            right: 8,
            bottom: 4,
          ),
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
                  Text(items[index].imageTitle, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
