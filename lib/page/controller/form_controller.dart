//import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:flutter/material.dart';
import 'package:getx_form_countrol/page/model/form_model.dart';

class SubmitForm extends GetxController {
  var cowFather = InformBabyCow().cowFather;
  var cowMother = InformBabyCow().cowMother;
  var cowNumber = InformBabyCow().cowNumber;
  var nid = InformBabyCow().nid;
  var rfid = InformBabyCow().rfid;
  var dpo = InformBabyCow().dpo;
  var cowName = InformBabyCow().cowName;
  var birthDate = InformBabyCow().birthDate;
  var gender = InformBabyCow().gender;
  var status = InformBabyCow().status;
  var breeds = InformBabyCow().breeds;
  var house = InformBabyCow().house;
  var pack = InformBabyCow().pack;

  //Update method
  void updateCowFather(String value) {
    cowFather = value;
    update();
  }

  void updateCowMother(String value) {
    cowMother = value;
    update();
  } 

  void updateCowNumber(String value) {
    cowNumber = value;
    update();
  }

  void updateNid (int value) {
    nid = value;
    update();
  }

  void updateRfid (int value) {
    rfid = value;
    update();
  }

  void updateDpo(int value) {
    dpo = value;
    update();
  }

  void updateCowName (String value) {
    cowName = value;
    update();
  }

  void updateBirthDate (DateTime value) {
    birthDate = value;
    update();
  }

  void updateGender (String value) {
    gender = value;
    update();
  }

  void updateStatus (String value) {
    status = value;
    update();
  }

  void updateBreeds (String value) {
    breeds = value;
    update();
  }

  void updateHouse (String value) {
    house = value;
    update();
  }

  void updatePack (String value) {
    pack = value;
    update();
  }

}
