import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/my_decoration.dart';
import 'package:mobileapp/core/constants/app_images.dart';
import 'package:mobileapp/widgets/lets_go.dart';
import 'package:mobileapp/widgets/my_sized_box.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: MyDecoration.assetImage(assetImage: AppImages.first),
        child: Column(
          children: [
            const LetsGo(text: 'Выберите свой город', color: AppColors.white),
            MySizedBox(height: 30.0),
            Stack(
              children: [
                Container(
                  height: 487.0,
                  width: 321.0,
                  decoration: BoxDecoration(
                    border: Border(
                      top: _buildBorderSide(17.2),
                      left: _buildBorderSide(14.0),
                      right: _buildBorderSide(14.0),
                      bottom: _buildBorderSide(70.34),
                    ),
                  ),
                ),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: getHeight(18.0),
                  child: Column(
                    children: [
                      TextWidget(
                        "Ташкент Сити",
                        style: TextWidget.semiBold(
                          color: AppColors.primary,
                          size: 16.0,
                        ),
                      ),
                      MySizedBox(height: 7.5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _setIndicator(),
                          _setIndicator(),
                          _setIndicator(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  MySizedBox _setIndicator() => MySizedBox(
        width: 55.0,
        height: 3.0,
        child: Padding(
          padding: MyEdgeInsets.symmetric(h: 5.0),
          child: const LinearProgressIndicator(
            color: AppColors.primary,
            value: 0.5,
            backgroundColor: AppColors.disabled,
          ),
        ),
      );

  BorderSide _buildBorderSide(double size) => BorderSide(
        color: AppColors.white,
        width: getWidth(size),
      );
}
