/// Response models for the Date Calculator API.

/// API Response wrapper.
class DatecalculatorResponse {
  final String status;
  final dynamic error;
  final DatecalculatorData? data;

  DatecalculatorResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory DatecalculatorResponse.fromJson(Map<String, dynamic> json) => DatecalculatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? DatecalculatorData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Date Calculator API.

class DatecalculatorData {
  int? minutes;
  int? hours;
  int? days;
  int? weeks;
  int? months;
  int? years;
  DatecalculatorDataStart? start;
  DatecalculatorDataEnd? end;

  DatecalculatorData({
    this.minutes,
    this.hours,
    this.days,
    this.weeks,
    this.months,
    this.years,
    this.start,
    this.end,
  });

  factory DatecalculatorData.fromJson(Map<String, dynamic> json) => DatecalculatorData(
      minutes: json['minutes'],
      hours: json['hours'],
      days: json['days'],
      weeks: json['weeks'],
      months: json['months'],
      years: json['years'],
      start: json['start'] != null ? DatecalculatorDataStart.fromJson(json['start']) : null,
      end: json['end'] != null ? DatecalculatorDataEnd.fromJson(json['end']) : null,
    );
}

class DatecalculatorDataStart {
  String? date;
  String? day;
  String? month;
  String? year;
  String? words;

  DatecalculatorDataStart({
    this.date,
    this.day,
    this.month,
    this.year,
    this.words,
  });

  factory DatecalculatorDataStart.fromJson(Map<String, dynamic> json) => DatecalculatorDataStart(
      date: json['date'],
      day: json['day'],
      month: json['month'],
      year: json['year'],
      words: json['words'],
    );
}

class DatecalculatorDataEnd {
  String? date;
  String? day;
  String? month;
  String? year;
  String? words;

  DatecalculatorDataEnd({
    this.date,
    this.day,
    this.month,
    this.year,
    this.words,
  });

  factory DatecalculatorDataEnd.fromJson(Map<String, dynamic> json) => DatecalculatorDataEnd(
      date: json['date'],
      day: json['day'],
      month: json['month'],
      year: json['year'],
      words: json['words'],
    );
}

class DatecalculatorRequest {
  String start;
  String end;

  DatecalculatorRequest({
    required this.start,
    required this.end,
  });

  Map<String, dynamic> toJson() => {
      'start': start,
      'end': end,
    };
}
