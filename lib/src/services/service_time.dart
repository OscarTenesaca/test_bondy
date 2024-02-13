import 'package:dio/dio.dart';
import 'package:test_bondy/src/global/environment.dart';

class ServieTimer {
  //? All story

  final _url = Environment.url;
  final _key = Environment.timeApikey;
  final _dio = Dio();

  Future<Map?> timeLocation(String location) async {
    try {
      DateTime now = DateTime.now();
      String _day =
          '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
      final String link =
          '$_url/rest/services/timeline/$location,Spain/$_day/$_day?key=$_key';
      final response = await _dio.get(link);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return {};
      }
    } catch (e) {
      return {};
    }
  }
}
