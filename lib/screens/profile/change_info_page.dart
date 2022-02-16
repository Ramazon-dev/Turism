import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/inputs/underlined_field.dart';

class ChangingProfilePage extends StatelessWidget {
  const ChangingProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileAppBar(),
          Expanded(
            child: Padding(
              // padding: MyEdgeInsets.symmetric(h: 37.0,v: 54.0),
              padding: EdgeInsets.symmetric(horizontal: 37.0.w, vertical: 54.0.h),
              child: Column(
                children: [
                  ProfileCircleAvatar(imageUrl: 'default', height: 144.55),
                  MySizedBox(height: 22.73),
                  BlueButton(onPressed: () {}, label: 'Выберите файл'),
                  UnderlinedInputField(hint: 'Name', suffix: _suffix()),
                  MySizedBox(height: 12.0),
                  UnderlinedInputField(hint: 'Email', suffix: _suffix()),
                  const Spacer(),
                  ElevatedButtonWidget(onPressed: (){}, label: 'Сохранить'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  SvgPicture _suffix() => SvgPicture.asset(AppIcons.edit, fit: BoxFit.none);
}
