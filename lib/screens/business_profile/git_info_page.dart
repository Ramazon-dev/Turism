import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/elevated_button_widget.dart';

class GitInfoPage extends StatelessWidget {
  const GitInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Гит.'),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyEdgeInsets.symmetric(h: 30.0, v: 25.0),
          child: Column(
            children: [
              Row(
                children: [
                  ProfileCircleAvatar(imageUrl: 'default'),
                  MySizedBox(width: 26.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Зиёда Собирова',
                          style: TextWidget.medium(size: 20.0)),
                      MySizedBox(height: 10.0),
                      BlueButton(onPressed: () {}, label: 'Изменить'),
                    ],
                  ),
                ],
              ),
              MySizedBox(height: 52.82),
              TextFormFieldWidget(hint: 'Введите номер телефона'),
              MySizedBox(height: 20.0),
              TextFormFieldWidget(hint: 'Введите номер телефона'),
              MySizedBox(height: 20.0),
              TextFormFieldWidget(hint: 'Введите номер телефона'),
              MySizedBox(height: 20.0),
              TextFormFieldWidget(hint: 'Информация о себе', lines: 5),
              MySizedBox(height: 20.0),
              TextFormFieldWidget(hint: 'Personal information', lines: 5),
              MySizedBox(height: 20.0),
              TextFormFieldWidget(hint: 'Shaxsiy ma\'lumot', lines: 5),
              MySizedBox(height: 20.0),
              Row(
                children: [
                  _setCheckBox('Uzb'),
                  _setCheckBox('Eng'),
                ],
              ),
              Row(
                children: [
                  _setCheckBox('Rus'),
                  _setCheckBox('Kaz'),
                ],
              ),
              MySizedBox(height: 30.0),
              ElevatedButtonWidget(
                onPressed: () {},
                label: 'Сохранить',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _setCheckBox(String title) => Expanded(
        child: CheckboxListTile(
          value: false,
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(title),
          onChanged: (v) {},
        ),
      );
}
