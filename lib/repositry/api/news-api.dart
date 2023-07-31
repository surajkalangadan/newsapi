import 'dart:convert';
import 'package:http/http.dart';
import '../modelclass/Newsmodel.dart';
import 'api_client.dart';





class Newsapi {
  ApiClient apiClient = ApiClient();


  Future<Newsmodel> getnewsmodel() async {
    String trendingpath = 'https://google-news13.p.rapidapi.com/latest?lr=en-US';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Newsmodel.fromJson(jsonDecode(response.body));
  }
}