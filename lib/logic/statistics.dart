import 'package:json_annotation/json_annotation.dart';

part 'statistics.g.dart';

@JsonSerializable()

class Statistics {
  List<Duration> times;
  int errors;
  DateTime startTime;
  Map<String, String> options;

  Statistics() {
    times = new List();
    errors = 0;
    startTime = DateTime.now();
    options = new Map();
  }

  factory Statistics.fromJson(Map<String, dynamic> json) => _$StatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsToJson(this);
}