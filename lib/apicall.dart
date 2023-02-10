import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:task1/model.dart';
import 'package:task1/api.dart';

class ApiService{
  Future<List<PostModel>?> getPosts() async{
    try{
      var url=Uri.parse(ApiConstants.baseURL + ApiConstants.postEndpoint);
      var response =await http.get(url);
      if(response.statusCode ==200){
        List<PostModel> model= postModelFromJson(response.body);
        return model;
      }
    }
    catch (e){
      log(e.toString());
    }
  }
}
