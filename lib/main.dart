import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.grey,spreadRadius: 1,blurRadius: 20),]),
            margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Complete your ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                                text: 'KYC',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                )),
                            TextSpan(
                              text: ' and Get your international account in ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                                text: 'just 5 mins!',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                )),
                          ])),
                  Text('just 5 mins!',
                      style: Theme.of(context).textTheme.headlineMedium)
                ]),
          ),
        ));
  }
}
