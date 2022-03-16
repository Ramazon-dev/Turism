import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/business/hotel_cubit/hotel_cubit.dart';
import 'package:mobileapp/widgets/images/show_image_network.dart';

class InputHotelPage extends StatelessWidget {
  final bool isEditing;
  Hotel? hotel;

  InputHotelPage({Key? key, required this.isEditing, this.hotel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => isEditing ? HotelCubit.editing(hotel!) : HotelCubit(),
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
      appBar: SimpleAppBar(title: LocaleKeys.hotel.tr(), ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyEdgeInsets.symmetric(h: 30.0, v: 25.0),
          child: Column(
            children: [
              Visibility(
                visible: isEditing,
                child: ShowImageNetwork(images: cubit.imageList),
              ),
              _showForms(cubit),
              MySizedBox(height: 20.0),
              Visibility(visible: !isEditing, child: const ImageSetter()),
              MySizedBox(height: 20.0),
              ElevatedButtonWidget(
                onPressed: cubit.onSavePressed,
                label: LocaleKeys.save.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Form Fields
  Form _showForms(HotelCubit cubit) => Form(
        key: cubit.formKey,
        child: Column(
          children: [
            // Hotel name
            TextFormFieldWidget(
              controller: cubit.nameController,
              inputType: TextInputType.text,
              hint: LocaleKeys.hotel.tr(),
              capitalization: TextCapitalization.sentences,
              validator: FormValidator.isNotEmpty,
            ),
            MySizedBox(height: 20.0),

            // Phone number
            TextFormFieldWidget(
              controller: cubit.phoneController,
              inputType: TextInputType.phone,
              hint: LocaleKeys.inputYourNumber.tr(),
              validator: FormValidator.phone,
              maxLength: 9,
              prefix: const PhonePrefix(),
            ),
            MySizedBox(height: 20.0),

            // City drop down button
            DropDownWidget(onChanged: cubit.cityChanged, value: cubit.city),
            MySizedBox(height: 20.0),

            // Link of geo Location
            TextFormFieldWidget(
              inputType: TextInputType.url,
              controller: cubit.websiteController,
              hint: LocaleKeys.mapLink.tr(),
              validator: FormValidator.general,
            ),
            MySizedBox(height: 20.0),

            // link of site
            TextFormFieldWidget(
              inputType: TextInputType.url,
              controller: cubit.mapLinkController,
              hint: LocaleKeys.linkOfSite.tr(),
            ),
            MySizedBox(height: 20.0),

            // Shaxsiy ma'lumot
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

            // Personal information'
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

            // Информация о себе
            TextFormFieldWidget(
              controller: cubit.aboutRuController,
              inputType: TextInputType.multiline,
              capitalization: TextCapitalization.sentences,
              action: TextInputAction.newline,
              validator: FormValidator.multiLine,
              hint: 'Информация о себе',
              lines: 5,
            ),
          ],
        ),
      );
}
