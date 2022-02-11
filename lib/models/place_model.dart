class PlaceModel {
  String? _name;
  double? _rating;
  String? _site;
  String? _map;
  String? _phone;
  String? _description;
  List<String>? _media;

  PlaceModel(
      {String? name,
        double? rating,
        String? site,
        String? map,
        String? phone,
        String? description,
        List<String>? media}) {
    if (name != null) {
      _name = name;
    }
    if (rating != null) {
      _rating = rating;
    }
    if (site != null) {
      _site = site;
    }
    if (map != null) {
      _map = map;
    }
    if (phone != null) {
      _phone = phone;
    }
    if (description != null) {
      _description = description;
    }
    if (media != null) {
      _media = media;
    }
  }

  String get name => _name!;
  double get rating => _rating!;
  String get site => _site!;
  String get map => _map!;
  String get phone => _phone!;
  String get description => _description!;
  List<String> get media => _media!;

  PlaceModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _rating = json['rating'];
    _site = json['site'];
    _map = json['map'];
    _phone = json['phone'];
    _description = json['description'];
    _media = json['media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['name'] = _name;
    data['rating'] = _rating;
    data['site'] = _site;
    data['map'] = _map;
    data['phone'] = _phone;
    data['description'] = _description;
    data['media'] = _media;
    return data;
  }
}
