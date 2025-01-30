import 'package:bloc_learning/model/post/posts_model.dart';
import 'package:bloc_learning/utils/post_enums/enums.dart';
import 'package:equatable/equatable.dart';

class PostStates extends Equatable {

  //initial states of PostStates
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;
  const PostStates({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.message = '',
  });

  PostStates copyWith({PostStatus? poststatus,List<PostModel>? postList,String?  message }){
    return PostStates(
    postList: postList ?? this.postList,
        postStatus: poststatus ?? this.postStatus,
    message: message ?? this.message

    );
}
  @override
  // TODO: implement props
  List<Object?> get props => [postStatus, postStatus];
}
