import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/todo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<TodoProvider>(
    create: (context) => TodoProvider(),
    child: const MaterialApp(
      home: MyWidget(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<TodoProvider>().fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoProvider>().todoPost();
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODOLIST"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.2)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    todos[index].id.toString(),
                    style: const TextStyle(fontSize: 40),
                  ),
                  todos[index].completed.toString().toLowerCase() == 'true'
                      ? Text(
                          todos[index].completed.toString(),
                          style:
                              const TextStyle(fontSize: 15, color: Colors.blue),
                        )
                      : Text(
                          todos[index].completed.toString(),
                          style:
                              const TextStyle(fontSize: 15, color: Colors.red),
                        ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      todos[index].title,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                  Text(
                    todos[index].userId.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
