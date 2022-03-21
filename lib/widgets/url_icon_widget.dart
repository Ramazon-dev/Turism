import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class UrlIconWidget extends StatelessWidget {
  String? url;
  Widget? icon;
  UrlIconWidget({
    Key? key,
    this.icon,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: urlLaunch,
      child: Container(
        height: getHeight(50),
        width: getWidth(50),
        decoration: BoxDecoration(
          color: AppColors.darkCyan,
          borderRadius: BorderRadius.circular(5),
        ),
        child: icon,
      ),
    );
  }

  void urlLaunch() async {
    if (!await launch(url!)) {
      throw "Url Xato $url";
    }
  }
}
