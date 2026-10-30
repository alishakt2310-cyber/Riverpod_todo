import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpord/todo_model.dart';
import 'package:todo_riverpord/todo_provider.dart';

class Todoscreen extends ConsumerStatefulWidget {
  const Todoscreen({super.key});

  @override
  ConsumerState<Todoscreen> createState() => _TodoscreenState();
}

class _TodoscreenState extends ConsumerState<Todoscreen> {
  TextEditingController titlecontroller=TextEditingController();
  TextEditingController desccontroller=TextEditingController();
  @override
void dispose() {
  titlecontroller.dispose();
  desccontroller.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    final todos=ref.watch(TodoProvider);
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller:titlecontroller ,
           decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Title",
        ),
      ),
      TextField(
        controller: desccontroller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "description",
        ),
      ),
      ElevatedButton(onPressed: (){
        final title=titlecontroller.text.trim();
        final description=desccontroller.text.trim();
      if(title.isNotEmpty){
        ref.read(TodoProvider.notifier)
        .addtodo(TodoModel(title: title, description:description)
      );
        titlecontroller.clear();
        desccontroller.clear();
      }
        

      }, child: Text("add")),
      Expanded(child: 
      ListView.builder(itemCount:todos.length,
      itemBuilder: (context, index) {
        final todo=todos[index];
        return ListTile(
          title: Text(todo.title),
          subtitle: Text(todo.description),
          trailing: IconButton(onPressed: (){
            ref.read(TodoProvider.notifier)
            .deletetodo(index);
          }, icon:Icon(Icons.delete),),
        );
      },
      ),
      )
        ],
      )
    );
  }
}