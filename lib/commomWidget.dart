import 'package:casa_vertical_stepper/casa_vertical_stepper.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
int

activeStep = 0;
 GlobalKey<FormState> gstinFormKey=GlobalKey<FormState>();
final stepperList = [
  StepperStep(
      title: const Text(
        'Uploading file',
        style: TextStyle(
            color: Color(0xff272727),
            fontWeight: FontWeight.w300,
            fontSize: 14),
      ),
      leading: SvgPicture.asset('assets/images/lock.svg',height: 24,width: 24,),
      trailing: const SizedBox.shrink(),
      view: const SizedBox.shrink()),
  StepperStep(
      title: const Text(
        'Extracting data',
        style: TextStyle(
            color: Color(0xff272727),
            fontWeight: FontWeight.w300,
            fontSize: 14),
      ),
      leading: SvgPicture.asset('assets/images/lock.svg',height: 24,width: 24,),
      trailing: SizedBox.shrink(),
      view: SizedBox()),
  StepperStep(status: StepStatus.fail,
      title: const Text(
        'Verifying with government records',
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: Color(0xff272727)),
      ),
      leading: SvgPicture.asset('assets/images/lock.svg',height: 24,width: 24,),
      trailing: const SizedBox.shrink(),
      view: const SizedBox.shrink())
];
TextStyle styleText({color, fontWeight, fontSize}) {
  return TextStyle(
      color: color ?? Colors.black,
      fontSize: fontSize ?? 25.00,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontFamily: 'Readex_Pro');
}  Widget stepI() {
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {  return EasyStepper(
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

  );});
}
Decoration decoration() {
  return BoxDecoration(
      color: Colors.purple.shade50,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 20),
      ]);
}
Widget leadIcon() {
  return Container(
      decoration:
      const BoxDecoration(shape: BoxShape.circle, color: Colors.purple),
      padding: const EdgeInsets.all(2),
      child: const Icon(
        Icons.done,
        color: Colors.white,
        size: 15,
      ));
}