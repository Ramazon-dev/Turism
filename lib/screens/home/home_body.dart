import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/divider_widgets.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: getHeight(56.0),
            color: Colors.blue,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: getWidth(65.0),
                    height: getHeight(39.0),
                    color: Colors.greenAccent,
                  ),
                );
              },
            ),
          ),
          const dividerWidget(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: getHeight(593.5),
            child: GridView.builder(
              itemCount: 9,
              padding: MyEdgeInsets.symmetric(h: 16.0, v: 25.0),
              gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.77,
                crossAxisSpacing: getWidth(8.0),
                mainAxisSpacing: getHeight(20.0),
              )),
              itemBuilder: (context, index) {
                return Container(
                  decoration: MyDecoration.shadow(color: Colors.black12),
                  height: getHeight(273.0),
                  width: getWidth(165.0),
                  child: Column(
                    children: [
                      Container(
                        height: getHeight(200.0),
                        width: getWidth(165.0),
                        decoration: MyDecoration.netImage(
                          
                            netImage:
                                "https://source.unsplash.com/random/index1",
                            border: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                AppIcons.favourite,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                     
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
