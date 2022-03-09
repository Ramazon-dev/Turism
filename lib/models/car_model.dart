
class CarModel {
  String? _model;
  int? _price;
  double? _rating;
  String? _img;
  String? _description;

  CarModel(
      {String? model,
      int? price,
      double? rating,
      String? img,
      String? description}) {
    if (model != null) {
      _model = model;
    }
    if (price != null) {
      _price = price;
    }
    if (rating != null) {
      _rating = rating;
    }
    if (img != null) {
      _img = img;
    }
    if (description != null) {
      _description = description;
    }
  }

  String get model => _model!;

  int get price => _price!;

  double get rating => _rating!;

  String get img => _img!;

  String get description => _description!;

  CarModel.fromJson(Map<String, dynamic> json) {
    _model = json['model'];
    _price = json['price'];
    _rating = json['rating'];
    _img = json['img'];
    _description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['model'] = _model;
    data['price'] = _price;
    data['rating'] = _rating;
    data['img'] = _img;
    data['description'] = _description;
    return data;
  }
}
