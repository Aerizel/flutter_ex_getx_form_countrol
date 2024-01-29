class CowShelterModel {
  
  late String shelter;

  CowShelterModel ({
    required this.shelter,
  });

  CowShelterModel.fromJson(Map<String, dynamic> json) {
    shelter = (json['name']);
  }

}