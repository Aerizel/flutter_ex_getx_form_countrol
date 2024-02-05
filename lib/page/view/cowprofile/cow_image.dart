import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../controller/main_controller.dart';

class CowImage extends StatelessWidget {
  const CowImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      dispose: (state) {
        state.controller?.imageController.onClose();
      },
      builder: (controller) {
        return DottedBorder(
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
                  child: Builder(
                    builder: (context) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child:
                              Image.asset("assets/images/cow-icon-image.png"),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
