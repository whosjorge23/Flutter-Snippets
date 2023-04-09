Future<User> getUser() async {
  try {
    final userResponse = await http.get(Uri.parse('https://api.example.com/user'));

    if (userResponse.statusCode == 200) {
      final userJson = json.decode(userResponse.body);
      final user = User.fromJson(userJson);

      final postsResponse = await http.get(Uri.parse('https://api.example.com/posts?userId=${user.id}'));
      if (postsResponse.statusCode == 200) {
        final postsJson = json.decode(postsResponse.body);
        final posts = postsJson.map((post) => Post.fromJson(post)).toList();

        user.posts = posts;

        return user;
      } else {
        throw Exception('Failed to load posts');
      }
    } else {
      throw Exception('Failed to load user');
    }
  } catch (e) {
    throw Exception('Failed to load user and posts: $e');
  }
}
