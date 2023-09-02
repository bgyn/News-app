import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/category_news_model.dart';
import 'package:news_app/model/news_headline_model.dart';

const apiKey = "53636185a44a45139bc4bcf1916fdb97";

class NewsHeadlineRepository {

  //news healine
  Future<NewsHeadlineModel> fetchNewsHeadline(String source) async {
  String url =
      "https://newsapi.org/v2/top-headlines?sources=$source&apiKey=$apiKey";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return NewsHeadlineModel.fromJson(result);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    throw Exception('Error!');
  }

  //news category
  Future<CategoryNewsModel> fetchCategoryNews(String query) async {
  String url =
      "https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return CategoryNewsModel.fromJson(result);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    throw Exception('Error!');
  }
}
