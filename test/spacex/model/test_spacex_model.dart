import 'dart:convert';

import 'package:appnation_flutter_test/spacex/model/spacex_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  group('should return desired SpaceXModels', () {
    test('should return basic SpaceXModel', () async {
      // arrange
      final SpaceXModel _onFlyModel = SpaceXModel();
      // act

      // assert
      expect(_onFlyModel, isA<SpaceXModel>());
    });

    test('should return the first mock', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('mockModel0.json'));
      // act
      final result = SpaceXModel.fromJson(jsonMap);
      // assert
      expect(result, isA<SpaceXModel>());
      expect(jsonMap, result.toJson());
    });

    test('should return the second mock', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('mockModel1.json'));
      // act
      final result = SpaceXModel.fromJson(jsonMap);
      // assert
      expect(result, isA<SpaceXModel>());
      expect(jsonMap, result.toJson());
    });

    test('should return the third mock', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('mockModel2.json'));
      // act
      final result = SpaceXModel.fromJson(jsonMap);
      // assert
      expect(result, isA<SpaceXModel>());
      expect(jsonMap, result.toJson());
    });

    test('should return the fourth mock', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('mockModel3.json'));
      // act
      final result = SpaceXModel.fromJson(jsonMap);
      // assert
      expect(result, isA<SpaceXModel>());
      expect(jsonMap, result.toJson());
    });
  });
}
