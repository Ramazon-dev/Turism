import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class EmptyPageWidget extends StatelessWidget {
  const EmptyPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 365.h,
      width:  375.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImages.empty),
          const Text('No data'),
        ],
      ),
    );
  }
}
