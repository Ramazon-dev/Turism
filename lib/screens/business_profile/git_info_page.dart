import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/functions/city_list.dart';
import 'package:mobileapp/cubit/business/git_cubit/git_cubit.dart';
import 'package:mobileapp/widgets/elevated_button_widget.dart';

class GitInfoPage extends StatelessWidget {
  const GitInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GitCubit(),
      child: BlocBuilder<GitCubit, GitState>(
        builder: (ctx, state) {
          GitCubit cubit = ctx.watch();
          return _buildScaffold(cubit);
        },
      ),
    );
  }

  Scaffold _buildScaffold(GitCubit cubit) {
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
                      Text(
                        'Зиёда Собирова',
                        style: TextWidget.medium(size: 20.0),
                      ),
                      MySizedBox(height: 10.0),
                      BlueButton(onPressed: () {}, label: 'Изменить'),
                    ],
                  ),
                ],
              ),
              MySizedBox(height: 52.82),
              _showForms(cubit),
              MySizedBox(height: 20.0),
              _showLanguages(cubit),
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

  Form _showForms(GitCubit cubit) => Form(
        key: cubit.formKey,
        child: Column(
          children: [
            TextFormFieldWidget(
              controller: cubit.phoneController,
              inputType: TextInputType.phone,
              hint: 'Введите номер телефона',
            ),
            MySizedBox(height: 20.0),
            DropDownWidget(onChanged: cubit.cityChanged, value: cubit.city),
            MySizedBox(height: 20.0),
            TextFormFieldWidget(
              inputType: TextInputType.number,
              controller: cubit.priceController,
              hint: 'Введите стоимость услуги',
            ),
            MySizedBox(height: 20.0),
            TextFormFieldWidget(
              controller: cubit.aboutUzController,
              hint: 'Shaxsiy ma\'lumot',
              action: TextInputAction.newline,
              capitalization: TextCapitalization.sentences,
              inputType: TextInputType.multiline,
              lines: 5,
            ),
            MySizedBox(height: 20.0),
            TextFormFieldWidget(
              controller: cubit.aboutEnController,
              capitalization: TextCapitalization.sentences,
              hint: 'Personal information',
              action: TextInputAction.newline,
              inputType: TextInputType.multiline,
              lines: 5,
            ),
            MySizedBox(height: 20.0),
            TextFormFieldWidget(
              controller: cubit.aboutRuController,
              inputType: TextInputType.multiline,
              capitalization: TextCapitalization.sentences,
              action: TextInputAction.newline,
              hint: 'Shaxsiy ma\'lumot',
              lines: 5,
            ),
          ],
        ),
      );

  Column _showLanguages(GitCubit cubit) => Column(
        children: [
          Row(
            children: [
              _setCheckBox(
                title: 'Uzb',
                value: cubit.hasUzb,
                onChanged: cubit.onUzbPressed,
              ),
              _setCheckBox(
                title: 'Kaz',
                value: cubit.hasKaz,
                onChanged: cubit.onKazPressed,
              ),
            ],
          ),
          Row(
            children: [
              _setCheckBox(
                title: 'Eng',
                value: cubit.hasEng,
                onChanged: cubit.onEngPressed,
              ),
              _setCheckBox(
                title: 'Rus',
                value: cubit.hasRus,
                onChanged: cubit.onRusPressed,
              ),
            ],
          ),
        ],
      );

  Expanded _setCheckBox({
    required String title,
    required bool value,
    required ValueChanged<bool?>? onChanged,
  }) =>
      Expanded(
        child: CheckboxListTile(
          value: value,
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(title),
          onChanged: onChanged,
        ),
      );
}
