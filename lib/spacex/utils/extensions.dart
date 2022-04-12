import 'constants.dart';
import 'enums.dart';

extension ISpaceXServicePathExtension on ISpaceXServicePath {
  String get rawValue {
    switch (this) {
      case ISpaceXServicePath.LAST:
        return Constants.lastFlightEndPoint;
      default:
        return '';
    }
  }
}
