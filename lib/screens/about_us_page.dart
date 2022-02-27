import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: LocaleKeys.aboutUs.tr()),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text(
                'Что это за пролог?',
                style: TextWidget.medium(size: 20),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                height: 174.h,
                width: 335.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://source.unsplash.com/random/1',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
                style: TextWidget.regular(size: 16.h),
              ),
              SizedBox(height: 10.h),
              Text(
                "Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover ",
                style: TextWidget.regular(size: 16.h),
              ),
              SizedBox(height: 10.h),
              Text(
                'Кто участвовал в нас?',
                style: TextWidget.medium(size: 20.h),
              ),
              SizedBox(height: 10.h),
              Text(
                "Content here, content here', making it look like readable English. Many desktop publishing packages and web page ",
                style: TextWidget.regular(size: 16.h),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                height: 116.h,
                width: 335.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://source.unsplash.com/random/2',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using",
                style: TextWidget.regular(size: 16.h),
              ),
              SizedBox(height: 10.h),
              Text(
                "Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover ",
                style: TextWidget.regular(size: 16.h),
              ),
              SizedBox(height: 10.h),
              Container(
                margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                height: 174.h,
                width: 335.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://source.unsplash.com/random/3',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Связаться с нами:",
                style: TextWidget.regular(size: 16.h),
              ),
              MySizedBox(height: 17.0),
              _buildLink(
                  AppIcons.call, '+998 90 962 16 81', 'tel:+998 90 962 1681',
                  labelColor: AppColors.black),
              MySizedBox(height: 10.0),
              MySizedBox(height: 17.0),
              _buildLink(
                  AppIcons.link, 'Telegram link ', 'https://t.me/Ramazon1681',
                  labelColor: AppColors.black),
              MySizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildLink(
    String assetIcon,
    String label,
    String link, {
    Color iconColor = AppColors.black,
    Color labelColor = AppColors.linkColor,
  }) {
    return Row(
      children: [
        SvgPicture.asset(assetIcon, height: getHeight(15.0), color: iconColor),
        MySizedBox(width: 15.0),
        UrlTextWidget(text: label, url: link, color: labelColor)
      ],
    );
  }
}
