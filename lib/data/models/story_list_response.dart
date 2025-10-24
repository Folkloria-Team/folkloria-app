import 'package:folkloria/data/models/story.dart';

class StoryListResponse {
  final String message;
  final List<Story> data;

  StoryListResponse({required this.message, required this.data});

  factory StoryListResponse.fromJson(Map<String, dynamic> json) {
    return StoryListResponse(
      message: json["message"],
      data: json["data"] != null
          ? List<Story>.from(json["data"].map((x) => Story.fromJson(x)))
          : <Story>[],
    );
  }
}
