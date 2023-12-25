import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todoz/providers/todo_provider.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);
  final todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
        backgroundColor: Colors.amber.shade300,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.all(40.0),
              child: TextField(
                controller: todoController, // stores the value or what is typed
                decoration: InputDecoration(
                  hintText: 'Your todo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<TodoProvider>().addTile(todoController.text);
                /* by accessing the TodoProvider we were able to use the addTile() function 
                      then we added todoController.text to send the value typed in 'newTitle' property
                      of addTile function */
                context.pop();
                // after pressing the Add button it will get you out of the AddPage() page
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.amber.shade300),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Add"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
