import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/home_cubit/home_cubit.dart';

class ProfileAuthPage extends StatefulWidget {
  const ProfileAuthPage({Key? key}) : super(key: key);

  @override
  State<ProfileAuthPage> createState() => _ProfileAuthPageState();
}

// TODO Vaqtincha StatefulWidget'da qilindi. Cubitga ulash kerak.

class _ProfileAuthPageState extends State<ProfileAuthPage> {
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (ctx, state) {
          HomeCubit cubit = ctx.watch();
          return _buildBody(cubit);
        },
      ),
    );
  }

  SingleChildScrollView _buildBody(HomeCubit cubit) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _setTransform(
            x: 100.0,
            child: _buildTextButtonWidget(),
          ),
          _setTransform(child: _showChangingPasswordFields(), y: -90.0),
        ],
      ),
    );
  }

  // TextButton
  Visibility _buildTextButtonWidget() {
    return Visibility(
      visible: !_isShow,
      child: TextButtonWidget(
        onPressed: _onPressed,
        label: LocaleKeys.edit.tr(),
      ),
    );
  }

  // Transform
  Transform _setTransform(
          {double x = 0.0, double y = -140.0, required Widget child}) =>
      Transform.translate(
        offset: Offset(getWidth(x), getHeight(y)),
        child: child,
      );

  // Password fields
  Visibility _showChangingPasswordFields() => Visibility(
        visible: _isShow,
        child: Padding(
          padding: MyEdgeInsets.symmetric(h: 30.0),
          child: MySizedBox(
            height: 322.0,
            child: Form(
              child: Column(
                children: [
                  TextFormFieldWidget(
                    hint: LocaleKeys.lastPassword.tr(),
                  ),
                  MySizedBox(height: 20.0),
                  TextFormFieldWidget(
                    hint: LocaleKeys.newPassword.tr(),
                  ),
                  MySizedBox(height: 20.0),
                  TextFormFieldWidget(
                    hint: LocaleKeys.confirmPassword.tr(),
                  ),
                  const Spacer(),
                  ElevatedButtonWidget(
                    onPressed: _onPressed,
                    label: LocaleKeys.save.tr(),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  void _onPressed() {
    setState(() {
      _isShow = !_isShow;
    });
  }
}
