import 'dart:convert';
import 'dart:io';

import 'package:folkloria/data/models/book_detail_response.dart';
import 'package:folkloria/data/models/book_list_response.dart';
import 'package:folkloria/data/models/book_search_response.dart';
import 'package:folkloria/data/models/story_detail_response.dart';
import 'package:folkloria/data/models/story_list_response.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String _baseUrl = "https://restaurant-api.dicoding.dev";
  static const String _baseUrlFix = "https://bekup-api.radifa.my.id/api";

  Future<StoryListResponse> getStoryList() async {
    try {
      final response = await http.get(Uri.parse("$_baseUrlFix/story"));

      print(response);

      if (response.statusCode == 200) {
        return StoryListResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
          'Gagal memuat daftar cerita: ${response.statusCode} ${response.reasonPhrase}',
        );
      }
    } on SocketException {
      throw Exception(
        'Tidak ada koneksi internet. Periksa koneksi Anda dan coba lagi.',
      );
    } on FormatException {
      throw Exception('Data yang diterima tidak valid. Silakan coba lagi.');
    } catch (e) {
      throw Exception('Terjadi kesalahan. Silakan coba lagi nanti : $e');
    }
  }

  Future<StoryDetailResponse> getStoryDetail(String id) async {
    try {
      final response = await http.get(Uri.parse("$_baseUrlFix/story/$id"));

      if (response.statusCode == 200) {
        return StoryDetailResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
          'Gagal memuat detail restoran: ${response.statusCode} ${response.reasonPhrase}',
        );
      }
    } on SocketException {
      throw Exception(
        'Tidak ada koneksi internet. Periksa koneksi Anda dan coba lagi.',
      );
    } on FormatException {
      throw Exception('Data yang diterima tidak valid. Silakan coba lagi.');
    } catch (e) {
      throw Exception('Terjadi kesalahan. Silakan coba lagi nanti : $e');
    }
  }

  Future<BookListResponse> getBookList() async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl/list"));

      if (response.statusCode == 200) {
        return BookListResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
          'Gagal memuat daftar restoran: ${response.statusCode} ${response.reasonPhrase}',
        );
      }
    } on SocketException {
      throw Exception(
        'Tidak ada koneksi internet. Periksa koneksi Anda dan coba lagi.',
      );
    } on FormatException {
      throw Exception('Data yang diterima tidak valid. Silakan coba lagi.');
    } catch (e) {
      throw Exception('Terjadi kesalahan. Silakan coba lagi nanti : $e');
    }
  }

  Future<BookDetailResponse> getBookDetail(String id) async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));

      if (response.statusCode == 200) {
        return BookDetailResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
          'Gagal memuat detail restoran: ${response.statusCode} ${response.reasonPhrase}',
        );
      }
    } on SocketException {
      throw Exception(
        'Tidak ada koneksi internet. Periksa koneksi Anda dan coba lagi.',
      );
    } on FormatException {
      throw Exception('Data yang diterima tidak valid. Silakan coba lagi.');
    } catch (e) {
      throw Exception('Terjadi kesalahan. Silakan coba lagi nanti : $e');
    }
  }

  Future<BookSearchResponse> searchBooks(String query) async {
    try {
      final response = await http.get(
        Uri.parse("$_baseUrl/search?q=${Uri.encodeComponent(query)}"),
      );

      if (response.statusCode == 200) {
        return BookSearchResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
          'Gagal mencari restoran: ${response.statusCode} ${response.reasonPhrase}',
        );
      }
    } on SocketException {
      throw Exception(
        'Tidak ada koneksi internet. Periksa koneksi Anda dan coba lagi.',
      );
    } on FormatException {
      throw Exception('Data yang diterima tidak valid. Silakan coba lagi.');
    } catch (e) {
      throw Exception('Terjadi kesalahan. Silakan coba lagi nanti : $e');
    }
  }
}
