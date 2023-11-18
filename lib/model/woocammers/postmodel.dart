class PostsModel {
  final int? id;
  final Content? content;
  final Title? title;

  PostsModel({

    this.id,
    this.content,
    this.title,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        id: json['id'],
        content: Content.fromJson(json['content']),
        title: Title.fromJson(json['title']),
      );
}

class Content {
  String? rendered;
  bool? protected;
  Content({
    this.rendered,
    this.protected,
  });
  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json['rendered'],
        protected: json['protected'],
      );
  @override
  String toString() {
    return removeAllHtmlTags(rendered);
  }

  String removeAllHtmlTags(String? htmlText) {
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true,
    );

    return htmlText!.replaceAll(exp, '');
  }
}

class Title {
  String? rendered;
  Title({this.rendered});
  factory Title.fromJson(Map<String, dynamic> json) => Title(
        rendered: json['rendered'],
      );
  @override
  String toString() {
    // TODO: implement toString
    return ('$rendered');
  }
}
