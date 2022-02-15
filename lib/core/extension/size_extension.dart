import 'package:mobileapp/core/components/exporting_packages.dart';

extension SizeExtension on double {
  get w => getWidth(this);

  get h => getHeight(this);
}
