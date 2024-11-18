


class WeeklyHoroscope {
    Data? data;
    int ?status;
    bool ?success;

    WeeklyHoroscope({
        this.data,
        this.status,
        this.success,
    });

    factory WeeklyHoroscope.fromJson(Map<String, dynamic> json) => WeeklyHoroscope(
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
    String? horoscopeData;
    String? week;

    Data({
        this.horoscopeData,
        this.week,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        horoscopeData: json["horoscope_data"],
        week: json["week"],
    );

    Map<String, dynamic> toJson() => {
        "horoscope_data": horoscopeData,
        "week": week,
    };
}
