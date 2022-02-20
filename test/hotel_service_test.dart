import 'package:flutter_test/flutter_test.dart';
import 'package:mobileapp/models/hotel_model.dart';
import 'package:mobileapp/services/hotel_service.dart';
import 'package:mobileapp/services/image_pick_service.dart';

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

  test('fecht categories of hotel test', () async {
    var result = await HotelService().fetchCategoriesOfHotel();

    expect(result, 'Saccesful !');
  });

  test('fetch hotel commnets test', () async {
    var result = await HotelService()
        .fetchHotelComments(hotelId: "2a2ffc5e-112b-4a4a-909a-066202621acc");

        expect(result['message'], 'OK');
  });

  test('create hotel test', () async {
    var result = await HotelService.createNewHotel(
      Hotel(
          name: 'hotel test',
          city: 'tashkent',
          informEn: 'inform en',
          informUz: 'inform uz',
          informRu: 'inform ru',
          karta: 'http://dsafa',
          media: ImageChooser.imageList,
          tell: ['9999'],
          categoryId: '1991edea-7d4a-49fb-b627-79b777cf54ae'),
    );

    expect(result, true);
  });

  test('add rating to hotel test', () async {
    var result = await HotelService().addRatingToHotel(
      rate:'5',
      hotelId: "2a2ffc5e-112b-4a4a-909a-066202621acc",
    );
    expect(result, "SIZ_REYTING_BELGILABO'GANSIZ!");
  });

  test('add comment to hotel test', () async {
    var result = await HotelService().addCommentToHotel(
      commentText:'comment text test',
      hotelId: "2a2ffc5e-112b-4a4a-909a-066202621acc",
    );
    expect(result, "CREATED");
  });

  test('delete hotel by id test', () async {
    var result = await HotelService().deleteHotel(hotelId: '9d2226a2-78c8-46eb-9f52-e0beceaa0897');
    
    expect(result, "DELETED");
  });
}
