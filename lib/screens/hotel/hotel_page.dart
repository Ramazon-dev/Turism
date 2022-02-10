import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class HotelListPage extends StatelessWidget {
  const HotelListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Hotel'),
    );
  }
}
