class CurrencyModel {
  String? _title;
  String? _code;
  String? _cbPrice;
  String? _nbuBuyPrice;
  String? _nbuCellPrice;
  String? _date;

  CurrencyModel({
    String? title,
    String? code,
    String? cbPrice,
    String? nbuBuyPrice,
    String? nbuCellPrice,
  }) {
    _title = title;

    _code = code;

    _cbPrice = cbPrice;

    _nbuBuyPrice = nbuBuyPrice;

    _nbuCellPrice = nbuCellPrice;

    _date = date;
  }

  String get title => _title!;

  String get code => _code!;

  String get cbPrice => _cbPrice!;

  String get nbuBuyPrice => _nbuBuyPrice!;

  String get nbuCellPrice => _nbuCellPrice!;

  String get date => _date!;

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _code = json['code'];
    _cbPrice = json['cb_price'];
    _nbuBuyPrice = json['nbu_buy_price'];
    _nbuCellPrice = json['nbu_cell_price'];
    _date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = _title;
    data['code'] = _code;
    data['cb_price'] = _cbPrice;
    data['nbu_buy_price'] = _nbuBuyPrice;
    data['nbu_cell_price'] = _nbuCellPrice;
    data['date'] = _date;
    return data;
  }
}
