import 'package:flutter/material.dart';

import '../commonWidget.dart';
class EnterGSTIN extends StatefulWidget {
  const EnterGSTIN({Key? key}) : super(key: key);

  @override
  State<EnterGSTIN> createState() => _EnterGSTINState();
}

class _EnterGSTINState extends State<EnterGSTIN> {
  @override
  Widget build(BuildContext context) {
    return enterGSTINForm();
  }
  Widget enterGSTINForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter GSTIN',
            style: styleText(color: const Color(0xff272727), fontSize: 18.0),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            'We require this to verify your business identity.',
            style: styleText(
              color: const Color(0xff676767),
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Text(
            'GSTIN',
            style: styleText(fontSize: 16.0, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 8),
          Form(
            key: gstinFormKey,
            child: TextFormField(
              decoration: const InputDecoration(
                  fillColor: Color(0xffFBEEFE),
                  filled: true,
                  hintText: 'BA34V F7K90',
                  hintStyle:
                  TextStyle(color: Color(0xffBBBBBB), fontSize: 18.0)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'No GSTIN found';
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }
}
