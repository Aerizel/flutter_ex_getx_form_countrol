class CowType {
  late String typeName; 

  CowType({
    required this.typeName, 
  });

  CowType.fromJson(Map<String, dynamic> json) {
    typeName = (json['name']); 
  }
}
