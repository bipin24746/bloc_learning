import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/posts/posts_event.dart';
import 'package:bloc_learning/bloc/posts/posts_state.dart';
import 'package:bloc_learning/bloc/repository/post/post_repository.dart';
import 'package:bloc_learning/utils/post_enums/enums.dart';

class PostBloc extends Bloc<PostEvent, PostStates> {
  PostRepository postRepository = PostRepository();
  PostBloc() : super(const PostStates()) {
    on<PostFetched>(fetchPostApi);
  }
  void fetchPostApi(PostFetched Event, Emitter<PostStates> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
        poststatus: PostStatus.success,
        message: 'seccessful',
        postList: value,
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          poststatus: PostStatus.failure, message: error.toString()));
    });
  }
}
