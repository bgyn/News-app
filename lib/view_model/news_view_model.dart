import 'package:news_app/model/category_news_model.dart';
import 'package:news_app/model/news_headline_model.dart';
import 'package:news_app/repository/news_repository.dart';

class NewsHeadlineViewModel {
  final _rep = NewsHeadlineRepository();

  //news healine
  Future<NewsHeadlineModel> fetchNewsHeadline(String source) async {
    final response = await _rep.fetchNewsHeadline(source);
    return response;
  }

  //news category
  Future<CategoryNewsModel> fetchNewsCategory(String query) async {
    final response = await _rep.fetchCategoryNews(query);
    return response;
  }
}
