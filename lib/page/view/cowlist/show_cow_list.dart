import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/cow_list_model.dart';
import '../../model/label.dart';
import '../cowprofile/body.dart';

class ShowCowList extends StatelessWidget {
  const ShowCowList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          titleCowList,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GetBuilder<MainController>(
        init: MainController(),
        dispose: (state) {
          state.controller?.cowListController.onClose();
        },
        builder: (controller) {
          controller.cowListController.fetchCowListData();
          return FutureBuilder(
            future: controller.cowListController.futureCowList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CowListModel> cowList =
                    snapshot.data as List<CowListModel>;
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: cowList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: Colors.grey[400],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                    'assets/images/cow-icon-image.png'),
                              ),
                            ),
                            title: Text(cowList[index].cowName),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                            onTap: () {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) => CowProfile(cowList: cowList[index],)
                                ),
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                            child: Divider(
                              color: Colors.grey[500],
                              thickness: 1,
                            ),
                          );
                        },
                      ),
                      Divider(
                        color: Colors.grey[500],
                        thickness: 1,
                      ),
                    ],
                  ),
                );
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
        },
      ),
    );
  }
}
