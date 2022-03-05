import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class EmptyPageWidget extends StatelessWidget {
  const EmptyPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImages.empty),
          Text('No data'),
        ],
      ),
    );
  }
}
