import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieApi {
  // final String _API_KEY = '5f591c41f4efbb8d272b60244907e9bd';

  Future<List<dynamic>> search(String dt) async {
    String site =
        'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=5f591c41f4efbb8d272b60244907e9bd&targetDt=$dt';
    print(site);
    var response = await http.get(Uri.parse(site));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var movies =
      //boxOfficeResult.dailyBoxOfficeList
          jsonDecode(response.body)['boxOfficeResult']['dailyBoxOfficeList'] as List<dynamic>;
      return movies;
    } else {
      return []; 
    }
  }
}
