import 'dart:io';
import 'dart:math';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:davin_app/home/controller/foood_controller.dart';
import 'package:davin_app/home/controller/storage_controller.dart';
import 'package:davin_app/home/model/profile_model.dart';
import 'package:davin_app/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatelessWidget {
  Profile({Key? key,this.profileModel,this.docsId}) ;

  final foodController = Get.put(FoodController());
  final storageController = Get.put(StorageController());
  final profileName = TextEditingController();
  late String imageURL = "";
  late RxBool loading = false.obs;
  late ProfileModel? profileModel;
  late String? docsId;
  update(){
    profileName.text=profileModel!.name;
    imageURL=profileModel!.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(profileModel == null ? 'Add profile' : 'Edit profile'),
        actions: [
          IconButton(
            onPressed: () async {
              openLoading();
              await storageController.uploadFile(XFile(storageController.file!.path));

              if (profileModel == null) {
                await foodController.addProfile(
                  ProfileModel(
                    id: Random().nextInt(10000),
                    name: profileName.text,
                    image: storageController.imageURL,
                  ),
                );
              } else {
                await foodController.updateProfile(
                  model: ProfileModel(
                    id: profileModel!.id,
                    name: profileName.text,
                    image: storageController.file == null ? profileModel!.image : storageController.imageURL,
                  ),
                  id: docsId.toString(),
                );
              }
              closeLoading();
              Get.back();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Obx(
        () => Visibility(
          visible: loading.value,
          replacement: Column(
            children: [
              const SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 2, color: Colors.blue),
                      image: storageController.file != null
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(storageController.file!.path)),
                            )
                          : (profileModel != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(profileModel!.image),
                                )
                              : const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('asset/image/grocery-shopping.jpg'),
                                )),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 15,
                    child: GestureDetector(
                      onTap: () async {
                        showAdaptiveActionSheet(
                          context: context,
                          actions: <BottomSheetAction>[
                            BottomSheetAction(
                              title: const Text('Choose Gallery'),
                              onPressed: (context) async {
                                await storageController.openGallery().whenComplete(() => Get.back());
                              },
                            ),
                            BottomSheetAction(
                              title: const Text('Open Camera'),
                              onPressed: (context) async {
                                await storageController.openCamera().whenComplete(() => Get.back());
                              },
                            ),
                          ],
                          cancelAction: CancelAction(
                            title: const Text('Cancel'),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 94, 94, 94),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 20),
                child: Row(
                  children: [
                    Text(
                      'Full name',style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(height: 10),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InputField(
                  controller: profileName,
                  hintText: 'Name',
                  obscureText: false,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  void openLoading() {
    loading.value = true;
  }

  void closeLoading() {
    loading.value = false;
  }
}
