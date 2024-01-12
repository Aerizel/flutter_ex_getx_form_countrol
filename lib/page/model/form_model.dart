class InformBabyCow {
  String cowFather;
  String cowMother;
  String cowNumber;
  int nid;
  int rfid;
  int dpo;
  String cowName;
  DateTime birthDate;
  String gender;
  String status;
  String breeds;
  String house;
  String pack;

  InformBabyCow({
   this.cowFather = '',
   this.cowMother = '',
   this.cowNumber = '',
   this.nid = 0,
   this.rfid = 0,
   this.dpo = 0,
   this.cowName = '',
   DateTime? birthDate,
   this.gender = '',
   this.status = '',
   this.breeds = '',
   this.house = '',
   this.pack = '',
  }) : birthDate = birthDate ?? DateTime.now(); 
}