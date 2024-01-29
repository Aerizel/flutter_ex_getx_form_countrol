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
        return SizedBox(
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
            onPressed: () {
              if (formKey.currentState!.validate()) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      insetPadding: const EdgeInsets.fromLTRB(0, 140, 0, 140),
                      title: const Text("ข้อมูลที่บันทึก"),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                                'แม่โคที่คลอด: ${controller.submitForm.cowMother}'),
                            Text(
                                'พ่อพันธุ์: ${controller.submitForm.getCowFather()}'),
                            Text('เลขโค ${controller.submitForm.cowNumber}'),
                            Obx(() {
                              if (controller
                                  .additionalController.buttonCowStatus.value) {
                                return Column(
                                  children: [
                                    Text(
                                        'nid: ${controller.submitForm.nid.toString()}'),
                                    Text(
                                        'rfid ${controller.submitForm.rfid.toString()}'),
                                    Text(
                                        'dpo ${controller.submitForm.dpo.toString()}'),
                                  ],
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            }),
                            Text('ชื่อวัว: ${controller.submitForm.cowName}'),
                            Text(
                                'วันเกิด: ${controller.submitForm.birthDate.toString()}'),
                            Text('เพศ: ${controller.submitForm.gender}'),
                            Text('สถานะ: ${controller.submitForm.status}'),
                            Text('สายพันธุ์: ${controller.submitForm.breeds}'),
                            Text('โรงเรือน: ${controller.submitForm.house}'),
                            Text('เลือกฝูง: ${controller.submitForm.pack}'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text("ตกลง"),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            controller.addCowController.uploadCowData(controller.submitForm.getSubmitData());
                            FutureBuilder(
                              future: controller.addCowController.uploadStatus,
                              builder: (context, snapshot) {
                                print(snapshot.data);
                                if (snapshot.hasData) {
                                  String status = snapshot.data as String;
                                  print('status value : $status');
                                  if (status == 'true') {
                                    print('upload complete');
                                    CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.success,
                                      title: "บันทึกข้อมูลสำเร็จแล้ว",
                                      backgroundColor: Colors.greenAccent,
                                      borderRadius: 10.0,
                                    );
                                    return Container();
                                  } else {
                                    print('upload fail');
                                    CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.error,
                                      title: "บันทึกข้อมูลไม่สำเร็จ",
                                      backgroundColor: Colors.redAccent,
                                      borderRadius: 10.0,
                                    );
                                    return Container();
                                  }
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}'),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            );

                            // //controller.addCowController.getCowData();
                            // bool status = await controller.addCowController
                            //     .uploadCowData(controller.submitForm.getSubmitData());

                            // if (status) {
                            //   print('Upload Complete!');
                            //   SnackBar(
                            //     content: const Text('Upload Complete!'),
                            //     action: SnackBarAction(
                            //       label: 'Undo',
                            //       onPressed: () {},
                            //     ),
                            //   );
                            // } else {
                            //   print('Upload Fail.');
                            //   SnackBar(
                            //     content: const Text('Upload Fail.'),
                            //     action: SnackBarAction(
                            //       label: 'Undo',
                            //       onPressed: () {},
                            //     ),
                            //   );
                            // }

                            /*if (context.mounted) {
                              print(status);
                              if (status) {
                                CoolAlert.show(
                                  context: context,
                                  type: CoolAlertType.success,
                                  title: "บันทึกข้อมูลสำเร็จแล้ว",
                                  backgroundColor: Colors.greenAccent,
                                  borderRadius: 10.0,
                                );
                              } else {
                                CoolAlert.show(
                                  context: context,
                                  type: CoolAlertType.error,
                                  title: "บันทึกข้อมูลไม่สำเร็จ",
                                  backgroundColor: Colors.redAccent,
                                  borderRadius: 10.0,
                                );
                              }
                            } */
                          },
                        )
                      ],
                    );
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
        );
      },
    );
  }
}
