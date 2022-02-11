import 'package:flutter_test/flutter_test.dart';
import 'package:mobileapp/services/hotel_service.dart';

void main() async {
  test('fecht hotels by city test', () async {
    var result = await HotelService().fetchHotelsByCity('toshkent');

    expect(result, 'OK');
  });

  test('fecht hotels by category test', () async {
    var result = await HotelService()
        .fetchHotelsByCategory('1991edea-7d4a-49fb-b627-79b777cf54ae');

    expect(result, 'OK');
  });

  test('fecht categories od hotel test', () async {
    var result = await HotelService().fetchCategoriesOfHotel();

    expect(result, 'Saccesful !');
  });

  test('add comment of hotel test', () async {
    var result = await HotelService().addHotelComment(
      commentText: "hotel comment",
      hotelId: "4d45cacb-5a4b-47dc-8cd8-51fe4cfd2c25",
    );

    expect(result, true);
  });

  test('add rating of hotel test', () async {
    var result = await HotelService().addHotelRating(
      value: 5,
      hotelId: "4d45cacb-5a4b-47dc-8cd8-51fe4cfd2c25",
    );
    expect(result, true);
  });

  test('fetch hotel comments test', () async {
    var result = await HotelService()
        .fetchCommentsOfHotel("4d45cacb-5a4b-47dc-8cd8-51fe4cfd2c25");

    expect(result, 'OK');
  });

  test('delete hotel by id test', () async {
    var result = await HotelService()
        .deleteHotel("4d45cacb-5a4b-47dc-8cd8-51fe4cfd2c25");

    expect(result, 'NOT_DELETED!');
  });
}
