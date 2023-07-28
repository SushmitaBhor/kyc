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
    return Scaffold(body: SafeArea(child: completeKYC()));
  }

  Widget completeKYC() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 20),
          ]),
      margin: const EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
      padding: const EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            completeKYCTitle(),
            const SizedBox(
              height: 10,
            ),
            whatToKeepHandy(),
            const SizedBox(
              height: 10,
            ),
            whyKYC()
          ]),
    );
  }

  TextStyle styleText({color, fontWeight, fontSize}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 25.00,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: 'Lato');
  }

  Decoration decoration() {
    return BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 20),
        ]);
  }

  Widget completeKYCTitle() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'Complete your ',
            style: styleText(fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                  text: 'KYC',
                  style: styleText(
                      color: Colors.purple, fontWeight: FontWeight.w600)),
              TextSpan(
                text: ' and Get your international account in ',
                style: styleText(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                  text: 'just 5 mins!',
                  style: styleText(
                      color: Colors.purple, fontWeight: FontWeight.w600)),
            ]));
  }

  Widget whatToKeepHandy() {
    return Container(
      decoration: decoration(),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text('What to keep handy?',
                style: styleText(fontSize: 20.00, fontWeight: FontWeight.w700)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: Text(
              'Business details',
              style: styleText(fontSize: 16.00, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          bulletedTitle('Business PAN'),
          const SizedBox(
            height: 5,
          ),
          bulletedTitle('Business bank account number and IFSC code'),
        ],
      ),
    );
  }

  Widget whyKYC() {
    return Container(
      decoration: decoration(),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text('Why do we need KYC?',
                style: styleText(fontSize: 20.00, fontWeight: FontWeight.w700)),
          ),
          bulletedTitle(
              'RBI mandates company verification of customers engaging in cross border payments.'),
        ],
      ),
    );
  }

  Widget bulletedTitle(title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leadIcon(),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              title,
              style: styleText(
                  fontSize: 14.00,
                  fontWeight: FontWeight.w100,
                  color: Colors.black54),
            )),
          ]),
    );
  }

  Widget leadIcon() {
    return Container(
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.purple),
        padding: const EdgeInsets.all(2),
        child: const Icon(
          Icons.done,
          color: Colors.white,
          size: 15,
        ));
  }
}
