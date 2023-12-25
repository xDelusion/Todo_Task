import 'package:flutter/material.dart';
import 'package:todoz/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todoList = [];
  /* we created an empty list that takes the instance properties
  (variables) from the Todo class, 
  the Todo class has 'id, titleName, done' */

  List<Todo> get todoList => _todoList;
  /* 
  we created a public variable using the getter method
  and setting it the value(s) of ( _todoList ),
  / todoList without ( _ ) is the public variable to be used
  in other files 
  */

  void addTile(String newTitle) {
    /* 
    the purpose of this function is to add a new tile with the title the user typed
    check the 'todo_tile.dart' file in 'widgets' folder, 
    see where the property title is used
    */
    Todo newTodo = Todo(id: _todoList.length + 1, title: newTitle);
    /* 
    here we want to tell the function what to do with 'id' and 'title' everytime
    it's being called or used,

    for 'id' --> whenever we create a new tile it checks the 
    length of ( _todoList ) and add 1 to the length it will result in the id number
    .                   **   (length of _todoList + 1) = id,   **

    for 'title' --> whenever we create a new tile it checks what was
    typed in the place of where you added 'title' and set it to 'newTitle' 
    */
    _todoList.add(newTodo);
    /*
    here we used the add() method
    */
    notifyListeners();
  }

  void markTodoDone(int id) {
    /* The purpose of this function is to change the checkbox false ⇌ true */
    Todo foundTodo = _todoList.firstWhere((element) => element.id == id);
    /* here we want to tell the function to look for the id in the List
       that matches the id of the tile the user clicked */

    foundTodo.done = !foundTodo.done;
    /* done is a bool that is set to [ false ] " Check todo.dart in models " 
        so whenever the function (checkbox is clicked) runs, 
        we want to change [ false ] to [ true ], and when we click it again it changes it again */
    notifyListeners();
  }

  void deleteTodo(int id) {
    _todoList.removeWhere((element) =>
        element.id ==
        id); // will simply remove/delete the selected tile by using removeWhere() method
    notifyListeners();
  }

  void editTitle(int id, String newTitle) {
    Todo editTitle =
        _todoList.firstWhere((element) => element.id == id); // find matching id
    if (newTitle.isNotEmpty) {
      editTitle.title =
          newTitle; // change title to what was stored in ' newTitle '
    } else {
      editTitle.title = editTitle
          .title; // if ' newTitle/TextField() ' was empty, keep the original title
    }
    editTitle.isEditing =
        !editTitle.isEditing; // 'isEditing' is [false] by default
    notifyListeners();
  }
}
