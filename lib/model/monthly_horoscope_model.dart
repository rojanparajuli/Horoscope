class MonthlyHoroscope {
  Data? data;
  int? status;
  bool? success;

  MonthlyHoroscope({
    this.data,
    this.status,
    this.success,
  });

  factory MonthlyHoroscope.fromJson(Map<String, dynamic> json) =>
      MonthlyHoroscope(
        data: Data.fromJson(json["data"]),
        status: json["status"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "status": status,
        "success": success,
      };
}

class Data {
  String? challengingDays;
  String? horoscopeData;
  String? month;
  String? standoutDays;

  Data({
    this.challengingDays,
    this.horoscopeData,
    this.month,
    this.standoutDays,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        challengingDays: json["challenging_days"],
        horoscopeData: json["horoscope_data"],
        month: json["month"],
        standoutDays: json["standout_days"],
      );

  Map<String, dynamic> toJson() => {
        "challenging_days": challengingDays,
        "horoscope_data": horoscopeData,
        "month": month,
        "standout_days": standoutDays,
      };
}
