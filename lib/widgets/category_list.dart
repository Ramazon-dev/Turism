import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/home_cubit/home_cubit.dart';

class CategoryList extends StatelessWidget {
  final List<String> list;
  final HomeCubit cubit;

  const CategoryList({
    Key? key,
    required this.list,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MySizedBox(
      height: 59.0,
      child: ListView.builder(
          padding: MyEdgeInsets.symmetric(h: 15.0),
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, i) {
            String text = list[i];
            return InkWell(
              onTap: () {
                cubit.onCategoryChanged(i);
              },
              child: Chip(
                backgroundColor: i == cubit.categoryIndex
                    ? AppColors.greyPrice
                    : Colors.transparent,
                padding: MyEdgeInsets.symmetric(h: 20.0, v: 10.0),
                label: Text(
                  text,
                  style: AppTextStyle.medium(
                    size: 16.0,
                    color: i == cubit.categoryIndex
                        ? AppColors.white
                        : AppColors.greyPrice,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
