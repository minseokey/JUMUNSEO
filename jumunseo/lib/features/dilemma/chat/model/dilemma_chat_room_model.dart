import 'package:freezed_annotation/freezed_annotation.dart';

part 'dilemma_chat_room_model.g.dart';
part 'dilemma_chat_room_model.freezed.dart';

@freezed
class DilemmaChatRoomModel with _$DilemmaChatRoomModel {
  factory DilemmaChatRoomModel({
    required String id,
    required String title,
    required String description,
    required String leftSideOption,
    required String rightSideOption,
    required int leftSideCount,
    required int rightSideCount,
    required DateTime createdTime,
  }) = _DilemmaChatRoomModel;

  factory DilemmaChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$DilemmaChatRoomModelFromJson(json);
}
