import 'package:image_picker/image_picker.dart';
import 'package:jumunseo/features/community/model/comment.dart';

class Post {
  final String? id;
  final String? title;
  final String? contents;
  final DateTime? datetime;
  final String? boardId;
  final String? userId;
  final List<XFile>? images;
  final List<Comment>? comments;

  Post({
    this.id,
    this.title,
    this.contents,
    this.datetime,
    this.boardId,
    this.userId,
    this.images,
    this.comments
  });
}
