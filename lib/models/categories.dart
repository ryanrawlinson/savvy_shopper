class Categories {
  final List<String> categories;

  Categories({this.categories});

  factory Categories.fromJson(List<dynamic> json) {
    return Categories(
      categories: json != null ? List<String>.from(json) : null,
    );
  }

  List<dynamic> toJson() {
    List<dynamic> json = <dynamic>[];
    if (categories != null) {
      json = categories;
    }

    return json;
  }
}
