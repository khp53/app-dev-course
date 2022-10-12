import 'package:news_app/services/rest_services.dart';

class NewsService {
  RestService service = RestService();

  getAllTechCrunchNews() async {
    final Map<String, dynamic> map = await service.get();
    return map;
  }
}
