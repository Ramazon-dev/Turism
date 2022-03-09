import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class ShowImageNetwork extends StatelessWidget {
  final List<String> images;

  const ShowImageNetwork({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildContainer();
  }

  Container _buildContainer() {
    return Container(
      width: 315.w,
      height: 288.h,
      decoration: MyDecoration.circular(border: Border.all(), color: Colors.transparent),
      padding: MyEdgeInsets.symmetric(h: 12.0, v: 9.0),
      margin: MyEdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            decoration:
                MyDecoration.netImage(netImage: CityList.cities[0].imgUrl),
            height: 216.h,
            width: 291.w,
            child: FloatingActionButton(
              mini: true,
              elevation: 0.0,
              onPressed: () {},
              backgroundColor: const Color(0x26ffffff),
              child: SvgPicture.asset(AppIcons.image),
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              _showImage(CityList.cities[1].imgUrl),
              SizedBox(width: 10.w),
              _showImage(CityList.cities[2].imgUrl),
              SizedBox(width: 10.w),
              _showImage(CityList.cities[3].imgUrl),
              SizedBox(width: 10.w),
              _showImage(CityList.cities[4].imgUrl),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _showImage(String image) => Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.w),
          child: CachedNetworkImage(
            imageUrl: image,
            height: 40.h,
            width: 65.w,
            fit: BoxFit.cover,
          ),
        ),
      );
}
