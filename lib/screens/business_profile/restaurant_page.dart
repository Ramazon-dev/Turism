import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/business/restourant_cubit/restarant_cubit.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RestaurantCubit(),
      child: BlocBuilder<RestaurantCubit, RestorantState>(
        builder: (ctx, state) {
          RestaurantCubit cubit = ctx.watch();
          return _buildScaffold(cubit);
        },
      ),
    );
  }

  Scaffold _buildScaffold(RestaurantCubit cubit) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Ресторан.'),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyEdgeInsets.symmetric(h: 30.0, v: 25.0),
          child: Column(
            children: [
              _showForms(cubit),
              MySizedBox(height: 20.0),
              const ImageSetter(),
              MySizedBox(height: 20.0),
              ElevatedButtonWidget(
                onPressed: () {},
                label: LocaleKeys.save.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Form fields
  Form _showForms(RestaurantCubit cubit) => Form(
    key: cubit.formKey,
    child: Column(
      children: [
        TextFormFieldWidget(
          controller: cubit.phoneController,
          inputType: TextInputType.text,
          hint: 'Название ресторан',
          validator: FormValidator.isNotEmpty,
          capitalization: TextCapitalization.sentences,
        ),
        MySizedBox(height: 20.0),
        TextFormFieldWidget(
          controller: cubit.phoneController,
          inputType: TextInputType.phone,
          hint: 'Введите номер телефона',
          validator: FormValidator.phone,
        ),
        MySizedBox(height: 20.0),
        DropDownWidget(onChanged: cubit.cityChanged, value: cubit.city),
        MySizedBox(height: 20.0),
        TextFormFieldWidget(
          inputType: TextInputType.url,
          controller: cubit.priceController,
          validator: FormValidator.isNotEmpty,
          hint: 'Расположение на карте (ссылка)',
        ),
        MySizedBox(height: 20.0),
        TextFormFieldWidget(
          inputType: TextInputType.url,
          controller: cubit.priceController,
          hint: 'Ссылка на сайт',
        ),
        MySizedBox(height: 20.0),
        TextFormFieldWidget(
          controller: cubit.aboutUzController,
          hint: 'Shaxsiy ma\'lumot',
          validator: FormValidator.multiLine,
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
}
