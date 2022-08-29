import 'package:dio/dio.dart';

import '../screen/appIntro/models/rum_model.dart';

class ApiProvider {
  final Dio _dio = Dio();

  final String _url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php';

  Future<RumModel> fetchModelList(String query) async {
    try {
      Response response = await _dio.get(_url, queryParameters: {"s": query});
      return RumModel.fromJson(response.data);
    } on DioError catch (error) {
      print(error.message);
      print(error.response?.statusCode);
      return RumModel.withError(error.message);
    }
  }
}
