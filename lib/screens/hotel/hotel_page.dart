import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/services/hotel_service.dart';

class HotelListPage extends StatelessWidget {
  const HotelListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = 'https://source.unsplash.com/random/5';
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Hotel'),
      body: FutureBuilder(
        future: HotelService().fetchHotelsByCity('toshkent'),
        builder: (context, snap) {
          if(snap.hasError) {
            return const Text('Error');
          } else if(snap.hasData) {
            var data = snap.data as List;
            return GridView.builder(
            padding: MyEdgeInsets.symmetric(h: 15.0, v: 20.0),
              gridDelegate: _gridDelegate(),
              itemCount: data.length,
              itemBuilder: (ctx, i) {
              var d = data[i];
              print(d.toString());
              String img = d['media'][0].toString().replaceAll('k__image__', '');
                return Container(
                  decoration: MyDecoration.netImage(netImage: img, border: 7.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(data[0]['name_uz'])
                    ],
                  ),
                );
              });
          }
          return const CupertinoActivityIndicator();
        }
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount _gridDelegate() {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: getHeight(20.0),
      crossAxisSpacing: getWidth(15.0),
      childAspectRatio: 0.7
    );
  }
}
