import 'package:flutter/material.dart';
import 'package:mobileapp/services/auth_services.dart';
class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            AuthServices.signIn('bahromjon@gmail.com.uz.com', 'VjkjkJ123s!').then((value) {
              print(value);
            });
          },
          child: Text('Hello'),
        ),
      ),
    );
  }
}
