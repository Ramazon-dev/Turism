import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlTextWidget extends StatelessWidget {
  String? url;
  String? text;
  UrlTextWidget({
    Key? key,
    this.url,
    this.text,
  }) : super(key: key);
  // final UrlLaunch _launcher = UrlLaunch();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: urlLaunch,
      child: Text(
        text!,
        style: const TextStyle(color: AppColors.linkColor),
      ),
    );
  }

  void urlLaunch() async {
    if (!await launch(url!)) {
      throw "Url Xato $url";
    }
  }
}
