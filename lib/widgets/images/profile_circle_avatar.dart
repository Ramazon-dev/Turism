import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/data/image_list.dart';

// ignore: must_be_immutable
class ProfileCircleAvatar extends StatelessWidget {
  final String imageUrl;
  VoidCallback onPressed;
  double height;

  ProfileCircleAvatar({
    Key? key,
    required this.onPressed,
    required this.imageUrl,
    this.height = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: getHeight(height),
          height: getHeight(height),
          decoration: MyDecoration.circular(
            border: Border.all(color: AppColors.primary, width: getWidth(2)),
            color: Colors.transparent,
            radius: 100.0,
          ),
          child: ClipRRect(
            borderRadius:
                MyBorderRadius.circular(radius: _isDefault() ? 0.0 : 100.0),
            child: _isDefault()
                ? Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SvgPicture.asset(AppIcons.personal),
                  )
                : CachedNetworkImage(
                    imageUrl: imageUrl,
                    errorWidget: (context, url, error) => Image.asset(
                          AppImages.notFound,
                          fit: BoxFit.cover,
                        )),
          ),
        ),
        Positioned(
            bottom: 0.0,
            right: 0.0,
            child: InkWell(
              onTap: onPressed,
              child: CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: getWidth(21.43),
                child: SvgPicture.asset(AppIcons.image),
              ),
            )),
      ],
    );
  }

  bool _isDefault() => imageUrl == 'default';
}
