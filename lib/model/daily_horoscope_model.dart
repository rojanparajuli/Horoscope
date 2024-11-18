
class DailyHoroscope {
  Data? data;
  int? status;
  bool? success;

  DailyHoroscope({
    this.data,
    this.status,
    this.success,
  });

  factory DailyHoroscope.fromJson(Map<String, dynamic> json) => DailyHoroscope(
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
  String? date;
  String? horoscopeData;

  Data({
    this.date,
    this.horoscopeData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        date: json["date"],
        horoscopeData: json["horoscope_data"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "horoscope_data": horoscopeData,
      };
}




