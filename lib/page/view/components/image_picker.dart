import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      dispose: (state) {
        state.controller?.imageController.onClose();
      },
      builder: (controller) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            DottedBorder(
              color: Colors.pink,
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              dashPattern: const [12, 12],
              strokeWidth: 2,
              strokeCap: StrokeCap.round,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Center(
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.grey[600],
                      child: Obx(
                        () {
                          if (controller.imageController.selectedImagePath.value
                              .isNotEmpty) {
                            // If an image is selected, display it
                            return Image.file(
                              File(controller
                                  .imageController.selectedImagePath.value),
                              fit: BoxFit.cover,
                            );
                          } else {
                            // If no image is selected, display the upload button
                            return Center(
                              child: Center(
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Image.asset(
                                            "assets/images/cow-icon-image.png"),
                                      ),
                                    ),
                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.imageController
                                                  .pickGalleyImage();
                                            },
                                            child: Container(
                                              width: 140,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                      Icons
                                                          .cloud_upload_outlined,
                                                      color: Colors.white,
                                                      size: 40),
                                                  SizedBox(height: 5),
                                                  Text("อัปโหลดรูปภาพ",
                                                      style: TextStyle(
                                                          color: Colors.white),),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Text(
                                              "หรือ",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 110,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.pink[400],
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    Icons.camera_alt,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "ถ่ายรูป",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              onPressed: () {
                                                controller.imageController
                                                    .pickCameraImage();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () {
                if (controller.imageController.selectedImagePath.isNotEmpty) {
                  return Positioned(
                    top: -25,
                    right: 5,
                    child: IconButton(
                      icon: const Icon(
                        Icons.cancel_rounded,
                        color: Colors.redAccent,
                        size: 60,
                      ),
                      onPressed: () {
                        controller.imageController.clearSelectedImage();
                      },
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
