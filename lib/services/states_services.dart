import 'dart:convert';
import 'package:flutter_covid_19_tracker/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;
import '../models/world_states_model.dart';

class StatesServices{
  static Future<WorldStatesModel> fetchWorldStatesRecord() async{
    final response=await http.get(Uri.parse(AppUrl.worldStatesApi));
    var data=jsonDecode(response.body);
    if(response.statusCode==200){
      return WorldStatesModel.fromJson(data);
    } else{
      throw Exception("Error");
    }
  }

  static Future<List<dynamic>> countriesListApi() async{
    var data;
    final response=await http.get(Uri.parse(AppUrl.countriesList));
    if(response.statusCode==200){
      data=jsonDecode(response.body);
      return data;
    } else{
      throw Exception("Error");
    }
  }

}