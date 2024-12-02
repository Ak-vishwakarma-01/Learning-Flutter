import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});

  @override
  State<NewExpense> createState(){ 
    return _StateNewExpense() ;
  }
}

class _StateNewExpense extends State<NewExpense> {
  
  final _titleController = TextEditingController();
  
  @override
  void dispose() {    // dispose means this is not needed anymore and only State class can implement dispose , statelesswidget can't 
    _titleController.dispose();
    super.dispose();        
  }

  @override
  Widget build( context) {
    return Padding(
      padding: const EdgeInsets.all(16), 
      child: Column(
        children: [
          TextField(
            // onChanged: _saveTitleInput,  // instead of onchange now use controller
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label:Text('Title'),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                debugPrint(_titleController.text);
                },
                child:const Text("Save Expense") ,),
            ],
            ),
        ],
      ),
    );
  }
}