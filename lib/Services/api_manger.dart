



import 'package:api_get_data_6/Models/models.dart';
import 'package:http/http.dart' as http;


class Api_Manger{
  Future<List<AlbumModel>?> getData()async{

    var client=http.Client();
    var url =Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var response= await client.get(url);
    if(response.statusCode==200){

      print("-----------------------------------");
      print(response.body);
      print("-----------------------------------");

      var responseString=response.body;
      return albumModelFromJson(responseString);
    }
  }
}