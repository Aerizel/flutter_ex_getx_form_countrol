class CowHerdModel {
  late String herd;

  CowHerdModel ({
    required this.herd,
  });

  CowHerdModel.fromJson(Map<String, dynamic> json) {
    herd = (json['name']);
  }
}