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

  //Get method
  InformBabyCow getSubmitData() {
    return InformBabyCow(
      cowFather: cowFather,
      cowMother: cowMother,
      cowNumber: cowNumber,
      nid: nid,
      rfid: rfid,
      dpo: dpo,
      cowName: cowName,
      birthDate: birthDate,
      gender: gender,
      status: status,
      breeds: breeds,
      house: house,
      pack: pack,
    );
  }

  //Update method
  void updateCowFather(String value) {
    cowFather = value;
  }

  String getCowFather() {
    return cowFather;
  }

  void updateCowMother(String value) {
    cowMother = value;
  } 

  void updateCowNumber(String value) {
    cowNumber = value;
  }

  void updateNid (int value) {
    nid = value;
  }

  void updateRfid (int value) {
    rfid = value;
  }

  void updateDpo(int value) {
    dpo = value;
  }

  void updateCowName (String value) {
    cowName = value;
  }

  void updateBirthDate (DateTime value) {
    birthDate = value;
  }

  void updateGender (String value) {
    gender = value;
  }

  void updateStatus (String value) {
    status = value;
  }

  void updateBreeds (String value) {
    breeds = value;
  }

  void updateHouse (String value) {
    house = value;
  }

  void updatePack (String value) {
    pack = value;
  }

}
