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
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Text(
          text!,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: color,
          ),
        ),
      ),
    );
  }

  void urlLaunch() async {
    if (!await launch(url!)) {
      throw "Url Xato $url";
    }
  }
}
