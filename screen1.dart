import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sample2/student.dart';

class Screen1 extends StatefulWidget {
   Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
   

   final _formKey=GlobalKey<FormState>();

   int id=0;
   String? name;
   int age=0;
   String? subject;
  
 late Box studentBox;

  

  
 @override
  void initState() {
    super.initState();
     
     studentBox= Hive.box<Student>('school');
  

  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(  children: [
            
            TextFormField(
              keyboardType: TextInputType.number,
              decoration:const InputDecoration(labelText: ' id'),
                onSaved: (newValue) {
                  id=int.parse(newValue.toString());
                },
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration:const InputDecoration(labelText: ' name'),
                onSaved: (newValue) {
                  name=newValue;
                },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration:const InputDecoration(labelText: ' age'),
                onSaved: (newValue) {
                  age=int.parse(newValue.toString());
                },
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration:const InputDecoration(labelText: ' subject'), 
                onSaved: (newValue) {
                  subject=newValue;
                },
            ),
      
          ElevatedButton(onPressed: (){
               saveData();
               
          },
           child:const Text("add student details")), 
           
          Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
        final data = studentBox.getAt(index) as Student;
        return Card(
          child: Column(
            children: [
              Text(data.id.toString()),
              Text(data.name),
              Text(data.age.toString()), 
              Text(data.subject),
             Row(mainAxisAlignment: MainAxisAlignment.end ,
              children: [IconButton(onPressed: (){
                studentBox.deleteAt(index);
              },
              icon:const Icon(Icons.delete))],)
            ],
          ),
        );
          },
          itemCount: studentBox.length,
        ),
      )
          
        ],),
      ) ,
     
    );
  }

  void saveData(){
   final isvalid=_formKey.currentState?.validate();

   if(isvalid!=null && isvalid){
    _formKey.currentState?.save();
    studentBox.add(Student(id: id, name: name.toString(), age: age, subject: subject.toString()));
      
   }
   

  }


}