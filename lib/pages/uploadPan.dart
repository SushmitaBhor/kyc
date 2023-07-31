import 'dart:io';
import 'package:camera/camera.dart';
import 'package:casa_vertical_stepper/casa_vertical_stepper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../commomWidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
class UploadPan extends StatefulWidget {
  const UploadPan({Key? key}) : super(key: key);

  @override
  State<UploadPan> createState() => _UploadPanState();
}



class _UploadPanState extends State<UploadPan> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [upload(), const SizedBox(height: 10), benefit()],
              ),
            ),
          )),
    );
  }

  int activeStepVertical = 0;

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
                color: const Color(0xffFEF9FF),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                titleAndDescription(),
                const SizedBox(
                  height: 10,
                ),
                dotBorderBox(),
                const SizedBox(
                  height: 10,
                ),
                verticalSteps()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget titleAndDescription() {
    return Column(
      children: [
        RichText(
          text: TextSpan(
              text: 'Upload Soft Copy Of Director\'s Personal ',
              style: styleText(fontWeight: FontWeight.w600, fontSize: 16.0),
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
          style: styleText(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: Colors.grey),
        )
      ],
    );
  }

  Widget dotBorderBox() {
    return DottedBorder(
      color: Colors.grey,
      dashPattern: const [10, 5],
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      radius: const Radius.circular(16),
      borderPadding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/upload.svg',
              width: 61,
              height: 61,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Upload your Director\'s PAN here',
                style: styleText(
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                    color: Color(0xff272727))),
            const SizedBox(
              height: 10,
            ),
            browse(),
            const SizedBox(
              height: 10,
            ),
            Text('JPG/ PNG / PDF | Max Size: 10 MB',
                style: styleText(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0,
                    color: Colors.grey)),
            const SizedBox(
              height: 20,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 1,
                    color: Colors.grey,
                  ),
                  Text('Or',
                      style: styleText(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: Colors.grey)),
                  Container(
                    width: 20,
                    height: 1,
                    color: Colors.grey,
                  ),
                ]),
            const SizedBox(
              height: 10,
            ),
             TextButton(
             child:Text( 'Take Photo',
              style: TextStyle(
                fontSize: 16.0,
                decoration: TextDecoration.underline,
                color: Color(0xffB212CA),
                decorationColor: Color(0xffB212CA),
                decorationThickness: 3,
                decorationStyle: TextDecorationStyle.solid,
                fontWeight: FontWeight.w600,
              )), onPressed: ()  {

             })
          ],
        ),
      ),
    );
  }

  Widget browse() {
    return ElevatedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0xff461AA3),
            padding: const EdgeInsets.symmetric(
              vertical: 11,
              horizontal: 18,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        onPressed: ()async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            File file = File(result.files.single.path.toString());
          } else {
            // User canceled the picker
          }
        },
        child: Text(
          'Browse',
          style: styleText(
              color: Colors.white,
              fontSize: 12.0,
              fontWeight: FontWeight.normal),
        ));
  }

  Widget verticalSteps() {
    return CasaVerticalStepperView(
      steps: stepperList,
      seperatorColor: const Color(0xff707070),
      showStepStatusWidget: false,
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
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
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
