import 'dart:convert';
import '../../domain/models/asociado_model.dart';

dynamic parseResponseBody(String responseBody) {
  try {
    //return jsonDecode(responseBody);
    final jsonData = jsonDecode(responseBody);
    return ApiResponse.fromJson(jsonData);
  } catch (e) {
    //_) {
    return responseBody;
    //throw Exception('Error parsing response body: $e');
  }
}

//ApiResponse parseResponseBody(String responseBody) {
//  try {
//    final jsonData = jsonDecode(responseBody);
//    return ApiResponse.fromJson(jsonData);
//  } catch (e) {
//    throw Exception('Error parsing response body: $e');
//  }
//}
