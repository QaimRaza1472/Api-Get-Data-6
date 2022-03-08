// To parse this JSON data, do
//
//     final albumModel = albumModelFromJson(jsonString);

import 'dart:convert';

List<AlbumModel> albumModelFromJson(String str) => List<AlbumModel>.from(json.decode(str).map((x) => AlbumModel.fromJson(x)));

String albumModelToJson(List<AlbumModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumModel {
  AlbumModel({
    required this.albumId,
   required this.id,
    required this.title,
   required this.url,
   required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
