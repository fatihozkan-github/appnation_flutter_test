import 'dart:io';

import 'package:appnation_flutter_test/spacex/model/spacex_model.dart';
import 'package:dio/dio.dart';

import 'ISpaceXService.dart';

class SpaceXService extends ISpaceXService {
  SpaceXService(Dio dio) : super(dio);

  @override
  Future<SpaceXModel?> getLastFlight() async {
    final response = await dio.get(endPoint);

    if (response.statusCode == HttpStatus.ok) {
      return SpaceXModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
