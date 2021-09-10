class SlidePageMenuItem {
  int id;
  String title;
  String link;
  int slideType;
  int index;

  SlidePageMenuItem(
      {required this.id,
      required this.title,
      required this.link,
      required this.slideType,
      required this.index});

  factory SlidePageMenuItem.fromJson(Map<dynamic, dynamic> json) {
    return SlidePageMenuItem(
        id: json['id'],
        title: json['title'],
        link: json['link'],
        slideType: json['slide_type'],
        index: json['index']);
  }

  static List<SlidePageMenuItem> getSlidePageMenuList(List<dynamic> datas) {
    List<SlidePageMenuItem> dataList = [];
    for (Map<dynamic, dynamic> data in datas) {
      dataList.add(SlidePageMenuItem.fromJson(data));
    }
    return dataList;
  }
}
