import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoz/models/todo.dart';
import 'package:todoz/providers/todo_provider.dart';

class TodoTile extends StatelessWidget {
  final Todo
      todo; // created a variable for the Todo class having (title, id, done) to be able to access them
  TodoTile({Key? key, required this.todo}) : super(key: key);
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
        child: ListTile(
          title: todo.isEditing // checks the bool of isEditing
              ? TextField(
                  // if 'isEditing' is [true] show TextField()
                  controller: titleController,
                  onSubmitted: (newTitle) {
                    todo.title = newTitle;
                  })
              // if 'isEditing' is [false] show Text()
              : Text(todo.title),
          /* here we accessed the Todo class using the variable 'todo'
            and want to use and display the value of 'title' .. it takes what's typed and set it here */

          trailing: Wrap(
            // I used 'Wrap' here, you can try what would happen without (there are things to be used other than Wrap of course)
            children: [
              IconButton(
                onPressed: () {
                  context
                      .read<TodoProvider>()
                      .editTitle(todo.id, titleController.text);
                  //. todo.id is the tile selected  --  The new title is obtained from 'titleController.text'
                },
                // we're saying here, if 'isEditing' = true, display check icon, if false display edit icon
                icon: Icon(todo.isEditing ? Icons.check : Icons.edit),
              ),
              IconButton(
                  onPressed: () {
                    context.read<TodoProvider>().deleteTodo(todo.id);
                  },
                  icon: Icon(Icons.delete_forever)),
              Checkbox(
                fillColor: MaterialStateProperty.all<Color>(Colors.white),
                checkColor: Colors.amber.shade300,
                side: MaterialStateBorderSide.resolveWith(
                  (states) =>
                      BorderSide(width: 1.0, color: Colors.amber.shade300),
                ),
                value: todo.done,
                /* as in the Todo class in the models folder, done is set to false, 
                the checkbox will be unchecked once a new tile is created */

                onChanged: (value) =>
                    // here we added the markTodoDone function to change the checkbox
                    {context.read<TodoProvider>().markTodoDone(todo.id)},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
