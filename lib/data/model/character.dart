class Character {
  late int charId;
  late String name;
  late List<dynamic> occupation;
  late String image;
  late String status;
  late String nickName;
  late List<dynamic> appearance;
  late String acotrName;
  late String categoryForTwoSeries;
  late List<dynamic> betterCallSaulAppearance;

  Character.fromJson(Map<String,dynamic> json){
    charId = json['char_id'];
    name= json['name'];
    occupation = json['occupation'];
    image = json['img'];
    nickName = json['nickname'];
    status = json['status'];
    appearance = json['appearance'];
    acotrName = json['portrayed'];
    categoryForTwoSeries = json['category'];
    betterCallSaulAppearance = json['better_call_saul_appearance'];
  }
}
