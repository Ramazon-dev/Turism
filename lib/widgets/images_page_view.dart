import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/data_formatter.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class ImagesPageView extends StatefulWidget {
  final List<String> imageList;

  const ImagesPageView({Key? key, required this.imageList}) : super(key: key);

  @override
  State<ImagesPageView> createState() => _ImagesPageViewState();
}

class _ImagesPageViewState extends State<ImagesPageView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: MyBorderRadius.circular(),
          child: PageView.builder(
              onPageChanged: _onPageChanged,
              itemCount: widget.imageList.length,
              itemBuilder: (ctx, i) {
                return CachedNetworkImage(
                  imageUrl: DataFormatter.formatImageUrl(widget.imageList[i]),
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              }),
        ),
        Positioned(
          right: 0.0,
          left: 0.0,
          bottom: 10.h,
          child: _showIndicator(),
        ),
      ],
    );
  }

  void _onPageChanged(i) {
    setState(() {
      _currentIndex = i;
    });
  }

  Wrap _showIndicator() => Wrap(
        alignment: WrapAlignment.center,
        spacing: 4.w,
        children: List.generate(
          widget.imageList.length,
          (index) => AnimatedContainer(
            height: 8.h,
            width: 8.w,
            duration: const Duration(milliseconds: 200),
            decoration: MyDecoration.circular(
              color: _currentIndex == index
                  ? AppColors.white
                  : AppColors.white.withOpacity(0.5),
            ),
          ),
        ),
      );
}
