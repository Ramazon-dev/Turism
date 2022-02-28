import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/top_bar/appbar_origin.dart';

class FindingByCityPage extends StatelessWidget {
  final String city;
  const FindingByCityPage({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Зоны обслуживания в $city:'),

        ],
      ),
    );
  }
}
