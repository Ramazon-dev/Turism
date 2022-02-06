import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/translations/locale_keys.g.dart';
import 'package:mobileapp/widgets/appbar_origin.dart';
import 'package:mobileapp/widgets/divider_widgets.dart';
import 'package:mobileapp/widgets/text_widgets.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBarOrigin(
        actions: SvgPicture.asset(AppIcons.language),
        actions2: SvgPicture.asset(AppIcons.dollar),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidgetTwo(
            "Давайте спланируем\nваше следующее приключение",
            style: TextWidgetTwo.medium(size: 20.0),
          ),
          const dividerWidget(),
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
          TextWidgetTwo(
            "Ближайшие туры.",
            style: TextWidgetTwo.medium(size: 18.0),
          ),
          Container(
            height: 200.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: getHeight(200.0),
                      width: 330.0,
                      decoration: MyDecoration.netImage(
                          netImage: "https://source.unsplash.com/random/1",
                          border: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: getHeight(22.0),
                            width: getWidth(51.0),
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
