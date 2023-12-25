import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:todo_app/models/todo.dart';
// import 'package:todo_app/widgets/todo_tile.dart';
import 'package:todoz/models/todo.dart';
import 'package:todoz/providers/todo_provider.dart';
import 'package:todoz/widgets/todo_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        backgroundColor: Colors.amber.shade300,
        actions: [
          IconButton(
            onPressed: () => GoRouter.of(context).push('/add'),
            icon: Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: Consumer<TodoProvider>(
        /* we added a ListView to display todos the user created 
           and wrapped with a consumer to access TodoProvider */

        builder: (context, value, child) => ListView.builder(
            shrinkWrap: true,
            itemCount: value.todoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                todo: value.todoList[index],
              );
            }),
      ),
    );
  }
}
