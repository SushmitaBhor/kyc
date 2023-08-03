import 'package:flutter/material.dart';
import 'package:kyc/pages/uploadPan.dart';

import 'commomWidget.dart';

Future<void> main() async {
  runApp(MyApp());
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
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset:false,body: SafeArea(child: completeKYC()));
  }

  Widget completeKYC() {
    return Container(width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffFFFFFF),Color(0xffF8C7FF), ],
        ),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 1,
                          blurRadius: 20),
                    ]),
                margin:
                    const EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
                padding: const EdgeInsets.all(20),
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
                      whyKYC(),
                    ]),
              ),
              term(),

            ],
          ),    button()
        ],
      ),
    );
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
                style: styleText(fontSize: 18.00, fontWeight: FontWeight.w700)),
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
                style: styleText(fontSize: 18.00, fontWeight: FontWeight.w700)),
          ),
          bulletedTitle(
              'RBI mandates company verification of customers engaging in cross border payments.'),
        ],
      ),
    );
  }

  Widget bulletedTitle(title) {
    return Row(
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
        ]);
  }



  term() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 20),
          ]),
      child: Row(
        children: [
          Checkbox(
            value: check,
            onChanged: (val) {
              setState(
                () {
                  check = val!;
                },
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 23.0),
              child: RichText(
                text: TextSpan(
                    text: 'By clicking the above, I agree with BriskPe ',
                    style: styleText(
                        fontSize: 14.00,
                        fontWeight: FontWeight.w100,
                        color: Colors.black54),
                    children: [
                      TextSpan(
                          text: 'Terms of Use ',
                          style: styleText(
                              fontSize: 14.00,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54)),
                      TextSpan(
                          text: 'and ',
                          style: styleText(
                              fontSize: 14.00,
                              fontWeight: FontWeight.w100,
                              color: Colors.black54)),
                      TextSpan(
                          text: 'Privacy Policy.',
                          style: styleText(
                              fontSize: 14.00,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54))
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

   button() {
    return Container(width: double.infinity,margin: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){return UploadPan();}));
        },
        style: OutlinedButton.styleFrom(backgroundColor: Colors.deepPurple,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),padding: EdgeInsets.symmetric(vertical: 10)),
        child: Text(
          'Agree and Continue',
          style: styleText(
              fontSize: 20.00, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}
