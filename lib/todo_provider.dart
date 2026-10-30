import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_riverpord/todo_model.dart';

class TodoProviderNotifier extends StateNotifier<List<TodoModel>>{
TodoProviderNotifier():super([]);
void addtodo(TodoModel todomodel){
  state=[...state,todomodel];

}
void deletetodo(int index){
    state=[
      for(int i=0;i<state.length;i++)
      if(i!=index)state[i],
    ];
  }
}
final TodoProvider=StateNotifierProvider<TodoProviderNotifier,List<TodoModel>>((ref) => TodoProviderNotifier(),);