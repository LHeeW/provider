import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoProvider extends ChangeNotifier {
  final List<Todo> todoList = [];

  void fetchPost() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final todos = data.map<Todo>((json) => Todo.fromJson(json)).toList();

      todoList.clear();
      todoList.addAll(todos);
      notifyListeners();
    } else {
      const CircularProgressIndicator();
      notifyListeners();
    }
  }

  List<Todo> todoPost() {
    return todoList;
  }
}
