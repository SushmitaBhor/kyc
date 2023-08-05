import 'package:flutter/material.dart';
import 'package:kyc/pages/searchListOfPrimaryBusinessActivity.dart';
import 'package:kyc/pages/selectGSTIN.dart';
import 'dart:math' as math;
import '../commonWidget.dart';
TextEditingController primaryActivityController = TextEditingController();
TextEditingController gstinController = TextEditingController();
TextEditingController companyNickNameController = TextEditingController();
bool checkWebsite = false;
bool companyNameError = false;
class BusinessDetailsForm extends StatefulWidget {
  const BusinessDetailsForm({Key? key}) : super(key: key);

  @override
  State<BusinessDetailsForm> createState() => _BusinessDetailsFormState();
}

class _BusinessDetailsFormState extends State<BusinessDetailsForm> {
  openBankActivity(){
    return showModalBottomSheet(
        context: context, builder: (BuildContext context){
      return ListSearch();
    });
  }
  openGSTIN(){
    return showModalBottomSheet(
        context: context, builder: (BuildContext context){
      return SelectGSTIN();
    });
  }
  @override
  Widget build(BuildContext context) {
    return fillBusinessDetailsForm();
  }
  Widget fillBusinessDetailsForm() {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('PAN Verified!',
              style: styleText(
                color: const Color(0xff08AC72),
                fontSize: 18.0,
              )),
          Text(' Fill In Your Business Details',
              style: styleText(
                color: const Color(0xff272727),
                fontSize: 18.0,
              )),
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
          Form(
            key: bankFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 36,
                ),
                Text(
                  'PAN',
                  style: styleText(fontSize: 16.0, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                      fillColor: Color(0xffFBEEFE),
                      filled: true,
                      hintText: 'BA34V F7K90',
                      hintStyle:
                      TextStyle(color: Color(0xff272727), fontSize: 16.0)),
                ),
                const SizedBox(
                  height: 36,
                ),
                Text(
                  'Company name',
                  style: styleText(fontSize: 16.0, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                      fillColor: Color(0xffFBEEFE),
                      filled: true,
                      hintText: 'ABC Limited',
                      hintStyle:
                      TextStyle(color: Color(0xffBBBBBB), fontSize: 16.0)),
                ),
                const SizedBox(
                  height: 36,
                ),
                Text(
                  'CIN',
                  style: styleText(fontSize: 16.0, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                      fillColor: Color(0xffFBEEFE),
                      filled: true,
                      hintText: 'U369900R2020PTC032608',
                      hintStyle:
                      TextStyle(color: Color(0xffBBBBBB), fontSize: 16.0)),
                ),
                const SizedBox(
                  height: 36,
                ),
                Text(
                  'Company nickname for communications',
                  style: styleText(fontSize: 16.0, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: companyNickNameController,
                  decoration: const InputDecoration(
                      fillColor: Color(0xffFBEEFE),
                      filled: true,
                      hintText: 'Enter Company nickname',
                      hintStyle:
                      TextStyle(color: Color(0xffBBBBBB), fontSize: 16.0)),
                ),
                companyNameError == true
                    ? Row(
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Color(0xffCC2C2C),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Enter Company nickname',
                      style: styleText(
                          color: const Color(0xffCC2C2C),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 36,
                ),
                Text(
                  'Primary business activity',
                  style: styleText(fontSize: 16.0, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 8),
                TextFormField(onTap: (){
                  openBankActivity();

                },
                  controller: primaryActivityController,
                  decoration: InputDecoration(

                      fillColor: const Color(0xffFBEEFE),
                      filled: true,
                      hintText: 'Select one',suffixIcon:  Transform.rotate( angle: 90 * math.pi / 180,
                      child: const Icon(Icons.arrow_forward_ios_sharp,color: Color(0xff272727),size: 12,)),
                      hintStyle: styleText(
                          color: const Color(0xffBBBBBB),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300)),
                ),
                const SizedBox(
                  height: 36,
                ),
                Text(
                  'GSTIN',
                  style: styleText(fontSize: 16.0, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 8),
                TextFormField(onTap: (){
                  openGSTIN();

                },
                  controller: gstinController,
                  decoration: InputDecoration(

                      fillColor: const Color(0xffFBEEFE),
                      filled: true,
                      hintText: 'Select',suffixIcon:  Transform.rotate( angle: 90 * math.pi / 180,
                      child: Icon(Icons.arrow_forward_ios_sharp,color: Color(0xff272727),size: 12,)),
                      hintStyle: styleText(
                          color: const Color(0xffBBBBBB),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300)),
                ),

                const SizedBox(
                  height: 36,
                ),
                Text(
                  'Billing address',
                  style: styleText(fontSize: 16.0, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                      fillColor: Color(0xffFBEEFE),
                      filled: true,
                      hintText:
                      'A140, Near Maternity Care Hospital, Sahid Nagar, Bhubaneswar, Khordha, Odisha, 751007',
                      hintStyle:
                      TextStyle(color: Color(0xffBBBBBB), fontSize: 16.0)),
                ),
                const SizedBox(
                  height: 36,
                ),
                Text(
                  'Website URL',
                  style: styleText(fontSize: 16.0, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                      fillColor: Color(0xffFBEEFE),
                      filled: true,
                      hintText:
                      'A140, Near Maternity Care Hospital, Sahid Nagar, Bhubaneswar, Khordha, Odisha, 751007',
                      hintStyle:
                      TextStyle(color: Color(0xffBBBBBB), fontSize: 16.0)),
                ),
                const SizedBox(
                  height: 36,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: checkWebsite,
                        onChanged: (value) {
                          setState(() {
                            checkWebsite = value!;
                          });
                        }),
                    const SizedBox(width: 6),
                    Text(
                      'We don\'t have a website',
                      style: styleText(
                          color: const Color(0xff272727),
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

