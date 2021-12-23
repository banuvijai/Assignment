
class UserDetailResponse{
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  UserDetailResponse({required this.albumId, required this.id,
    required this.title, required this.url, required this.thumbnailUrl});

  UserDetailResponse.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {

    ///changed Map<String,dynamic>{} to {}
    final Map<String, dynamic> data = {};

    ///changed this.var to var
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}