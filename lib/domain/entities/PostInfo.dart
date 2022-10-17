class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  final int count;
  final int pages;
  final String next;
  final String prev;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"]??"",
    prev: json["prev"]??"",
  );

}