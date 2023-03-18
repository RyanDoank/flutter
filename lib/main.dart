import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CounterProvider(),
          )
        ],
        child: HomePage(),
      ),
    );
  } //comend
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${value.counter}"),
              ElevatedButton(
                  onPressed: () {
                    value.increment();
                  },
                  child: Text("Press"))
            ],
          ),
        ),
      ),
    );
  }
}
