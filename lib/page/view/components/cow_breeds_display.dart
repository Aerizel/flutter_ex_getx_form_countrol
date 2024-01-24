import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/label.dart';

class CowBreedsDisplay extends StatelessWidget {
  const CowBreedsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      dispose: (state) {
        state.controller?.breedsController.onClose();
      },
      builder: (controller) {
        return Obx(
          () {
            if (controller.breedsController.buttonStatus.isNotEmpty) {
              return Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: controller
                                    .breedsController.buttonStatus.isNotEmpty
                                ? const Center(
                                    child: Text(
                                    "เจอร์ซี่",
                                    style: TextStyle(fontSize: 18),
                                  ))
                                : const Center(
                                    child: Text("ไม่ทราบสายพันธุ์",
                                        style: TextStyle(fontSize: 18)))),
                        Positioned(
                          top: -10,
                          left: 12,
                          child: Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: const Text(
                              labelBreeds,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: controller.breedsController.showRatio.isTrue
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("100"),
                                    const Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text("+"),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text("0"),
                                        SizedBox(
                                            width: 40,
                                            child: Divider(
                                              color: Colors.black,
                                              thickness: 1,
                                              height: 1,
                                            )),
                                        Text("512"),
                                      ],
                                    ),
                                  ],
                                )
                              : const Center(
                                  child: Text(
                                    "50.00 %",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                        ),
                        Positioned(
                          top: -10,
                          left: 12,
                          child: Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: const Text(
                              labelBreeds,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}
