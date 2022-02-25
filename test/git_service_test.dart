import 'package:flutter_test/flutter_test.dart';
import 'package:mobileapp/models/git_model.dart';
import 'package:mobileapp/models/hotel_model.dart';
import 'package:mobileapp/services/git_service.dart';
import 'package:mobileapp/services/hotel_service.dart';
import 'package:mobileapp/services/image_pick_service.dart';

void main() async {

  test('fetch hotel commnets test', () async {
    var result = await HotelService()
        .fetchHotelComments(hotelId: "2a2ffc5e-112b-4a4a-909a-066202621acc");

    expect(result['message'], 'OK');
  });



  test('add rating to hotel test', () async {
    var result = await HotelService().addRatingToHotel(
      rate: '5',
      hotelId: "2a2ffc5e-112b-4a4a-909a-066202621acc",
    );
    expect(result, "SIZ_REYTING_BELGILABO'GANSIZ!");
  });

  test('add comment to hotel test', () async {
    var result = await HotelService().addCommentToHotel(
      commentText: 'comment text test',
      hotelId: "2a2ffc5e-112b-4a4a-909a-066202621acc",
    );
    expect(result, "CREATED");
  });

  test('delete hotel by id test', () async {
    var result = await HotelService()
        .deleteHotel(hotelId: '9d2226a2-78c8-46eb-9f52-e0beceaa0897');

    expect(result, "DELETED");
  });

  test('update hotel data test', () async {
    var result = await HotelService().updateHotelData(Hotel(
        name: 'edited name',
        informUz: 'edited inform',
        informRu: 'edited inform',
        informEn: 'edited inform',
        site: 'edited site',
        city: 'andijan',
        karta: 'map google',
        tell: ['98567153'],
        id: "05c5a595-1a39-4b7e-8ffe-5299e1d2a25e",
        categoryId: "1991edea-7d4a-49fb-b627-79b777cf54ae"));

    expect(result, 'UPDATED');
  });
}
