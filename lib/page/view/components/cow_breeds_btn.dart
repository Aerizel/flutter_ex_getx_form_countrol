import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/label.dart';

class CowBreedsBtn extends StatelessWidget {
  const CowBreedsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      dispose: (state) {
        state.controller?.breedsController.onClose();
      },
      builder: (controller) {
        return Center(
          child: Obx(
            () {
              return Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          controller.breedsController.buttonStatus.toString() ==
                                  'breeds5'
                              ? Colors.blue[400]
                              : Colors.grey[500],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(30),
                      ),
                    ),
                    child: const Text(
                      labelBreedsBtn1,
                      style: TextStyle(fontSize: 14),
                    ),
                    onPressed: () {
                      controller.breedsController.switchBreeds(1);
                      controller.submitForm.updateBreeds('5 breeds');
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          controller.breedsController.buttonStatus.toString() ==
                                  'breeds8'
                              ? Colors.blue[400]
                              : Colors.grey[500],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(30),
                      ),
                    ),
                    child: const Text(
                      labelBreedsBtn2,
                      style: TextStyle(fontSize: 14),
                    ),
                    onPressed: () {
                      controller.breedsController.switchBreeds(2);
                      controller.submitForm.updateBreeds('8 breeds');
                    },
                  ),
                  SizedBox(
                    width: 110,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(30),
                        ),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.compare_arrows),
                          SizedBox(width: 5),
                          Text(
                            labelBreedsBtn3,
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                      onPressed: () {
                        controller.breedsController.switchBreeds(3);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
