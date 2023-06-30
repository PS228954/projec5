import '../models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>?> getPost() async {
    var client = http.Client();

    var uri = Uri.parse('https://date.nager.at/api/v3/PublicHolidays/2023/AT');
    var response = await client.get(uri);
    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200)
    {
      var json = response.body;
      return postFromJson(json);
    }
  }
}