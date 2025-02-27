import 'package:api_with_provider/models/todo_model.dart';
import 'package:api_with_provider/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TodoProvider>(context, listen: false).fetchTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        centerTitle: true,
      ),
      body: Consumer<TodoProvider>(
        builder: (context, TodoProvider, child) {
          return ListView.builder(
              itemCount: TodoProvider.todos.length,
              itemBuilder: (context, index) {
                if (TodoProvider.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListTile(
                    tileColor: TodoProvider.todos[index].completed!
                        ? Colors.green.shade300
                        : Colors.red.shade300,
                    title: Text(TodoProvider.todos[index].title.toString()),
                    trailing: TodoProvider.todos[index].completed!
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                  );
                }
              });
        },
      ),
    );
  }
}
