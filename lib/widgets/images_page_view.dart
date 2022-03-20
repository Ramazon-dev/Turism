import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class ImagesPageView extends StatelessWidget {
  final List<String> imageList;
  final ValueChanged<int> onChanged;
  final int currentIndex;

  const ImagesPageView({
    Key? key,
    required this.imageList,
    required this.onChanged,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
            itemCount: imageList.length,
            itemBuilder: (ctx, i) {
              return CachedNetworkImage(
                imageUrl: imageList[i],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            }),
        Positioned(bottom: 10.h, child: _showIndicator()),
      ],
    );
  }

  _showIndicator() => Wrap(
        alignment: WrapAlignment.center,
        spacing: 4.w,
        children: List.generate(
          imageList.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: MyDecoration.circular(
              color: currentIndex == index
                  ? AppColors.white
                  : AppColors.white.withOpacity(0.5),
            ),
          ),
        ),
      );
}
