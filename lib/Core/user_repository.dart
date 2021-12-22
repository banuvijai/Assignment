import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:assignment/Core/user_model.dart';

Uri userDetailUri = Uri.parse("https://jsonplaceholder.typicode.com/photos");


Future<List<UserDetailResponse>?> getUserDetails() async{
  List<UserDetailResponse> userDetailResponse = <UserDetailResponse>[];
  http.Response response = await http.get(
    userDetailUri,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    print(response.body);
    List<dynamic> c = jsonDecode(response.body);
      userDetailResponse.clear();
      for (dynamic cart in c) {
        userDetailResponse.add(UserDetailResponse.fromJson(cart));
    }
  }
  return userDetailResponse;
}
