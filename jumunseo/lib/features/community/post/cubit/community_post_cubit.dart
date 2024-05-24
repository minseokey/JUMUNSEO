import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'community_post_state.dart';

class CommunityPostCubit extends Cubit<CommunityPostState> {
  // final CommunityPostRepository repository;

  CommunityPostCubit(
      // this.repository
      )
      : super(CommunityPostInitial());

  // Future<void> createPost(CommunityPostModel post) async {
  //   emit(CommunityPostLoading());
  //   try {
  //     await repository.createPost(post);
  //     emit(CommunityPostSuccess());
  //   } catch (e) {
  //     emit(CommunityPostFailure(e.toString()));
  //   }
  // }

  // Future<void> updatePost(CommunityPostModel post) async {
  //   emit(CommunityPostLoading());
  //   try {
  //     await repository.updatePost(post);
  //     emit(CommunityPostSuccess());
  //   } catch (e) {
  //     emit(CommunityPostFailure(e.toString()));
  //   }
  // }

  // Future<void> deletePost(String id) async {
  //   emit(CommunityPostLoading());
  //   try {
  //     await repository.deletePost(id);
  //     emit(CommunityPostSuccess());
  //   } catch (e) {
  //     emit(CommunityPostFailure(e.toString()));
  //   }
  // }

  // Future<void> getPosts() async {
  //   emit(CommunityPostLoading());
  //   try {
  //     final posts = await repository.getPosts();
  //     emit(CommunityPostLoaded(posts));
  //   } catch (e) {
  //     emit(CommunityPostFailure(e.toString()));
  //   }
  // }
}
