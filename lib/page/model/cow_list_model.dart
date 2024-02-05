class CowListModel {
  late String cowName;
  late DateTime cowBirthDate;
  late String cowGender;
  late String cowStatus;
  late String cowShelter;
  late String cowherd;

  CowListModel ({
    required this.cowName,
    required this.cowBirthDate,
    required this.cowGender,
    required this.cowStatus,
    required this.cowShelter,
    required this.cowherd
  });

  CowListModel.fromJson(Map<String, dynamic> json) {
    cowName = (json['cow_name']);
    cowBirthDate = DateTime.parse(json['cow_birthDate']);
    cowGender = (json['cow_gender']);
    cowStatus = (json['cow_status']);
    cowShelter = (json['cow_shelter']);
    cowherd = (json['cow_herd']);
  }
}