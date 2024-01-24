import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/label.dart';

class CowBreedsText extends StatelessWidget {
  const CowBreedsText({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.pink[400]),
                    const SizedBox(width: 10.0),
                    Text(
                      labelBreedsInfo,
                      style: TextStyle(fontSize: 18, color: Colors.pink[400]),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                const Text(
                  labelBreedsPercent,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Transform(
                  transform: Matrix4.skewX(-0.3),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "/100%",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
