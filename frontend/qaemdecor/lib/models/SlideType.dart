class SlideType {
  int id;
  String name;
  SlideType(this.id, this.name);
  factory SlideType.fromJson(Map<dynamic, dynamic> json) {
    return SlideType(json['id'], json['name']);
  }

  @override
  String toString() {
    return '$id:$name';
  }

  static List<SlideType> getSlideTypeList(List<dynamic> datas) {
    List<SlideType> dataList = [];
    for (Map<dynamic, dynamic> data in datas) {
      dataList.add(SlideType.fromJson(data));
    }
    print(dataList);
    return dataList;
  }
}
