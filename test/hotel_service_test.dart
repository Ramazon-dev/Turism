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
}
