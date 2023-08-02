import 'dart:io';
import 'package:camera/camera.dart';
import 'package:casa_vertical_stepper/casa_vertical_stepper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyc/pages/takeAPhoto.dart';
import '../commomWidget.dart';

class UploadPan extends StatefulWidget {
  UploadPan({Key? key, this.picture}) : super(key: key);
  XFile? picture;
  @override
  State<UploadPan> createState() => _UploadPanState();
}

class _UploadPanState extends State<UploadPan> {
  bool isLoad = false;
  bool isBrowse = false;
  final cameras = availableCameras();
  FilePickerResult? result;
  late File file;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffFFFFFF),
                    Color(0xffF8C7FF),
                  ],
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [upload(), const SizedBox(height: 10), benefit()],
              ),
            ),
          )),
    );
  }

  int activeStepVertical = 0;
browseImage () async { setState(() {});
result = await FilePicker.platform
    .pickFiles(type: FileType.image, allowMultiple: false);

if (result != null) {
  file = File(result!.files.single.path.toString());
  setState(() {
    setState(() {
      isLoad = true;
    });
    setState(() {
      isBrowse = true;
    });
  });
} else {
  // User canceled the picker
  setState(() {
    isLoad = false;
  });
}
}
openCamera () async {
  await availableCameras().then((value) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => TakeAPhoto(cameras: value))));
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
                color: const Color(0xffFEF9FF),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      titleAndDescription(),
                      const SizedBox(
                        height: 10,
                      ),
                      isBrowse == true ? dotBorderBoxBrowse() : dotBorderBox(),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
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
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: widget.picture != null ? preview() : uploadOrTakePhoto(),
      ),
    );
  }

  Widget dotBorderBoxBrowse() {
    return DottedBorder(
      color: Colors.grey,
      dashPattern: const [10, 5],
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      radius: const Radius.circular(16),
      borderPadding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: result != null
            ? isLoad == true
                ? browsePreview()
                : const CircularProgressIndicator()
            : uploadOrTakePhoto(),
      ),
    );
  }

  Widget preview() {
    return Column(
      children: [
        const Text(
          'Image Preview',
          style: TextStyle(
              color: Color(0xff272727),
              fontSize: 12,
              fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: result == null
                ? Image.file(
                    File(widget.picture!.path),
                    fit: BoxFit.cover,
                    width: 281,
                    height: 170,
                  )
                : Image.file(File(file.path))),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      widget.picture = null;
                      result = null;
                    });
                  },
                  child: const Text(
                    'Remove',
                    style: TextStyle(fontSize: 12, color: Color(0xff461AA3)),
                  )),
              OutlinedButton(
                  onPressed: () async {
                    if(result==null){openCamera();}else{browseImage();}
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Color(0xff461AA3)))),
                  child: const Text(
                    'Change',
                    style: TextStyle(fontSize: 12, color: Color(0xff461AA3)),
                  ))
            ],
          ),
        )
      ],
    );
  }

  Widget browsePreview() {
    return Column(
      children: [
        const Text(
          'Image Preview',
          style: TextStyle(
              color: Color(0xff272727),
              fontSize: 12,
              fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: result == null
                ? Image.file(
                    File(file.path),
                    fit: BoxFit.cover,
                    width: 281,
                    height: 170,
                  )
                : Image.file(File(file.path))),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      widget.picture = null;
                      result = null;
                    });
                  },
                  child: Text(
                    'Remove',
                    style: TextStyle(fontSize: 12, color: Color(0xff461AA3)),
                  )),
              OutlinedButton(
                  onPressed: () async {
                    if(result==null){openCamera();}else{browseImage();}

                  },
                  child: const Text(
                    'Change',
                    style: TextStyle(fontSize: 12, color: Color(0xff461AA3)),
                  ),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Color(0xff461AA3)))))
            ],
          ),
        )
      ],
    );
  }

  Widget uploadOrTakePhoto() {
    return Column(
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
            child: const Text('Take Photo',
                style: TextStyle(
                  fontSize: 16.0,
                  decoration: TextDecoration.underline,
                  color: Color(0xffB212CA),
                  decorationColor: Color(0xffB212CA),
                  decorationThickness: 3,
                  decorationStyle: TextDecorationStyle.solid,
                  fontWeight: FontWeight.w600,
                )),
            onPressed: () async {
              setState(() {});
              await availableCameras().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => TakeAPhoto(cameras: value))));
            }),
      ],
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
        onPressed: () async { setState(() {});
          result = await FilePicker.platform
              .pickFiles(type: FileType.image, allowMultiple: false);

          if (result != null) {
            file = File(result!.files.single.path.toString());
            setState(() {
              setState(() {
                isLoad = true;
              });
              setState(() {
                isBrowse = true;
              });
            });
          } else {
            // User canceled the picker
            setState(() {
              isLoad = false;
            });
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset('assets/images/secure.svg'),
              ),
              const Text(
                'Your data is secure and protected',
                style: TextStyle(color: Color(0xff666666), fontSize: 14),
              )
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
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.lightGreen.shade50),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset('assets/images/tick.svg'),
                  )),
              const Text(
                'KYC compliant with RBI regulations',
                style: TextStyle(color: Color(0xff666666), fontSize: 14),
              )
            ],
          ),
        ],
      ),
    );
  }
}
