import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/data/city_list.dart';
import 'package:mobileapp/models/city_model.dart';

class DropDownWidget extends StatelessWidget {
  final ValueChanged<dynamic> onChanged;
  final String value;
  final List items;

  const DropDownWidget({
    Key? key,
    required this.onChanged,
    required this.value,
    required this.items
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(375.0),
      height: getHeight(54.0),
      padding: MyEdgeInsets.symmetric(h: 18.0),
      decoration: MyDecoration.circular(
        radius: 7.0,
        border: Border.all(color: AppColors.grey),
        color: Colors.transparent,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          hint: Text(
            'Выберите город',
            style: AppTextStyle.regular(color: AppColors.grey),
          ),
          items: items.map((e) => _setItem(e)).toList(),
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }

  DropdownMenuItem _setItem(String name) => DropdownMenuItem(
        child: Text(name, style: AppTextStyle.regular(color: AppColors.grey)),
        value: name,
      );
}
