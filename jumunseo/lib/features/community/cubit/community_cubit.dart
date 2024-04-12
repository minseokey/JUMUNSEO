import 'package:bloc/bloc.dart';
import '../model/post.dart';
import '../state/community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  CommunityCubit() : super(CommunityState());

  void setPost(Post post) {
    state.post = post;
  }

  Post getPost() {
    return state.post;
  }

  List<Post> getPosts() {
    return state.posts;
  }
}