import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/physics.dart';

part 'dilemma_chat_event.dart';
part 'dilemma_chat_state.dart';

class DilemmaChatBloc extends Bloc<DilemmaChatEvent, DilemmaChatState> {
  DilemmaChatBloc() : super(DilemmaChatState()) {
    on<DilemmaChatLoaded>((event, emit) {});
  }

  @override
  Stream<DilemmaChatState> mapEventToState(
    DilemmaChatEvent event,
  ) async* {}
}


// class PostBloc extends Bloc<PostEvent, PostState> {
//   PostBloc({required this.httpClient}) : super(const PostState()) {
//     on<PostFetched>(
//       _onPostFetched,
//       transformer: throttleDroppable(throttleDuration),
//     );
//     on<PostAdded>(_onPostAdded,
//         transformer: throttleDroppable(throttleDuration));
//   }

//   final http.Client httpClient;

//   void _onPostAdded(PostAdded event, Emitter<PostState> emit) {
//     emit(state.copyWith(
//       posts: List.of(state.posts)..insert(0, event.post),
//     ));
//   }

//   Future<void> _onPostFetched(
//     PostFetched event,
//     Emitter<PostState> emit,
//   ) async {
//     if (state.hasReachedMax) return;
//     try {
//       if (state.status == PostStatus.initial) {
//         final posts = await _fetchPosts();
//         return emit(
//           state.copyWith(
//             status: PostStatus.success,
//             posts: posts,
//             hasReachedMax: false,
//           ),
//         );
//       }
//       final posts = await _fetchPosts(state.posts.length);
//       posts.isEmpty
//           ? emit(state.copyWith(hasReachedMax: true))
//           : emit(
//               state.copyWith(
//                 status: PostStatus.success,
//                 posts: List.of(state.posts)..addAll(posts),
//                 hasReachedMax: false,
//               ),
//             );
//     } catch (_) {
//       emit(state.copyWith(status: PostStatus.failure));
//     }
//   }

//   Future<List<Post>> _fetchPosts([int startIndex = 0]) async {
//     final response = await httpClient.get(
//       Uri.https(
//         'jsonplaceholder.typicode.com',
//         '/posts',
//         <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
//       ),
//     );
//     if (response.statusCode == 200) {
//       final body = json.decode(response.body) as List;
//       return body.map((dynamic json) {
//         final map = json as Map<String, dynamic>;
//         return Post(
//           id: map['id'] as int,
//           title: map['title'] as String,
//           body: map['body'] as String,
//         );
//       }).toList();
//     }
//     throw Exception('error fetching posts');
//   }
// }
