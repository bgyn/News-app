import 'package:news_app/model/news_headline_model.dart';
import 'package:news_app/repository/news_repository.dart';

class NewsHeadlineViewModel {
  final _rep = NewsHeadlineRepository();
  Future<NewsHeadlineModel> fetchNewsHeadline(String source) async {
    final response = await _rep.fetchNewsHeadline(source);
    return response;
  }
}
