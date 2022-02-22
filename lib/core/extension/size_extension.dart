import 'package:mobileapp/core/components/exporting_packages.dart';

extension SizeExtension on num {
  double get w => getWidth(this * 1.0);

  double get h => getHeight(this * 1.0);
}
