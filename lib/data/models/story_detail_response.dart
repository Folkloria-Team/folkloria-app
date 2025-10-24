import 'package:folkloria/data/models/story_detail.dart';

class StoryDetailResponse {
  final String message;
  final StoryDetail data;

  StoryDetailResponse({required this.message, required this.data});

  factory StoryDetailResponse.fromJson(Map<String, dynamic> json) {
    return StoryDetailResponse(
      message: json["message"],
      data: StoryDetail.fromJson(json["data"]),
    );
  }
}
