import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieApi {
  final _API_KEY = '5f591c41f4efbb8d272b60244907e9bd';

  Future<List<dynamic>> srarch(String dt) async {
    String site =
        'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=$_API_KEY&targetDt=$dt';
    var response = await http.get(Uri.parse(site));
    if (response.statusCode == 200) {
      var movies =
          jsonDecode(response.body)['Data'][0]['Result'] as List<dynamic>;
      return movies;
    } else {
      return [];
    }
  }
}
