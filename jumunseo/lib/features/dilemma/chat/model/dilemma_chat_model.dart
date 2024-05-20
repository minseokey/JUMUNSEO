import 'package:freezed_annotation/freezed_annotation.dart';

part 'dilemma_chat_model.g.dart';
part 'dilemma_chat_model.freezed.dart';

enum ChatType { text, image, warning, notice }

@freezed
class DilemmaChatModel with _$DilemmaChatModel {
  factory DilemmaChatModel(
      {int? id,
      required String type,
      required String side,
      required String userEmail,
      required String content}) = _DilemmaChatModel;

  factory DilemmaChatModel.fromJson(Map<String, dynamic> json) =>
      _$DilemmaChatModelFromJson(json);
}
