class LogoImage {
  String name;
  String imageFile;

  LogoImage({
    required this.name,
    required this.imageFile,
  });

  factory LogoImage.fromJson(Map<dynamic, dynamic> json) {
    return LogoImage(
      name: json['name'],
      imageFile: json['imageFile'],
    );
  }
}
