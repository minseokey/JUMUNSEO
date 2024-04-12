import 'package:freezed_annotation/freezed_annotation.dart';

part 'dilemma_chat_user_model.g.dart';
part 'dilemma_chat_user_model.freezed.dart';

@freezed
class DilemmaChatUserModel with _$DilemmaChatUserModel {
  factory DilemmaChatUserModel({
    required String userId,
    required String userNickname,
    String? profileImage,
  }) = _DilemmaChatUserModel;

  factory DilemmaChatUserModel.fromJson(Map<String, dynamic> json) =>
      _$DilemmaChatUserModelFromJson(json);
}
