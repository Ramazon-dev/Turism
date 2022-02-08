import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/profile_cubit/profile_cubit.dart';
import 'package:mobileapp/screens/auth/sign_in/sign_in_page.dart';
import 'package:mobileapp/widgets/elevated_button_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          ProfileCubit cubit = context.watch();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage())),
                child: ElevatedButtonWidget(
                  text: "Sign In Page",
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
