import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/details/places_details.dart';
import 'package:mobileapp/screens/details/hotel_details_page.dart';
import 'package:mobileapp/screens/details/transport_details.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({Key? key}) : super(key: key);
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getHeight(20)),
      width: getHeight(115),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              _makePhoneCall('+998946581098');
            },
            child: Container(
              padding: EdgeInsets.all(getWidth(13)),
              height: getWidth(50),
              width: getWidth(50),
              decoration: BoxDecoration(
                color: AppColors.greyPrice,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    getWidth(5),
                  ),
                ),
              ),
              child: SvgPicture.asset('assets/icons/call.svg'),
            ),
          ),
          InkWell(
            onTap: () async {
              try {
                var headers = {'cxfzgde': 'toshkent'};
                var request = http.Request(
                    'GET',
                    Uri.parse(
                        'https://ucharteam-tourism.herokuapp.com/v1/api/restaurant'));
                request.body = '''''';
                request.headers.addAll(headers);

                http.StreamedResponse response = await request.send();

                if (response.statusCode == 200) {
                  print(await response.stream.bytesToString());
                } else {
                  print(response.reasonPhrase);
                }
              } catch (e) {
                print(e.toString());
              }

              // Response res = await Dio().get(
              //     'https://ucharteam-tourism.herokuapp.com/v1/api/restaurant',
              //     options: Options(headers: {'h': 'toshkent'}));
              // print(res.data['message']);
              // var js = (jsonDecode(res.data['data'].toString()));
              // print(js.toString());
              // js.forEach((element) {
              //   print(element.toString());
              // });

              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => PlacesDedailsPage(
              //               imageurl:
              //                   'https://media.istockphoto.com/photos/generic-modern-suv-car-in-concrete-garage-picture-id1307086567?b=1&k=20&m=1307086567&s=170667a&w=0&h=NjcM6LIOkmfhyqH-zrbFU7pHCPxIABvNhWaOElm_P-E=',
              //               name: 'Kaptiva 5',
              //               price: 150,
              //               rating: 4,
              //               users: 24,
              //               site: 'https://rohat.uz/',
              //               karta: 'https://goo.gl/maps/9ReXLjp8vwToQ3mt8',
              //             )));
            },
            child: Container(
              padding: EdgeInsets.all(getWidth(13)),
              height: getWidth(50),
              width: getWidth(50),
              decoration: BoxDecoration(
                color: AppColors.greyPrice,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    getWidth(5),
                  ),
                ),
              ),
              child: SvgPicture.asset('assets/icons/comment.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
