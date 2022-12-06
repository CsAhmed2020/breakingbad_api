import 'package:breakingbad_api/constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersApi {
  late Dio dio;

  CharactersApi(){
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      return response.data;
    } catch (e) {
      return [];
    }
  }

  //https://breakingbadapi.com/api/quote?author=Jesse+Pinkman

  Future<List<dynamic>> getCharacterQuotes(String charName) async {
    try {
      Response response = await dio.get('quote' , queryParameters: {'author' : charName});
      return response.data;
    } catch (e) {
      return [];
    }
  }

}