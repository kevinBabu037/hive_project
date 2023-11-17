import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
//import 'package:path_provider/path_provider.dart' as path;
import 'package:sample2/screen1.dart'; 
import 'package:sample2/student.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  // final dir= await path. getApplicationDocumentsDirectory();
  // Hive.init(dir.path);
  await Hive.initFlutter('hive_db');
  if( !Hive.isAdapterRegistered(StudentAdapter().typeId)){
    Hive.registerAdapter(StudentAdapter());
  }
  await Hive.openBox<Student>('school');
  runApp(Myapp());
}


class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home: Screen1(),
   );
  }
}