import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/my_decoration.dart';
import 'package:mobileapp/core/constants/app_images.dart';
import 'package:mobileapp/widgets/lets_go.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: MyDecoration.assetImage(assetImage: AppImages.first),
        child: Column(
          children: [
            SizedBox(height: getHeight(50.0)),
            LetsGo(text: 'Выберите свой город', color: AppColors.white)
          ],
        ),
      ),
    );
  }
}
