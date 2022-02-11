import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlTextWidget extends StatelessWidget {
  final String? url;
  final String? text;
  Color color;

  UrlTextWidget({
    Key? key,
    required this.url,
    required this.text,
    this.color = AppColors.linkColor,
  }) : super(key: key);
  // final UrlLaunch _launcher = UrlLaunch();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: urlLaunch,
      child: Text(
        text!,
        style: TextStyle(color: color),
      ),
    );
  }

  void urlLaunch() async {
    if (!await launch(url!)) {
      throw "Url Xato $url";
    }
  }
}
