class Todo {
  int id;
  String title;
  bool done =
      false; // we're using it for the CheckBox widget, it is set to be [ false ] (un-checked) by default
  /* since we set a value for done, no need to add it to the constructor */

  bool isEditing =
      false; // we want isEditing to be [ false ] at first and change to [ true ] when we want to

  Todo({required this.id, required this.title}); //   <---- Contructor
}
