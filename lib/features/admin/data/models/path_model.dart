class PathModel {
  final String level;
  final HouseModel houseModel;
  const PathModel({required this.houseModel, required this.level});
}

class HouseModel {
  final String houseName, houseFullName;

  const HouseModel({required this.houseName, required this.houseFullName});
}
