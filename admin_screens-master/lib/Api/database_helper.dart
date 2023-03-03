import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_screen/conf.dart';

class DatabaseHelper {
  var status;
  var loginEmailStatus, loginEmailStatus1, loginUsernameStatus;
  var token;
//1 login
  loginData(String username, String password) async {
    Uri myUrl = Uri(
      scheme: 'http',
      host: 'maisala7.pythonanywhere.com',
      path: 'get_user_info/',
    );
    final response = await http
        .post(myUrl, body: {"username": "$username", "password": "$password"});
    status = response.body.contains('Incorrect username or password');

    var data = json.decode(response.body);
    if (status) {
    } else {
      _save(data);
    }
    return data;
  }

  login(String username, String password) async {
    // final prefs = await SharedPreferences.getInstance();
    // final key = 'token';
    // final value = prefs.get(key) ?? 0;

    Uri myUrl = Uri(
      scheme: 'http',
      host: 'maisala7.pythonanywhere.com',
      path: 'show_my_report/',
    );
    final response = await http.post(
        Uri.parse('http://maisala7.pythonanywhere.com/get_user_info/'),
        body: {"username": "$username", "password": "$password"});
    print(json.decode(response.body));
    status = response.toString().contains('error');
    return json.decode(response.body);
  }

  //2 user request
  Future<List<dynamic>> get_user_request() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // final key = 'token';
      // final value = prefs.get(key) ?? '';

      final url = 'http://maisala7.pythonanywhere.com/get_user_request/';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
        },
      );
      print('API request failed with status ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;

        return data;
      } else {
        return [];
      }
    } catch (e) {
      print('API request failed with exception $e');
      return [];
    }
  }

  //3 confirmation
  payment_confirmation(process_number) async {
    // final prefs = await SharedPreferences.getInstance();
    // final key = 'token';
    // final value = prefs.get(key) ?? 0;

    Uri myUrl = Uri(
      scheme: 'http',
      host: 'maisala7.pythonanywhere.com',
      path: 'Payment_confirmation/',
    );
    final response = await http.post(myUrl, headers: {
      // 'Authorization': 'token $value'
    }, body: {
      "process_number": process_number,
    });

    status = response.toString().contains('error');
    return json.decode(response.body);
  }

  //4 user details
  Future<List> get_user_details() async {
    // final prefs = await SharedPreferences.getInstance();
    // final key = 'token';
    // final value = prefs.get(key) ?? 0;

    Uri myUrl = Uri(
      scheme: 'http',
      host: 'maisala7.pythonanywhere.com',
      path: 'get_user_datails/',
    );
    http.Response response = await http.get(myUrl);
    return json.decode(response.body);
  }

  //5 reports
  reports(String start_date, String end_date, String center) async {
    // final prefs = await SharedPreferences.getInstance();
    // final key = 'token';
    // final value = prefs.get(key) ?? 0;

    Uri myUrl = Uri(
      scheme: 'http',
      host: 'maisala7.pythonanywhere.com',
      path: 'show_my_report/',
    );
    final response = await http.post(myUrl, headers: {
      // 'Authorization': 'token $value'
    }, body: {
      "start_date": "$start_date",
      "end_date": "$end_date",
      "center": "$center",
    });
    print(json.decode(response.body));
    status = response.toString().contains('error');
    return json.decode(response.body);
  }

  //accept?
  accept(String id) async {
    Uri myUrl = Uri(
      scheme: 'http',
      host: 'maisala7.pythonanywhere.com',
      path: 'accept_card/',
    );
    final response = await http.post(myUrl, body: {
      "id": "$id",
    });
    // status = response.body.contains('Incorrect  or password');
    var data = json.decode(response.body);
    print(data);
    if (status) {
    } else {
      _save(data[0]);
    }
  }

  // reject?
  reject(String id) async {
    Uri myUrl = Uri(
      scheme: 'http',
      host: 'maisala7.pythonanywhere.com',
      path: 'reject_card/',
    );
    final response = await http.post(myUrl, body: {
      "id": "$id",
    });
    // status = response.body.contains('Incorrect  or password');
    var data = json.decode(response.body);
    print(data);
    if (status) {
    } else {
      _save(data[0]);
    }
  }
  // wait?

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  void showMyDialog(
      {required context,
      required String title,
      required String content,
      required String controller,
      var page}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: FutureBuilder<dynamic>(
              future: payment_confirmation(controller),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? CasesClass(1, snapshot.data)
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          );
        });
  }
}
