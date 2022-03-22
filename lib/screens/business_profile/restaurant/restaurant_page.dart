import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/business/restourant_cubit/restarant_cubit.dart';
import 'package:mobileapp/widgets/images/show_image_network.dart';

class RestaurantPage extends StatelessWidget {
  bool isEditing;
  Restaurant? restaurant;

  RestaurantPage({Key? key, this.isEditing = false, this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          isEditing ? RestaurantCubit.editing(restaurant!) : RestaurantCubit(),
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
      appBar: SimpleAppBar(title: LocaleKeys.restaurant.tr()),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyEdgeInsets.symmetric(h: 30.0, v: 25.0),
          child: Column(
            children: [
              Visibility(
                visible: isEditing,
                child: ShowImageNetwork(images: restaurant!.media!),
              ),
              _showForms(cubit),
              MySizedBox(height: 20.0),
              Visibility(visible: !isEditing, child: const ImageSetter()),
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

            // Name of restaurant
            TextFormFieldWidget(
              controller: cubit.nameController,
              inputType: TextInputType.text,
              hint: 'Название ресторан',
              validator: FormValidator.isNotEmpty,
              capitalization: TextCapitalization.sentences,
            ),
            MySizedBox(height: 20.0),

            // Phone number of restaurant
            TextFormFieldWidget(
              controller: cubit.phoneController,
              inputType: TextInputType.phone,
              hint: LocaleKeys.inputYourNumber.tr(),
              validator: FormValidator.phone,
              maxLength: 9,
              prefix: const PhonePrefix(),
            ),
            MySizedBox(height: 20.0),
            TextFormFieldWidget(
              inputType: TextInputType.text,
              controller: cubit.typeController,
              validator: FormValidator.isNotEmpty,
              hint: 'Тип ресторана',
            ),
            MySizedBox(height: 20.0),
            DropDownWidget(onChanged: cubit.cityChanged, value: cubit.city),
            MySizedBox(height: 20.0),
            TextFormFieldWidget(
              inputType: TextInputType.url,
              controller: cubit.mapLinkController,
              validator: FormValidator.isNotEmpty,
              hint: LocaleKeys.mapLink.tr(),
            ),
            MySizedBox(height: 20.0),
            TextFormFieldWidget(
              inputType: TextInputType.url,
              controller: cubit.websiteController,
              hint: LocaleKeys.linkOfSite.tr(),
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
