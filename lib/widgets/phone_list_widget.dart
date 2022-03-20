import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class PhoneListWidget extends StatelessWidget {
  final List<String> phoneList;

  const PhoneListWidget({Key? key, required this.phoneList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        phoneList.length,
        (i) => _setPhone(phoneList[i]),
      ),
    );
  }

  Padding _setPhone(String phone) => Padding(
        padding: MyEdgeInsets.symmetric(v: 5.0),
        child: Row(
          children: [
            const Icon(Icons.phone_outlined, color: AppColors.greyPrice),
            SizedBox(width: 8.w),

            // TODO: API to'g'gilanganidan so'ng formattedga o'zgartiriladi
            Text(
              phone,
              style: AppTextStyle.medium(size: 12.w),
            )
          ],
        ).onClick(() async {
          await launch('tel:$phone');
        }),
      );

  String _formattedNumber(String phone) {
    String code = phone.substring(0, 6);
    String major = phone.substring(5, 8);
    String minor = phone.substring(8, 10);
    String patch = phone.substring(10, 12);
    String formatted = '$code $major-$minor-$patch';
    return formatted;
  }
}
