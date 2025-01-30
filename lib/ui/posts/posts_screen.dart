import 'package:bloc_learning/bloc/posts/posts_bloc.dart';
import 'package:bloc_learning/bloc/posts/posts_event.dart';
import 'package:bloc_learning/bloc/posts/posts_state.dart';
import 'package:bloc_learning/utils/post_enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState(){
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APi"),
      ),
      body: BlocBuilder<PostBloc, PostStates>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return CircularProgressIndicator();
          case PostStatus.failure:
            return Text(state.message.toString());
          case PostStatus.success:
            return ListView.builder(
                itemCount: state.postList.length,
                itemBuilder: (context, index) {
                  final item = state.postList[index];
                  return ListTile(
                    title: Text(item.email.toString()),
                    subtitle: Text(item.body.toString()),
                  );
                });
        }
      }),
    );
  }
}
