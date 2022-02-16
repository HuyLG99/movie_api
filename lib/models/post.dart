class Post {
  late int userId;
  late int id;
  late String title;
  late String body;

  //Null safety: dart is not clever enough to understand that you have initialized the value to the variable afterwords.
  //Late Therefore, to future initialization or late initialization value to variable you can make use of “late modifier”,
  // that tells compiler that value will be initialized later on.
  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
//Map
  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
