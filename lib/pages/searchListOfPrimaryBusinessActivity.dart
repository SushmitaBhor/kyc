import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyc/commomWidget.dart';


class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {

  TextEditingController _textController = TextEditingController();

  static List<String> mainDataList = [
    "Apple",
    "Apricot",
    "Banana",
    "Blackberry",
    "Coconut",
    "Date",
    "Fig",
    "Gooseberry",
    "Grapes",
    "Lemon",
    "Litchi",
    "Mango",
    "Orange",
    "Papaya",
    "Peach",
    "Pineapple",
    "Pomegranate",
    "Starfruit"
  ];

  // Copy Main List into New List.
  List<String> newDataList = List.from(mainDataList);
  bool _isRadioSelected=false;

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,style: styleText(color: Color(0xff666666),fontWeight:FontWeight.w300,fontSize: 16 ),

              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),

                  suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Container(width: 1,height: 30,color: const Color(0xffC5C5C5),),const SizedBox(width: 20),
                SvgPicture.asset('assets/images/Icon feather-search.svg')],),
                hintText: 'Search',filled: true,fillColor: const Color(0xffFBEEFE)
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12.0),
              children: newDataList.map((data) {
                return RadioListTile(
                  title: Text(data),
                  value: false, groupValue: _isRadioSelected, onChanged: (bool? value) { print(data);
                  setState(() {
                    _isRadioSelected=value!;
                  });
                  },);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}