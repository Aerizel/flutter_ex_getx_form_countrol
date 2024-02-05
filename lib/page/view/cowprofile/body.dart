import 'package:flutter/material.dart';
import 'package:getx_form_countrol/page/view/cowprofile/edit_cow.dart';
import '../../model/cow_list_model.dart';
import '../../model/label.dart';
import '../format_Date.dart';
import './cow_image.dart';
import './delete_cow.dart';

class CowProfile extends StatelessWidget {
  final CowListModel cowList;
  const CowProfile({super.key, required this.cowList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลของโค'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: CowImage(),
            ),
            SizedBox(
              width: 130,
              height: 40,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'เปลี่ยนรูปภาพ',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Positioned(
                        top: -25,
                        right: 2,
                        child: EditCow(),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('$profileCowName : ${cowList.cowName}'),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                '$profileCowBirthDate : ${FormatDates.formatDatetoTH(cowList.cowBirthDate)}'),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                '$profileCowGender : ${cowList.cowGender}'),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                '$profileCowStatus : ${cowList.cowStatus}'),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                '$profileCowShelter : ${cowList.cowShelter}'),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('$profileCowHerd : ${cowList.cowherd}'),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const DeleteCow(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
