import 'dart:convert';
import 'package:http/http.dart' as http;
/*
import 'package:news/api/ApiConstants.dart';
import 'package:news/api/EndPoints.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourcesResponse.dart';*/
class ApiManager{

  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=caadf514500447b4979aa70562f8b046
  */
 /* static Future<SourcesResponse?>getSources()async{
    Uri url=Uri.https(ApiConstants.baseUrl,EndPoints.sourcesApi,
    {
      'apiKey':ApiConstants.ApiKey
    });
    try{
      var response = await http.get(url);
      var responsebody = response.body;
      var json = jsonDecode(responsebody);
      return SourcesResponse.fromJson(json);
    }
    catch(e){
      throw e;
    }
  }

  static Future<NewsResponse?>getNewsBySourceID(String sourceId)async{
    Uri url=Uri.https(ApiConstants.baseUrl,EndPoints.NewsApi,
    {
      'apiKey':ApiConstants.ApiKey,
      'sources':sourceId
    }
    );
    try{
      var response = await http.get(url);
      var responsebody = response.body;
      var json = jsonDecode(responsebody);
      return NewsResponse.fromJson(json);
    }
    catch(e){
      throw e;
    }
  }*/
}