class MainRoutePath {
  final bool isUnknown;
  final String? pathName;

  MainRoutePath.home(): isUnknown = false, pathName = null;

  MainRoutePath.unknown(): isUnknown = true , pathName = 'NotFound!';

  MainRoutePath.page(this.pathName): isUnknown = false;

  bool get isHomePage => pathName == null|| pathName == '';

  bool get isOtherPages => pathName != null && pathName != ''; 

}