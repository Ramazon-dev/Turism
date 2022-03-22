import 'package:mobileapp/core/components/exporting_packages.dart';

class MockData {

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
