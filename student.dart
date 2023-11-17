
import 'package:hive_flutter/adapters.dart';
part 'student.g.dart';

@HiveType(typeId: 0)
class Student{

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  int age;

  @HiveField(3)
  String subject;
  
  Student({required this.id, required this.name,required this.age,required this.subject});

}