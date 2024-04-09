import 'package:freezed_annotation/freezed_annotation.dart';

part 'dilemma_chat_model.g.dart';
part 'dilemma_chat_model.freezed.dart';

enum ChatType { text, image }

@freezed
class DilemmaChatModel with _$DilemmaChatModel {
  factory DilemmaChatModel(
      {String? id,
      required DateTime sendTime,
      required String userId,
      required String userName,
      required ChatType chatType,
      String? message}) = _DilemmaChatModel;

  factory DilemmaChatModel.fromJson(Map<String, dynamic> json) =>
      _$DilemmaChatModelFromJson(json);
}
