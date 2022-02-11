import 'package:mobileapp/core/components/exporting_packages.dart';

class MockData {
  static CarModel carModel = CarModel(
      model: 'Lamborghini',
      img:
          'https://images.unsplash.com/photo-1511919884226-fd3cad34687c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 150,
      rating: 4.8,
      description:
          'A new, exclusive scented candle by Culti Milano for Automobili Lamborghini seals the collaboration between the two brands and marks a special Valentine’s Day indeed.');

  static List<String> categoryList = [
    'Tashkent',
    'Samarkand',
    'Bukhara',
    'Andijan',
    'Ferghana',
  ];
  static PlaceModel place = PlaceModel(
    name: 'Прыжки с парашютом. Наблюдая за небом',
    rating: 4.8,
    media: ['https://source.unsplash.com/random/4'],
    map: 'https://google.com',
    site: 'https://google.com',
    phone: '+99891 123-45-67',
    description: "Парашю́т — устройство в форме зонта из ткани или другого мягкого материала, к которому стропами прикреплена подвесная система или груз. Служит для замедления движения предмета в воздухе. По конструкции вытяжнойпарашют может быть с пружиной илибез неё."
  );
}
