import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyc/commonWidget.dart';
import 'package:custom_radio_group_list/custom_radio_group_list.dart';
import 'beneficiaryOwnerForm.dart';

class SelectNationalityListSearch extends StatefulWidget {
  SelectNationalityListSearchState createState() =>
      SelectNationalityListSearchState();
}

TextEditingController _textController = TextEditingController();

List<String> nationList = [
  "Afghanistan",
  "Albania",
  "Algeria",
  "Argentina",
  "Armenia",
  "Australia",
  "Austria",
  "Bangladesh",
  "Belgium",
];

List<String> newDataList = List.from(nationList);
bool _isRadioSelected = false;

class SelectNationalityListSearchState
    extends State<SelectNationalityListSearch> {
  onItemChanged(String value) {
    setState(() {
      newDataList = nationList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Primary Business Activity',
                style: styleText(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff272727)),
              ),
              InkWell(
                child: SvgPicture.asset(
                  'assets/images/cacle.svg',
                  width: 36,
                  height: 36,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _textController,
            style: styleText(
                color: const Color(0xff666666),
                fontWeight: FontWeight.w300,
                fontSize: 16.0),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF3F3F3))),
                contentPadding: EdgeInsets.only(left: 20),
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
                      child: SvgPicture.asset(
                          'assets/images/Icon feather-search.svg'),
                    )
                  ],
                ),
                hintText: 'Search',
                filled: true,
                fillColor: const Color(0xffFBEEFE)),
            onChanged: onItemChanged,
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: RadioGroup(
                items: newDataList,
                selectedItem: _isRadioSelected,
                onChanged: (value) {
                  selectNationalityController.text = value;
                },
                disabled: false,
                labelBuilder: (BuildContext context, int index) {
                  return Text(newDataList[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
