import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyc/commomWidget.dart';

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {
  TextEditingController _textController = TextEditingController();

  static List<String> mainDataList = [
    "Accounting",
    "Administrative Services (Payroll, HR, virtual assistants, back office, etc)",
    "Architecture & Civil Planning",
    "Education services",
    "Financial services",
    "Leisure, Travel & Tourism",
    "Manufacturing/ Goods exports",
    "Public Relations and Communications",
    "Research & analytics services",
    "Staffing & Recruiting",
    "Other",

  ];

  // Copy Main List into New List.
  List<String> newDataList = List.from(mainDataList);
  bool _isRadioSelected = false;
  bool _activity = true;

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),),
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 30),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Select Primary Business Activity',style: styleText(fontSize: 14.0,fontWeight: FontWeight.w500,color: const Color(0xff272727)),),
              InkWell(child: SvgPicture.asset('assets/images/cacle.svg',width: 36,height: 36,),onTap: (){
                Navigator.pop(context);
              },),

            ],
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: _textController,
            style: styleText(
                color: const Color(0xff666666),
                fontWeight: FontWeight.w300,
                fontSize: 16.0),
            decoration: InputDecoration(
border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffF3F3F3))),
                contentPadding:
                EdgeInsets.only(left: 20),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 1,
                      height: 30,
                      color: const Color(0xffC5C5C5),
                    ),
                    const SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 17.0),
                      child: SvgPicture.asset('assets/images/Icon feather-search.svg'),
                    )
                  ],
                ),
                hintText: 'Search',
                filled: true,
                fillColor: const Color(0xffFBEEFE)),
            onChanged: onItemChanged,
          ),
          Expanded(
            child: ListView(

              children: newDataList.map((data) {
                return Column(
                  children: [
                    RadioListTile(
                      title: Text(data),selected: _isRadioSelected==_activity,
                      controlAffinity: ListTileControlAffinity.trailing,contentPadding: EdgeInsets.zero,
                      value: _activity,
                      groupValue: _isRadioSelected,
                      onChanged: (bool? value) {
                        print(data);
                        setState(() {
                          _isRadioSelected = value!;
                        });
                      },
                    ),
                    Container(color: Color(0xffCCCCCC),height: 0.5,)
                  ],
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
