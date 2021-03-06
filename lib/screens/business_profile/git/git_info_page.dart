import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/components/image_filter.dart';
import 'package:mobileapp/cubit/business/git_cubit/git_cubit.dart';

// ignore: must_be_immutable
class GitInfoPage extends StatelessWidget {
  Git? git;
  bool isEditing;
  GitInfoPage({Key? key, this.git, this.isEditing = false}) : super(key: key);

  final Map<String, dynamic> _data = GetStorage().read('user');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => isEditing ? GitCubit.editing(git!) : GitCubit(),
      child: BlocBuilder<GitCubit, GitState>(
        builder: (ctx, state) {
          GitCubit cubit = ctx.watch();
          GitCubit cubitRead = ctx.read();
          return _buildScaffold(cubit, cubitRead);
        },
      ),
    );
  }

  // Build Scaffold
  WillPopScope _buildScaffold(GitCubit cubit, GitCubit cubitRead) {
    UserModel user = UserModel.fromJson(_data);
    return WillPopScope(
      onWillPop: () async {
        ImageChooser.imageList.clear();
        return true;
      },
      child: Scaffold(
        appBar: SimpleAppBar(title: LocaleKeys.git.tr()),
        body: SingleChildScrollView(
          child: Padding(
            padding: MyEdgeInsets.symmetric(h: 30.0, v: 25.0),
            child: Column(
              children: [
                Row(
                  children: [
                    //TODO:
                    ProfileCircleAvatar(
                      imageUrl: user.image != null
                          ? imageFilter(git!.image!)
                          : 'default',
                      onPressed: cubitRead.onChooseImage,
                    ),
                    MySizedBox(width: 26.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: AppTextStyle.medium(size: 20.0),
                        ),
                        MySizedBox(height: 10.0),
                        BlueButton(
                            onPressed: cubitRead.readImage,
                            label: LocaleKeys.edit.tr()),
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
                  onPressed: cubit.onSavePressed,
                  label: LocaleKeys.save.tr(),
                ),
              ],
            ),
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
              hint: LocaleKeys.inputYourNumber.tr(),
              validator: FormValidator.phone,
              maxLength: 9,
              prefix: const PhonePrefix(),
            ),
            MySizedBox(height: 20.0),
            DropDownWidget(
              onChanged: cubit.cityChanged,
              value: cubit.city,
              items: CityList.cities.map((e) => e.name).toList(),
            ),
            MySizedBox(height: 20.0),
            TextFormFieldWidget(
              inputType: TextInputType.number,
              controller: cubit.priceController,
              hint: LocaleKeys.enterPrice.tr(),
              validator: FormValidator.isNotEmpty,
            ),
            MySizedBox(height: 20.0),
            TextFormFieldWidget(
              controller: cubit.aboutUzController,
              hint: 'Shaxsiy ma\'lumot',
              action: TextInputAction.newline,
              capitalization: TextCapitalization.sentences,
              inputType: TextInputType.multiline,
              validator: FormValidator.multiLine,
              lines: 5,
            ),
            MySizedBox(height: 20.0),
            TextFormFieldWidget(
              controller: cubit.aboutEnController,
              capitalization: TextCapitalization.sentences,
              hint: 'Personal information',
              action: TextInputAction.newline,
              inputType: TextInputType.multiline,
              validator: FormValidator.multiLine,
              lines: 5,
            ),
            MySizedBox(height: 20.0),
            TextFormFieldWidget(
              controller: cubit.aboutRuController,
              inputType: TextInputType.multiline,
              capitalization: TextCapitalization.sentences,
              action: TextInputAction.newline,
              validator: FormValidator.multiLine,
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
