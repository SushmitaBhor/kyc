import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../commonWidget.dart';
import 'businessDetailsForm.dart';

class SelectGSTIN extends StatefulWidget {
  const SelectGSTIN({Key? key}) : super(key: key);

  @override
  State<SelectGSTIN> createState() => _SelectGSTINState();
}

class _SelectGSTINState extends State<SelectGSTIN> {
  List multipleSelected = [];
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "21AAHCT7448PIZR",
    },
    {
      "id": 1,
      "value": false,
      "title": "71CAHCT7448PIZR",
    },
    {
      "id": 2,
      "value": false,
      "title": "52ACFCT7448PIZR",
    },
    {
      "id": 3,
      "value": false,
      "title": "90AAHAT7448PIZR",
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 29.0),
        child: SingleChildScrollView(
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select GSTIN',style: styleText(fontSize: 14.0,fontWeight: FontWeight.w500,color: const Color(0xff272727)),),
                    InkWell(child: SvgPicture.asset('assets/images/cacle.svg',width: 36,height: 36,),onTap: (){
                      Navigator.pop(context);
                    },),

                  ],
                ),
                Column(
                  children: List.generate(
                    checkListItems.length,
                        (index) => CheckboxListTile(
                          fillColor:  MaterialStateProperty.all(const Color(0xffB212CA)),
                      controlAffinity: ListTileControlAffinity.trailing,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: Text(
                        checkListItems[index]["title"],
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      value: checkListItems[index]["value"],
                      onChanged: (value) {
                        setState(() {
                          gstinController.text= checkListItems[index]["title"];
                          checkListItems[index]["value"] = value;
                          if (multipleSelected.contains(checkListItems[index])) {
                            multipleSelected.remove(checkListItems[index]);
                          } else {
                            multipleSelected.add(checkListItems[index]);
                          }
                        });
                      },
                    ),
                  ),
                )]),
        ));}}
