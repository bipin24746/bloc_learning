import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:bloc_learning/model/posts_model.dart';
class PostRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) {
          return PostModel(
            postId: e['postId'],
            email: e['email'] as String,  // Corrected from 'title' to 'email'
            body: e['body'] as String,
          );
        }).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Error while fetching data: $e');
    }
  }
}
