import 'package:flutter/material.dart';
import 'package:kyc/pages/selectNationalityList.dart';
import 'dart:math' as math;
import '../commonWidget.dart';

class BeneficiaryOwnerForm extends StatefulWidget {
  const BeneficiaryOwnerForm({Key? key}) : super(key: key);

  @override
  State<BeneficiaryOwnerForm> createState() => _BeneficiaryOwnerFormState();
}

TextEditingController selectNationalityController = TextEditingController();
bool beneficiaryCheck = false;

class _BeneficiaryOwnerFormState extends State<BeneficiaryOwnerForm> {
  openNationalityList() {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SelectNationalityListSearch();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Enter Details Of Beneficial Owners',
              style: styleText(
                color: const Color(0xff272727),
                fontSize: 18.0,
              )),
          const SizedBox(
            height: 6,
          ),
          Text(
            'We have auto filled the names of directors through information available with the ministry of corporate affairs (MCA).',
            style: styleText(
              color: const Color(0xff676767),
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          TextFormField(
            decoration: const InputDecoration(
                fillColor: Color(0xffFBEEFE),
                filled: true,
                hintText: 'ATUL LAHOTI',
                hintStyle: TextStyle(color: Color(0xffBBBBBB), fontSize: 18)),
          ),
          const SizedBox(
            height: 24,
          ),
          TextFormField(
            onTap: () {
              openNationalityList();
              setState(() {

              });
            },
            controller: selectNationalityController,
            decoration: InputDecoration(
                fillColor: const Color(0xffFBEEFE),
                filled: true,
                hintText: 'Select Nationality',
                suffixIcon: Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Color(0xff272727),
                      size: 12,
                    )),
                hintStyle: styleText(
                    color: const Color(0xffBBBBBB),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300)),
          ),
          const SizedBox(
            height: 24,
          ),
          TextFormField(
            decoration: const InputDecoration(
                fillColor: Color(0xffFBEEFE),
                filled: true,
                hintText: 'HEMANT KUMAR GHIYA',
                hintStyle: TextStyle(color: Color(0xffBBBBBB), fontSize: 18)),
          ),
          const SizedBox(
            height: 24,
          ),
          TextFormField(
            decoration: const InputDecoration(
                fillColor: Color(0xffFBEEFE),
                filled: true,
                hintText: 'ATUL LAHOTI',
                hintStyle: TextStyle(color: Color(0xffBBBBBB), fontSize: 18)),
          ),
          const SizedBox(
            height: 73,
          ),
          Text('Add PAN Of Alternate Beneficial Owner/Director',
              style: styleText(
                color: const Color(0xff272727),
                fontSize: 18.0,
              )),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            onTap: () {},
            decoration: InputDecoration(
                fillColor: const Color(0xffFBEEFE),
                filled: true,
                hintText: 'ATUL LAHOTI',
                suffixIcon: Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Color(0xff272727),
                      size: 12,
                    )),
                hintStyle: styleText(
                    color: const Color(0xffBBBBBB),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300)),
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            'Please select one user',
            style: styleText(
              color: Color(0xff676767),
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            'Choose alternate person from the list beneficial owners/directors entered above.',
            style: styleText(
              color: const Color(0xff272727B37),
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            'Beneficial Owner/ Directors Name',
            style: styleText(fontSize: 16.0, fontWeight: FontWeight.w300),
          ),
          Text(
            'ATUL LAHOTI\'s Personal PAN',
            style: styleText(fontSize: 16.0, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            decoration: const InputDecoration(
                fillColor: Color(0xffFBEEFE),
                filled: true,
                hintText: 'HEMANT KUMAR GHIYA',
                hintStyle: TextStyle(color: Color(0xff272727), fontSize: 18.0)),
          ),
          const SizedBox(
            height: 36,
          ),
          SizedBox(width: double.maxFinite,
            child: OutlinedButton(onPressed: (){},style: OutlinedButton.styleFrom(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                side: const BorderSide(color: Color(0xff461AA3))
                ), child: Text('+ Add New Beneficial Owner',style: styleText(color: const Color(0xff461AA3),fontSize: 16.0),)),
          ),
          const SizedBox(
            height: 17,
          ),
          Row(
            children: [
              Checkbox(
                  value: beneficiaryCheck,
                  onChanged: (value) {
                    setState(() {
                      beneficiaryCheck = value!;
                    });
                  }),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'I undertake and agree to ensure that the Company/Partnership firm/LLP will notify BriskPe Private Limited without delay of any changes to the Controlling shareholders, person exercising control or having ownership interest in the Company/Partnership firm/LLR as declared in the table above.',
                  style: styleText(
                      color: const Color(0xff272727B3),
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
