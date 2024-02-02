import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import 'package:cool_alert/cool_alert.dart';

class SubmitDialog extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SubmitDialog({required this.formKey, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      dispose: (state) {
        state.controller?.submitForm.onClose();
      },
      builder: (controller) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                ),
                child: const Text(
                  'ถัดไป',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    controller.addCowController
                        .futureCowData(controller.submitForm.getSubmitData())
                        .then(
                      (status) {
                        if (status == 'true') {
                          showSuccessAlert(context);
                        } else {
                          showErrorAlert(context);
                        }
                      },
                    );
                  } else {
                    CoolAlert.show(
                    context: context,
                    type: CoolAlertType.info,
                    title: "กรุณาระบุข้อมูลให้ครบก่อน",
                    backgroundColor: Colors.blue[200]!,
                    borderRadius: 10.0);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

// void showLoadingAlert(BuildContext context) {
//   CoolAlert.show(
//     context: context,
//     type: CoolAlertType.loading,
//     text: 'กำลังอัปโหลดข้อมูล...',
//     barrierDismissible: false,
//   );
// }

void showSuccessAlert(BuildContext context) {
  Future.delayed(Duration.zero, () {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      title: "บันทึกข้อมูลสำเร็จแล้ว",
      backgroundColor: Colors.greenAccent,
      borderRadius: 10.0,
    );
  });
}

void showErrorAlert(BuildContext context) {
  Future.delayed(Duration.zero, () {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      title: "บันทึกข้อมูลไม่สำเร็จ",
      backgroundColor: Colors.redAccent,
      borderRadius: 10.0,
    );
  });
}
