import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/business/hotel_cubit/hotel_cubit.dart';

class InputHotelPage extends StatelessWidget {
  const InputHotelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HotelCubit(),
      child: BlocBuilder<HotelCubit, HotelState>(
        builder: (ctx, state) {
          HotelCubit cubit = ctx.watch();
          return _buildScaffold(cubit);
        },
      ),
    );
  }

  Scaffold _buildScaffold(HotelCubit cubit) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Отель.'),
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
                label: 'Сохранить',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Form _showForms(HotelCubit cubit) => Form(
        key: cubit.formKey,
        child: Column(
          children: [
            TextFormFieldWidget(
              controller: cubit.phoneController,
              inputType: TextInputType.text,
              hint: 'Название отеля',
              capitalization: TextCapitalization.sentences,
            ),
            MySizedBox(height: 20.0),
            TextFormFieldWidget(
              controller: cubit.phoneController,
              inputType: TextInputType.phone,
              hint: 'Введите номер телефона',
            ),
            MySizedBox(height: 20.0),
            DropDownWidget(onChanged: cubit.cityChanged, value: cubit.city),
            MySizedBox(height: 20.0),
            TextFormFieldWidget(
              inputType: TextInputType.url,
              controller: cubit.priceController,
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
}
