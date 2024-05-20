import 'dart:convert';

dynamic parseResponseBody(String responseBody) {
  try {
    return jsonDecode(responseBody);
  } catch (e) {
    throw Exception('Error parsing response body: $e');
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
