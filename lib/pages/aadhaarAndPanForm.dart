import 'package:flutter/material.dart';

import '../commonWidget.dart';
class PANAndAadhaarForm extends StatefulWidget {
  const PANAndAadhaarForm({Key? key}) : super(key: key);

  @override
  State<PANAndAadhaarForm> createState() => _PANAndAadhaarFormState();
}

class _PANAndAadhaarFormState extends State<PANAndAadhaarForm> {
  @override
  Widget build(BuildContext context) {
    return form();
  }
  form() {
    return Form(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('PAN',
            style: styleText(
                color: const Color(0xff272727),
                fontSize: 16.0,
                fontWeight: FontWeight.w300)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
              fillColor: Color(0xffFBEEFE),
              filled: true,
              hintText: 'BA34V F7K90',
              hintStyle: TextStyle(color: Color(0xffBBBBBB), fontSize: 18)),
        ),
        const SizedBox(height: 24),
        Text('Full Name',
            style: styleText(
                color: const Color(0xff272727),
                fontSize: 16.0,
                fontWeight: FontWeight.w300)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
              fillColor: Color(0xffFBEEFE),
              filled: true,
              hintText: 'HEMANT KUMAR GHIYA',
              hintStyle: TextStyle(color: Color(0xffBBBBBB), fontSize: 18)),
        ),
        const SizedBox(height: 24),
        Text('How Can We Address You?',
            style: styleText(
                color: const Color(0xff272727),
                fontSize: 16.0,
                fontWeight: FontWeight.w300)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
              fillColor: const Color(0xffFBEEFE),
              filled: true,
              hintText: 'Hemant Kumar',
              hintStyle:
              styleText(fontSize: 18.0, color: const Color(0xff272727))),
        ),
        const SizedBox(height: 24),
        Text('Aadhaar Card',
            style: styleText(
                color: const Color(0xff272727),
                fontSize: 16.0,
                fontWeight: FontWeight.w300)),
        TextFormField(
          decoration: InputDecoration(
              fillColor: const Color(0xffFBEEFE),
              filled: true,
              hintText: '1234 5678 9012',
              hintStyle:
              styleText(fontSize: 18.0, color: const Color(0xff272727))),
        ),
      ]),
    );
  }
}
