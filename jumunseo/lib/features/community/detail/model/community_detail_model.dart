import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_detail_model.freezed.dart';
part 'community_detail_model.g.dart';

@freezed
class CommunityDetailModel with _$CommunityDetailModel {
  factory CommunityDetailModel(
      {required String content,
      required String id,
      required String title,
      required String author,
      required String description,
      required String image,
      required String type,
      String? created_at,
      DateTime? updated_at}) = _CommunityDetailModel;

  factory CommunityDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityDetailModelFromJson(json);
}
