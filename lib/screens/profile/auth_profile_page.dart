
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/cards/profile_info_card.dart';

class ProfileAuthPage extends StatefulWidget {
  const ProfileAuthPage({Key? key}) : super(key: key);

  @override
  State<ProfileAuthPage> createState() => _ProfileAuthPageState();
}

// TODO Vaqtincha StatefulWidget'da qilindi. Cubitga ulash kerak.
// todo bosin aka gazini men sizga iwonaman
// todo topinchi man kimman

class _ProfileAuthPageState extends State<ProfileAuthPage> {
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileAppBar(height: 274.0),
          _setTransform(child: const ProfileInfoCard()),
          _setTransform(
            x: 100.0,
            child: _buildTextButtonWidget(),
          ),
          _setTransform(child: _showChangingPasswordFields(), y: -90.0),
        ],
      ),
    );
  }

  Visibility _buildTextButtonWidget() {
    return Visibility(
      visible: !_isShow,
      child: TextButtonWidget(
        onPressed: _onPressed,
        label: 'Изменить пароль?',
      ),
    );
  }

  Transform _setTransform(
          {double x = 0.0, double y = -140.0, required Widget child}) =>
      Transform.translate(
        offset: Offset(getWidth(x), getHeight(y)),
        child: child,
      );

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
