import 'package:appnation_flutter_test/spacex/model/spacex_model.dart';
import 'package:appnation_flutter_test/spacex/service/spacex_service.dart';
import 'package:appnation_flutter_test/spacex/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SpaceXService spaceXService;
  late Dio dio;
  late SpaceXModel spaceXModel;

  setUp(() async {
    dio = Dio(BaseOptions(baseUrl: Constants.lastFlightEndPoint));
    spaceXService = SpaceXService(dio);
    spaceXModel = await spaceXService.getLastFlight() ?? SpaceXModel();
  });

  group('should return proper results', () {
    test('should get a result', () async {
      // arrange
      final json = await dio.get(Constants.lastFlightEndPoint);
      // act
      SpaceXModel model = SpaceXModel.fromJson(json.data);
      // assert
      expect(model, isA<SpaceXModel>());
    });

    test('should get the same result', () async {
      // arrange
      final json = await dio.get(Constants.lastFlightEndPoint);
      // act
      SpaceXModel model = SpaceXModel.fromJson(json.data);
      // assert
      expect(spaceXModel.id, model.id);
    });
  });
}
