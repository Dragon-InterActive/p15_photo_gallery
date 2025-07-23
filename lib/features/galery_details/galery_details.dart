import 'package:flutter/material.dart';

class GaleryDetails extends StatelessWidget {
  final int id;
  const GaleryDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/*
class DetailPage extends StatelessWidget {
  final int id;
  
  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail $id')),
      body: Center(child: Text('Detail Page $id')),
    );
  }
}
*/
