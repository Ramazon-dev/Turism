import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/profile_cubit/profile_cubit.dart';
import 'package:mobileapp/screens/auth/sign_in/sign_in_page.dart';
import 'package:mobileapp/screens/profile/auth_profile_page.dart';
import 'package:mobileapp/services/auth_services.dart';
import 'package:mobileapp/widgets/elevated_button_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final String token = GetStorage().read('token') ?? '';
  @override
  Widget build(BuildContext context) {
    print('Token: $token');
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          ProfileCubit cubit = context.watch();
          return token.isNotEmpty ? const ProfileAuthPage(): _unAuthBody(context);
        },
      ),
    );
  }



  Column _unAuthBody(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButtonWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileAuthPage(),
                  ),
                );
              },
              label: "Sign In Page",
            ),
            ElevatedButtonWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInPage(),
                  ),
                );
              },
              label: "My Sign In Page",
            ),

            TextButtonWidget(onPressed: (){
              GetStorage().remove('token');
              Navigator.push(context, MaterialPageRoute(builder: ((context) => SignInPage())));
            }, label: "Log Out")
          ],
        );
  }
}
