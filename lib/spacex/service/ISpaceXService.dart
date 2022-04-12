import 'package:dio/dio.dart';

import '../utils/enums.dart';
import '../utils/extensions.dart';
import '../model/spacex_model.dart';

abstract class ISpaceXService {
  final Dio dio;

  ISpaceXService(this.dio);

  final String endPoint = ISpaceXServicePath.LAST.rawValue;

  Future<SpaceXModel?> getLastFlight();
}
