import 'package:flutter/material.dart';
import './whether_screen.dart';

void main() {
  runApp(const MyApp());
}

// Future<void> main() async{
//    await dotenv.load(fileName: ".env");

//   String apiKey = dotenv.env['API_KEY'] ?? "API_KEY_NOT_FOUND";
//   print("Helooooooooooo");
//   print("API Key: $apiKey");
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData.dark(useMaterial3:true),
      home:const WhetherApp()
    ) ;
    // MaterialApp(
    //   title:'whether App'
    // );
  }
}

