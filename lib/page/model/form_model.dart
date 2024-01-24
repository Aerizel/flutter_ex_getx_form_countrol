class InformBabyCow {
  late String cowFather;
  late String cowMother;
  late String cowNumber;
  late int nid;
  late int rfid;
  late int dpo;
  late String cowName;
  late DateTime birthDate;
  late String gender;
  late String status;
  late String breeds;
  late String house;
  late String pack;

  InformBabyCow({
   this.cowFather = '',
   this.cowMother = '',
   this.cowNumber = '',
   this.nid = 0,
   this.rfid = 0,
   this.dpo = 0,
   this.cowName = '',
   DateTime? birthDate,
   this.gender = 'female',
   this.status = 'ลูกโค',
   this.breeds = '',
   this.house = '',
   this.pack = '',
  }) : birthDate = birthDate ?? DateTime.now(); 

  InformBabyCow.fromJson(Map<String, dynamic>json) {
    cowFather = json['cow'];
    cowMother = json[''];
    cowNumber = json[''];
    nid = json[''];
    rfid = json[''];
    dpo = json[''];
    cowName = json[''];
    birthDate = json[''];
    gender = json[''];
    status = json[''];
    breeds = json[''];
    house = json[''];
    pack = json[''];
  }
}