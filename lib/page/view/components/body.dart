import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controller/form_controller.dart';
import '../../controller/main_controller.dart';

class AddBirth extends StatelessWidget {
  AddBirth({super.key});

  final ImagePickerController imageController =
      Get.put(ImagePickerController());
  final DatePickerController dateController = Get.put(DatePickerController());
  final GenderController genderController = Get.put(GenderController());
  final BreedsController breedsController = Get.put(BreedsController());
  final BtnNumberCowAddtional btnNumberCowAddtional =
      Get.put(BtnNumberCowAddtional());
  final SubmitForm submitForm = Get.put(SubmitForm());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_rounded, size: 35)),
        title: const Text(
          "แจ้งเกิดลูกโค",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Center(
                            child: Container(
                              height: 300,
                              width: double.infinity,
                              color: Colors.grey[600],
                              child: Obx(() {
                                if (imageController
                                    .selectedImagePath.value.isNotEmpty) {
                                  // If an image is selected, display it
                                  return Image.file(
                                    File(imageController
                                        .selectedImagePath.value),
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
                                              padding:
                                                  const EdgeInsets.all(20.0),
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
                                                    imageController
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
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(
                                                            Icons
                                                                .cloud_upload_outlined,
                                                            color: Colors.white,
                                                            size: 40),
                                                        SizedBox(height: 5),
                                                        Text("อัปโหลดรูปภาพ",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
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
                                                                BorderRadius
                                                                    .circular(
                                                                        5))),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(
                                                          Icons.camera_alt,
                                                          color: Colors.white,
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text(
                                                          "ถ่ายรูป",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                    onPressed: () {
                                                      imageController
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
                              }),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(() {
                      if (imageController.selectedImagePath.isNotEmpty) {
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
                                imageController.clearSelectedImage();
                              },
                            ));
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.pinkAccent),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        //initialValue: 'สร้อย',
                        //controller: submitForm.cowFatherInput,
                        onChanged: (value) {
                          submitForm.updateCowMother(value);
                        },
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                            labelText: 'แม่โคที่คลอด',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 15.0),
                      TextFormField(
                        //initialValue: 'สมทุย',
                        onChanged: (value) {
                          submitForm.updateCowFather(value);
                        },
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                            labelText: 'พ่อพันธุ์/น้ำเชื้อ',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.pinkAccent),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          submitForm.updateCowNumber(value);
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'เบอร์ลูกโค (ระบบฟาร์ม)',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        height: 70,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent[700],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(8)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "เบอร์ลูกโคเพิ่มเติม",
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(Icons.keyboard_arrow_down_rounded, size: 30),
                            ],
                          ),
                          onPressed: () {
                            btnNumberCowAddtional.switchStatus();
                          },
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Obx(() {
                        if (btnNumberCowAddtional.buttonStatus.value) {
                          return Column(
                            children: [
                              TextFormField(
                                onChanged: (value) {
                                  int intValue = int.parse(value);
                                  submitForm.updateNid(intValue);
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'nid',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                //keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(
                                onChanged: (value) {
                                  int intValue = int.parse(value);
                                  submitForm.updateRfid(intValue);
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'rfid',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(
                                onChanged: (value) {
                                  int intValue = int.parse(value);
                                  submitForm.updateDpo(intValue);
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'dpo',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        onChanged: (value) {
                          submitForm.updateCowName(value);
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'ชื่อลูกโค',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Obx(() {
                        return Column(
                          children: [
                            TextFormField(
                                controller: dateController.dateTextController,
                                onChanged: (value) {
                                  DateTime dateTimeValue =
                                      DateTime.parse(value);
                                  submitForm.updateBirthDate(dateTimeValue);
                                },
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                  labelText: 'วันเกิดโค',
                                  labelStyle: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                  border: OutlineInputBorder(),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                                readOnly: true,
                                onTap: () {
                                  dateController.selectedDate(context);
                                }),
                            Transform(
                              transform: Matrix4.skewX(-0.3),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "อายุ: ${dateController.countBirthDate.value} วัน",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                      const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "ประเภทโค",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          )),
                      Obx(() {
                        return Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    genderController.genderType.value ==
                                            'female'
                                        ? Colors.pink[400]
                                        : Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(30),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.female,
                                      color: Colors.pink[400],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'เพศเมีย',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                              onPressed: () {
                                genderController.switchGender('female');
                                submitForm.updateGender('female');
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    genderController.genderType.value == 'male'
                                        ? Colors.blue[400]
                                        : Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(30),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.male,
                                      color: Colors.blue[400],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'เพศผู้',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                genderController.switchGender('male');
                                submitForm.updateGender('male');
                              },
                            ),
                          ],
                        );
                      }),
                      const SizedBox(height: 20.0),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'สถานะนำเข้า',
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                        value: 'ลูกโค',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        icon: const Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                        items: <String>['ลูกโค', 'โคหนุ่ม', 'โคแก่']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          submitForm.updateStatus(value.toString());
                        },
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        "สายพันธุ์",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 10.0),
                      Obx(() {
                        return Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 10,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      breedsController.buttonStatus.toString() ==
                                              'breeds5'
                                          ? Colors.blue[400]
                                          : Colors.grey[500],
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  '5 สายพันธุ์',
                                  style: TextStyle(fontSize: 14),
                                ),
                                onPressed: () {
                                  breedsController.switchBreeds(1);
                                  submitForm.updateBreeds('5 breeds');
                                },
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      breedsController.buttonStatus.toString() ==
                                              'breeds8'
                                          ? Colors.blue[400]
                                          : Colors.grey[500],
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  '8 สายพันธุ์',
                                  style: TextStyle(fontSize: 14),
                                ),
                                onPressed: () {
                                  breedsController.switchBreeds(2);
                                  submitForm.updateBreeds('8 breeds');
                                },
                              ),
                              SizedBox(
                                width: 110,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pink[400],
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(30),
                                    ),
                                  ),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.compare_arrows),
                                      SizedBox(width: 5),
                                      Text(
                                        'สัดส่วน',
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  ),
                                  onPressed: () {
                                    breedsController.switchBreeds(3);
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(height: 20.0),
                      Obx(() {
                        if (breedsController.buttonStatus.isNotEmpty) {
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
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: breedsController
                                                .buttonStatus.isNotEmpty
                                            ? const Center(
                                                child: Text(
                                                "เจอร์ซี่",
                                                style: TextStyle(fontSize: 18),
                                              ))
                                            : const Center(
                                                child: Text("ไม่ทราบสายพันธุ์",
                                                    style: TextStyle(
                                                        fontSize: 18)))),
                                    Positioned(
                                      top: -10,
                                      left: 12,
                                      child: Container(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        child: const Text(
                                          'สายพันธุ์',
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
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: breedsController.showRatio.isTrue
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                          )),
                                  ),
                                  Positioned(
                                    top: -10,
                                    left: 12,
                                    child: Container(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child: const Text(
                                        'สัดส่วน',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Divider(
                          color: Colors.grey[400],
                          height: 3,
                          thickness: 1,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.info_outline,
                                      color: Colors.pink[400]),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    "ข้อมูลสายพันธุ์",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.pink[400]),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                "100",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
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
                      ),
                      const SizedBox(height: 20.0),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'เลือกโรงเรือน',
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                        value: 'เลือกโรงเรือน',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        icon: const Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                        items: <String>[
                          'เลือกโรงเรือน',
                          'โรงเรือน 1',
                          'โรงเรือน 2',
                          'โรงเรือน 3'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          submitForm.updateHouse(value.toString());
                        },
                      ),
                      const SizedBox(height: 20.0),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'เลือกฝูง',
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                        value: 'เลือกฝูง',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        icon: const Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                        items: <String>['เลือกฝูง', 'ฝูง1', 'ฝูง2', 'ฝูง3']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          submitForm.updatePack(value.toString());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
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
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            insetPadding:
                                const EdgeInsets.fromLTRB(0, 140, 0, 140),
                            title: const Text("ข้อมูลที่บันทึก"),
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text('แม่โคที่คลอด: ${submitForm.cowMother}'),
                                  Text('พ่อพันธุ์: ${submitForm.cowFather}'),
                                  Text('เลขโค ${submitForm.cowNumber}'),
                                  Obx(() {
                                    if (btnNumberCowAddtional
                                        .buttonStatus.value) {
                                      return Column(
                                        children: [
                                          Text(
                                              'nid: ${submitForm.nid.toString()}'),
                                          Text(
                                              'rfid ${submitForm.rfid.toString()}'),
                                          Text(
                                              'dpo ${submitForm.dpo.toString()}'),
                                        ],
                                      );
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  }),
                                  Text('ชื่อวัว: ${submitForm.cowName}'),
                                  Text(
                                      'วันเกิด: ${submitForm.birthDate.toString()}'),
                                  Text('เพศ: ${submitForm.gender}'),
                                  Text('สถานะ: ${submitForm.status}'),
                                  Text('สายพันธุ์: ${submitForm.breeds}'),
                                  Text('โรงเรือน: ${submitForm.house}'),
                                  Text('เลือกฝูง: ${submitForm.pack}'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text("ตกลง"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
