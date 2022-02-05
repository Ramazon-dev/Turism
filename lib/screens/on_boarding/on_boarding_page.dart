import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/lets_go.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  double _indicatorValue = 0.0;
  int _index = 0;

  @override
  initState() {
    super.initState();
    _setState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInCubic,
        decoration: MyDecoration.assetImage(
          assetImage: _onBoardingInfo[_index]['image'],
        ),
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
                        _onBoardingInfo[_index]['city'],
                        style: TextWidget.semiBold(
                          color: AppColors.primary,
                          size: 16.0,
                        ),
                      ),
                      MySizedBox(height: 7.5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _setIndicator(_indicatorValue),
                          _setIndicator(_indicatorValue - 1.0),
                          _setIndicator(_indicatorValue - 2.0),
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

  MySizedBox _setIndicator(double value) => MySizedBox(
        width: 55.0,
        height: 3.0,
        child: Padding(
          padding: MyEdgeInsets.symmetric(h: 5.0),
          child: LinearProgressIndicator(
            color: AppColors.primary,
            value: value,
            backgroundColor: AppColors.disabled,
          ),
        ),
      );

  BorderSide _buildBorderSide(double size) => BorderSide(
        color: AppColors.white,
        width: getWidth(size),
      );

  Future _setState() async {
    while (_indicatorValue <= 3.0) {
      await Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          _indicatorValue += 0.05;
        });
        if (_indicatorValue >= 1.0 && _indicatorValue <= 2.0) {
          _index = 1;
        } else if (_indicatorValue >= 2.0) {
          _index = 2;
        }
      });
    }
    if (_indicatorValue >= 3.0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  final List _onBoardingInfo = [
    {"image": AppImages.first, "city": "Ташкент Сити"},
    {"image": AppImages.second, "city": "Ташкент Сити"},
    {"image": AppImages.third, "city": "бУХАРА"},
  ];
}
