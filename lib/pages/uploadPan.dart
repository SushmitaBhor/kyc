import 'package:casa_vertical_stepper/casa_vertical_stepper.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import '../commomWidget.dart';

class UploadPan extends StatefulWidget {
  const UploadPan({Key? key}) : super(key: key);

  @override
  State<UploadPan> createState() => _UploadPanState();
}
final stepperList = [
  StepperStep(
      title: Text('Uploading file'),
      leading: Container(decoration:BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.grey)),child: Icon(Icons.done,size: 15,)),trailing: SizedBox(),
      view: SizedBox()
  ),
  StepperStep(
    title: Text('Extracting data'),
    leading:Container(decoration:BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.grey)),child: Icon(Icons.done,size: 15,)),trailing: SizedBox.shrink(),
    view: SizedBox()
  ), StepperStep(
      title: Expanded(child: Text('Verifying with government records',style: TextStyle(overflow: TextOverflow.ellipsis),)),
      leading: Container(decoration:BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.grey)),child: Icon(Icons.done,size: 15,)),trailing: SizedBox(),
      view: SizedBox()
  )];

class _UploadPanState extends State<UploadPan> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [upload(), const SizedBox(height: 10), benefit()],
            ),
          )),
    );
  }

  int activeStep = 0;
  int activeStepVertical = 0;

  Widget stepI() {
    return EasyStepper(
      activeStep: activeStep,
      showStepBorder: false,
      steppingEnabled: true,
      defaultLineColor: Colors.grey,
      internalPadding: 0,
      lineType: LineType.normal,
      padding: const EdgeInsets.only(top: 10),
      stepRadius: 22,
      fitWidth: true,
      activeStepBackgroundColor: Colors.purple,
      activeStepIconColor: Colors.white,
      finishedStepBackgroundColor: Colors.grey.shade400,
      finishedStepIconColor: Colors.grey,
      unreachedStepBackgroundColor: Colors.grey.shade100,
      unreachedStepIconColor: Colors.grey,
      steps: [
        EasyStep(
          customStep: Icon(
            Icons.person,
            color: activeStep == 0 ? Colors.white : Colors.grey,
            size: 20,
          ),
        ),
        EasyStep(
            customStep: Icon(
          Icons.language,
          color: activeStep == 1 ? Colors.white : Colors.grey,
        )),
        EasyStep(
          customStep: Icon(
            Icons.group_outlined,
            color: activeStep == 2 ? Colors.white : Colors.grey,
          ),
        ),
        EasyStep(
            customStep: Icon(
          Icons.account_balance_outlined,
          color: activeStep == 3 ? Colors.white : Colors.grey,
        )),
      ],
      showLoadingAnimation: false,
      onStepReached: (index) => setState(() => activeStep = index),
    );
  }

  Widget upload() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 20),
          ]),
      child: Column(
        children: [
          stepI(),
          Text(
            '${activeStep == 0 ? 0 : (100 / (4 - activeStep)).round()}% completed',
            textAlign: TextAlign.start,
            style: styleText(
                color: Colors.purple,
                fontSize: 14.0,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.purple.shade50.withOpacity(0.10),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Upload Soft Copy Of Director\'s Personal ',
                      style: styleText(
                          fontWeight: FontWeight.w600, fontSize: 16.0),
                      children: [
                        TextSpan(
                            text: 'PAN Card',
                            style: styleText(
                                color: Colors.purple,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0))
                      ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    'To complete verification of your business, we require authorisation of one of the companny directors listed with the ministry of corporate affairs (MCA).',
                style: styleText(fontSize: 14.0,fontWeight: FontWeight.normal,color: Colors.grey),
                ),
                CasaVerticalStepperView(
                  steps: stepperList,
                  seperatorColor: const Color(0xffD2D5DF),

                  showStepStatusWidget: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget benefit() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 20),
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.lock),
              ),
              Text('Your data is secure and protected')
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.lightGreen.shade50),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      Icons.done,
                      size: 15,
                    ),
                  )),
              Text('KYC compliant with RBI regullations')
            ],
          ),
        ],
      ),
    );
  }
}
