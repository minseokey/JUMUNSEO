import 'package:freezed_annotation/freezed_annotation.dart';

part 'dilemma_home_model.g.dart';
part 'dilemma_home_model.freezed.dart';

@freezed
class DilemmaHomeModel with _$DilemmaHomeModel {
  factory DilemmaHomeModel({
    int? id,
    required String contents,
    required String startTime,
    required String endTime,
  }) = _DilemmaHomeModel;

  factory DilemmaHomeModel.fromJson(Map<String, dynamic> json) =>
      _$DilemmaHomeModelFromJson(json);
}
