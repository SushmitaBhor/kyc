import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyc/pages/uploadPan.dart';

import '../commonWidget.dart';

class BusinessBankAccountForm extends StatefulWidget {
  const BusinessBankAccountForm({Key? key}) : super(key: key);

  @override
  State<BusinessBankAccountForm> createState() =>
      _BusinessBankAccountFormState();
}

class _BusinessBankAccountFormState extends State<BusinessBankAccountForm> {

  @override
  Widget build(BuildContext context) {
    return form();
  }

  form() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xffEBFFF4),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/completed.svg',
                      width: 21,
                      height: 21,
                    ),
                    const SizedBox(
                      width: 6.6,
                    ),
                    Text(
                      'Verified',
                      style: styleText(
                          fontSize: 16.0, color: const Color(0xff08AC72)),
                    )
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Text(
                      'Beneficial owners and directors captured!',
                      style: styleText(
                          color: const Color(0xff272727B3),
                          fontSize: 13.0,
                          fontWeight: FontWeight.w300),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Business Bank Account Details',
            style: styleText(color: const Color(0xff272727), fontSize: 18.0),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Payment from your customers will be transferred to this bank account. This account should be in the name of your company.',
            style: styleText(
                color: const Color(0xff272727B3),
                fontWeight: FontWeight.w300,
                fontSize: 14.0),
          ),
          Form(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Bank Account Number',
                  style: styleText(
                      color: const Color(0xff272727),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300)),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                    fillColor: Color(0xffFBEEFE),
                    filled: true,
                    hintText: '8338460424',
                    hintStyle:
                        TextStyle(color: Color(0xffBBBBBB), fontSize: 18)),
              ),
              const SizedBox(height: 24),
              Text('IFSC Code',
                  style: styleText(
                      color: const Color(0xff272727),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300)),
                   const SizedBox(height: 8),
                 TextFormField(
                decoration: const InputDecoration(
                    fillColor: Color(0xffFBEEFE),
                    filled: true,
                    hintText: 'HDFC0000554',
                    hintStyle:
                        TextStyle(color: Color(0xffBBBBBB), fontSize: 18)),
              ),
                       const SizedBox(height: 24),
                   Text('Account Holder Name',
                  style: styleText(
                      color: const Color(0xff272727),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300)),
                         const SizedBox(height: 8),
                TextFormField(
                decoration:  InputDecoration(
                    fillColor: const Color(0xffFBEEFE),
                    filled: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9.0),
                      child: SvgPicture.asset('assets/images/completed.svg',height: 24,width: 24,),
                    ),
                    hintText: 'ABC Limited',
                    hintStyle:
                        const TextStyle(color: Color(0xffBBBBBB), fontSize: 18.0)),
              ),
                  const SizedBox(
                height: 9,
              ),
                    Text(
                'Name matches with company PAN',
                style: styleText(
                    color: const Color(0xff08AC72),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300),
              ),
                 const SizedBox(height: 24),
                             Text('Bank Branch',
                  style: styleText(
                      color: const Color(0xff272727),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300)),
                  confirmBankDetails ==true? const SizedBox.shrink():    const SizedBox(height: 8),
                  confirmBankDetails ==true? const SizedBox.shrink():     TextFormField(
                decoration: const InputDecoration(
                    fillColor: Color(0xffFBEEFE),
                    filled: true,
                    hintText: '1234 5678 9012',
                    hintStyle:
                        TextStyle(color: Color(0xffBBBBBB), fontSize: 18)),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
