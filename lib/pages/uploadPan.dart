import 'dart:io';
import 'package:camera/camera.dart';
import 'package:casa_vertical_stepper/casa_vertical_stepper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyc/pages/aadhaarAndPanForm.dart';
import 'package:kyc/pages/businessDetailsForm.dart';
import 'package:kyc/pages/enterGSTINForm.dart';
import 'package:kyc/pages/takeAPhoto.dart';
import '../commonWidget.dart';
import 'package:custom_timer/custom_timer.dart';

import 'beneficiaryOwnerForm.dart';
import 'businessBankAccountDetails.dart';

class UploadPan extends StatefulWidget {
  UploadPan({Key? key, this.picture}) : super(key: key);
  XFile? picture;
  @override
  State<UploadPan> createState() => _UploadPanState();
}

bool isSubmitAndContinue = false;
bool confirmBankDetails = false;
bool isSubmitAndContinueNext = false;
bool isSubmitAndContinueDone = false;

class _UploadPanState extends State<UploadPan>
    with SingleTickerProviderStateMixin {
  late final CustomTimerController _controller = CustomTimerController(
      vsync: this,
      begin: const Duration(seconds: 30),
      end: const Duration(seconds: 0),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.seconds);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  TextEditingController companyNickNameController = TextEditingController();
  bool isLoad = false;
  bool isBrowse = false;
  bool uploadButtonClick = false;

  bool verifyAadhaar = false;
  bool continueAndConfirmClicked = false;
  bool verifyGSTIN = false;

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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffFFFFFF),
                    Color(0xffF8C7FF),
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  upload(),
                  const SizedBox(height: 30),
                  continueAndConfirmClicked == true
                      ? SizedBox(height: verifyGSTIN == true ? 30 : 150)
                      : const SizedBox.shrink(),
                  activeStep == 2
                      ? confirmBankDetails == true
                          ? SizedBox(
                              width: double.maxFinite,
                              child: submitAndContinueButton())
                          : isSubmitAndContinue == true && isSubmitAndContinueNext==false
                              ?   SizedBox(
                                  width: double.maxFinite,
                                  child: submitAndContinueNextButton())
                              :const SizedBox.shrink()
                      : continueAndConfirmClicked == true
                          ? verifyGSTIN == true
                              ? SizedBox(
                                  width: double.maxFinite,
                                  child: confirmBankDetailsButton())
                              : SizedBox(
                                  width: double.maxFinite,
                                  child: verifyGSTINButton(),
                                )
                          : isLoad == true || widget.picture != null
                              ? uploadButtonClick == true
                                  ? const SizedBox.shrink()
                                  : SizedBox(
                                      width: double.maxFinite,
                                      child: uploadPan(),
                                    )
                              : benefit(),
                  uploadButtonClick == true
                      ? SizedBox(
                          width: double.maxFinite,
                          child: verifyAadhaarButton(),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          )),
    );
  }

  enterOtpBottomSheet() {
    return showModalBottomSheet(
        context: context,
        backgroundColor: const Color(0xffFFFFFF),
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                width: double.infinity,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/enterOtpIcon.svg',
                      height: 75,
                      width: 75,
                    ),
                    const SizedBox(height: 29),
                    Text(
                      'Enter OTP',
                      style: styleText(
                          fontWeight: FontWeight.w600, fontSize: 28.0),
                    ),
                    const SizedBox(height: 11),
                    Container(
                      width: 52,
                      height: 2,
                      color: const Color(0xffB212CA),
                    ),
                    const SizedBox(height: 60),
                    RichText(
                      text: const TextSpan(
                          text: 'Enter OTP Sent To Your Aadhaar Linked',
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xff272727)),
                          children: [
                            TextSpan(
                                text: ' Mobile Number',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff272727)))
                          ]),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 19),
                        child: PinCodeFields(
                          onComplete: (String value) {},
                          borderColor: const Color(0xff666666),
                          fieldBorderStyle: FieldBorderStyle.bottom,
                          fieldWidth: 48,
                          fieldHeight: 45,
                          fieldBackgroundColor: const Color(0xffFBEEFE),
                          length: 6,
                        )),
                    resendOtpCounter(),
                    const SizedBox(height: 18),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'Wrong Aadhaar Number? ',
                        style: styleText(
                            fontWeight: FontWeight.w300, fontSize: 16.0),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16.0,
                                color: Color(0xffB212CA),
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xffB212CA),
                                fontFamily: 'Readex_Pro'),
                          ))
                    ]),
                    const SizedBox(height: 48),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                          width: double.maxFinite,
                          child: confirmAndContinueButton()),
                    ),
                    const SizedBox(height: 43),
                  ],
                )),
          );
        });
  }

  resendOtpCounter() {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: CustomTimer(
          controller: _controller,
          builder: (state, remaining) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      _controller.reset();
                      _controller.start();
                    },
                    child: const Text("Resend OTP",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xffB212CA),
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xffB212CA),
                            fontFamily: 'Readex_Pro'))),
                Text(
                  ' in: ',
                  style: styleText(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xffB212CA),
                  ),
                ),
                Text("${remaining.minutes}: ${remaining.seconds}s",
                    style: styleText(fontSize: 14.0))
              ],
            );
          }),
    );
  }

  ElevatedButton verifyAadhaarButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          verifyAadhaar = true;
          uploadButtonClick = false;
        });
        _controller.start();
        enterOtpBottomSheet();
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xff461AA3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          "Verify Aadhaar",
          style: styleText(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  ElevatedButton verifyGSTINButton() {
    return ElevatedButton(
      onPressed: () {
        if (gstinFormKey.currentState?.validate() == true) {
          setState(() {
            verifyGSTIN = true;
          });
        }
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xff461AA3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          "Verify",
          style: styleText(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  ElevatedButton confirmBankDetailsButton() {
    return ElevatedButton(
      onPressed: () {
        if (bankFormKey.currentState?.validate() == true) {
          activeStep = 2;

          setState(() {
            confirmBankDetails = true;
          });
        }
        if (companyNickNameController.text.isEmpty) {
          setState(() {
            companyNameError = !companyNameError;
          });
        } else {
          setState(() {
            companyNameError = !companyNameError;
          });
        }
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xff461AA3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          "Confirm and Continue",
          style: styleText(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  ElevatedButton confirmAndContinueButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          activeStep = 1;
          continueAndConfirmClicked = true;
        });
        Navigator.pop(context);
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xff461AA3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          "Confirm and Continue",
          style: styleText(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  ElevatedButton uploadPan() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          uploadButtonClick = true;
        });
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xff461AA3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          "Upload",
          style: styleText(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  ElevatedButton submitAndContinueButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isSubmitAndContinue = true;
          confirmBankDetails=false;
        });
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xff461AA3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          "Submit and Continue",
          style: styleText(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  ElevatedButton submitAndContinueNextButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isSubmitAndContinueNext = true;
          activeStep = 4;
          isSubmitAndContinueDone = true;
          isSubmitAndContinue = false;
        });
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xff461AA3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          "Submit and Continue",
          style: styleText(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  browseImage() async {
    setState(() {});
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

  openCamera() async {
    await availableCameras().then((value) => Navigator.push(context,
        MaterialPageRoute(builder: (_) => TakeAPhoto(cameras: value))));
  }

  Widget upload() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
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
            '${activeStep == 0 ? 0 : activeStep==1?35:activeStep==2?70:activeStep==3?90:activeStep==4?100:isSubmitAndContinueNext==true?90:100}% completed',
            textAlign: TextAlign.start,
            style: styleText(
                color: Colors.purple,
                fontSize: 14.0,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 10,
          ),
          isSubmitAndContinueDone == true
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 5),
                    child: SvgPicture.asset('assets/images/success.svg'),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Text(
                    'Thank You,',
                    style: styleText(
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                        color: Color(0xff27272727)),
                  ),
                  Text(
                    'Hemant Kumar!',
                    style: styleText(
                        fontSize: 32.0,
                        color: Color(0xffB212CA),
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  SizedBox(
                      width: 170,
                      child: Text(
                        'Your KYC details are submitted successfully',
                        textAlign: TextAlign.center,
                        style: styleText(
                            color: Color(0xff676767),
                            fontWeight: FontWeight.w300,
                            fontSize: 16.0),
                      )),
                  const SizedBox(
                    height: 34,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Have any queries?',
                          style: styleText(
                              fontSize: 16.0, color: Color(0xff272727)),
                        ),
                        Text(
                          'Reach out to us, our customer support team will assist you.',
                          style: styleText(
                              color: Color(0xff272727B3),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/mailIcon.svg',
                              height: 22,
                              width: 22,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text('support@briskpe.com',
                                style: styleText(
                                    fontSize: 12.0,
                                    color: Color(0xff272727))),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'aassets/images/whatsappIcon.svg',
                              height: 22,
                              width: 22,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '+91- 123 456 7890',
                              style: styleText(
                                  fontSize: 12.0, color: Color(0xff272727)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
              : Column(
                  children: [

                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffFEF9FF),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: isSubmitAndContinue == true
                          ? const BusinessBankAccountForm()
                          : activeStep == 2
                              ? bankFormKey.currentState?.validate() == true
                                  ? const BeneficiaryOwnerForm()
                                  : const SizedBox.shrink()
                              : activeStep == 1
                                  ? verifyGSTIN == false
                                      ? const EnterGSTIN()
                                      : const BusinessDetailsForm()
                                  : Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12.0),
                                          child: Column(
                                            children: [
                                              titleAndDescription(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              isBrowse == true
                                                  ? dotBorderBoxBrowse()
                                                  : dotBorderBox(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        isLoad == true || widget.picture != null
                                            ? uploadButtonClick == true
                                                ? Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        'To upload a different PAN',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: styleText(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 16.0,
                                                            color: const Color(
                                                                0xff272727)),
                                                      ),
                                                      TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              uploadButtonClick =
                                                                  false;
                                                            });
                                                          },
                                                          child: const Text(
                                                            'Click here',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffB212CA),
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline),
                                                          )),
                                                    ],
                                                  )
                                                : const SizedBox.shrink()
                                            : verticalSteps()
                                      ],
                                    ),
                    ),
                    uploadButtonClick == true && activeStep != 1
                        ? const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8.0),
                            child: PANAndAadhaarForm(),
                          )
                        : const SizedBox.shrink(),
                  ],
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
      child: uploadButtonClick == true
          ? ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(
                File(widget.picture!.path),
                fit: BoxFit.cover,
                width: 281,
                height: 170,
              ))
          : Padding(
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
      child: uploadButtonClick == true
          ? ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(
                File(file.path),
                fit: BoxFit.cover,
                width: 281,
                height: 170,
              ))
          : Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 14.0,
              ),
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
        ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.file(
              File(widget.picture!.path),
              fit: BoxFit.cover,
              width: 281,
              height: 170,
            )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 60),
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
                    if (result == null) {
                      openCamera();
                    } else {
                      browseImage();
                    }
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
        ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.file(
              File(file.path),
              fit: BoxFit.cover,
              width: 281,
              height: 170,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
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
                    if (result == null) {
                      openCamera();
                    } else {
                      browseImage();
                    }
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
                color: const Color(0xff272727))),
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
        onPressed: () async {
          setState(() {});
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
