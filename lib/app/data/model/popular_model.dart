class PopularModel {
  PopularModel({
    this.method,
    this.status,
    this.results = const <ResultPopular>[],
  });

  PopularModel.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    status = json['status'];
    if (json['results'] != null) {
      results = <ResultPopular>[];
      json['results'].forEach((v) {
        results!.add(ResultPopular.fromJson(v));
      });
    }
  }
  String? method;
  bool? status;
  List<ResultPopular>? results;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['method'] = method;
    data['status'] = status;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultPopular {
  ResultPopular({
    this.title,
    this.thumb,
    this.key,
    this.times,
    this.serving,
    this.difficulty,
  });

  ResultPopular.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumb = json['thumb'];
    key = json['key'];
    times = json['times'];
    serving = json['serving'];
    difficulty = json['difficulty'];
  }
  String? title;
  String? thumb;
  String? key;
  String? times;
  String? serving;
  String? difficulty;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['thumb'] = thumb;
    data['key'] = key;
    data['times'] = times;
    data['serving'] = serving;
    data['difficulty'] = difficulty;
    return data;
  }
}
