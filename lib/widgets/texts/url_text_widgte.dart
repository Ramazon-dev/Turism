import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

// ignore: must_be_immutable
class UrlTextWidget extends StatelessWidget {
  final String? url;
  final String text;
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
        width: MediaQuery.of(context).size.width * 0.75,
        child: Text(
          text,
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

    String newUrl;

    if (!url.toString().contains('http')) {
      newUrl = 'http://$url';
    } else {
      newUrl = url.toString();
    }

    if (await canLaunch(newUrl)) {
      await launch(newUrl);
    }
  }
}
