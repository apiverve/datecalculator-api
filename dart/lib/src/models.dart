/// Response models for the Date Calculator API.

/// API Response wrapper.
class DatecalculatorResponse {
  final String status;
  final dynamic error;
  final DatecalculatorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  DatecalculatorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory DatecalculatorResponse.fromJson(Map<String, dynamic> json) => DatecalculatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? DatecalculatorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Date Calculator API.

class DatecalculatorData {
  num? minutes;
  num? hours;
  num? days;
  num? weeks;
  num? months;
  num? years;
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
