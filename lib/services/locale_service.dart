import 'package:mobileapp/core/components/exporting_packages.dart';

class LocaleService {
  static String _currentLocale = GetStorage().read('locale') ?? 'uz';

  static Future setLocale(String langCode) async {
    await GetStorage().write('locale', langCode);
    _currentLocale = langCode;
  }

  static String get currentLocale => _currentLocale;
}
