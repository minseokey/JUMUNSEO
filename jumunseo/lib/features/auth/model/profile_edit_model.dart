import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_edit_model.g.dart';
part 'profile_edit_model.freezed.dart';

@freezed
class ProfileEditModel with _$ProfileEditModel{
  factory ProfileEditModel(
      {required String name,
      required String password}) = _ProfileEditModel;

  factory ProfileEditModel.fromJson(Map<String, dynamic> json) =>
    _$ProfileEditModelFromJson(json);
}