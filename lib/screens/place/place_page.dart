import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/models/obekt_model.dart';
import 'package:mobileapp/services/obekt_services.dart';

// ignore: must_be_immutable
class PlacePage extends StatelessWidget {
  String? city;
  String? category;
  PlacePage({Key? key, this.city, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SimpleAppBar(title: 'Places'),
        body: FutureBuilder(
            future: ObektSevices().fetchobektbyCity(city!, category!),
            builder: (context, AsyncSnapshot<List<Obekt>> snap) {
              if (snap.hasData) {
                List<Obekt> data = snap.data!;
                return SizedBox(
                    child: GridView.builder(
                        itemCount: data.length,
                        padding: MyEdgeInsets.symmetric(h: 15.0.h, v: 22.0.w),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: getHeight(20.0),
                            crossAxisSpacing: getWidth(15.0),
                            mainAxisExtent: getHeight(284.0)),
                        itemBuilder: (ctx, i) {
                          return PlaceInfoCard(place: data[i]);
                        }));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
