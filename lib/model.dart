import 'dart:convert';

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String userModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  String name;
  String title;

  PostModel({required this.name,required this.title});


  factory PostModel.fromJson(Map<String,dynamic>json) => PostModel(
    name:json["title"],
    title:json["body"]
  );

  Map<String, dynamic> toJson() => {

    "title":name,
    "body":title

  };
}


