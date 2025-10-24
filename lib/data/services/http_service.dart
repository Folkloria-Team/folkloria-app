import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class HttpService {
  final http.Client _client;

  HttpService({http.Client? client}) : _client = client ?? http.Client();

  Future<String> getDataFromUrl(String url) async {
    try {
      final response = await _client.get(Uri.parse(url));
      return response.body;
    } on SocketException {
      throw const HttpException(
        'Tidak ada koneksi internet. Periksa koneksi Anda dan coba lagi.',
      );
    } catch (e) {
      throw const HttpException('Gagal mengambil data. Silakan coba lagi.');
    }
  }

  Future<Uint8List> getByteArrayFromUrl(String url) async {
    try {
      final response = await _client.get(Uri.parse(url));
      return response.bodyBytes;
    } on SocketException {
      throw const HttpException(
        'Tidak ada koneksi internet. Periksa koneksi Anda dan coba lagi.',
      );
    } catch (e) {
      throw const HttpException('Gagal mengunduh file. Silakan coba lagi.');
    }
  }

  Future<String> downloadAndSaveFile(String url, String fileName) async {
    try {
      final bytes = await getByteArrayFromUrl(url);

      final Directory directory = await getApplicationDocumentsDirectory();
      final String filePath = '${directory.path}/$fileName';
      final File file = File(filePath);
      await file.writeAsBytes(bytes);
      return filePath;
    } catch (e) {
      throw const HttpException(
        'Gagal menyimpan file. Periksa ruang penyimpanan Anda.',
      );
    }
  }
}
