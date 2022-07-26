import 'package:desafio_apirest/app/data/datasoucer/http_client_interface.dart';
import 'package:dio/dio.dart';

class DioClient implements IHttpClient {
  final dio = Dio();

  @override
  Future get(String url) async {
    final response = await dio.get(url);

    return response.data;
  }
}
