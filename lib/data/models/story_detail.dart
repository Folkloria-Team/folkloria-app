class StoryDetail {
  final String id;
  final String provinceId;
  final String title;
  final String sinopsis;
  final String content;
  final String cover;
  final String island;

  StoryDetail({
    required this.id,
    required this.provinceId,
    required this.title,
    required this.sinopsis,
    required this.content,
    required this.cover,
    required this.island,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'provinceId': provinceId,
      'title': title,
      'sinopsis': sinopsis,
      'content': content,
      'cover': cover,
      'island': island,
    };
  }

  factory StoryDetail.fromJson(Map<String, dynamic> json) {
    return StoryDetail(
      id: json["id"],
      provinceId: json["province_id"],
      title: json["title"],
      sinopsis: json["sinopsis"],
      content: json["content"],
      cover: json["cover"],
      island: json["island"],
    );
  }
}
