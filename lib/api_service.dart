import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post.dart';

class ApiService {
  Future<List<Post>> fetchPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url,
      headers: {
        'Accept': 'application/json', //Yeu cau server tra ve du lieu duoi dang JSON
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      print('Failed to load posts: ${response.body}');
      throw Exception('Failed to load posts from API');
    }
  }
}