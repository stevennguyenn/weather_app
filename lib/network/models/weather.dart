import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  WeatherModel.fromJson(dynamic json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  num? visibility;
  Wind? wind;
  Clouds? clouds;
  num? dt;
  Sys? sys;
  num? timezone;
  num? id;
  String? name;
  num? cod;

  WeatherModel copyWith({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    num? visibility,
    Wind? wind,
    Clouds? clouds,
    num? dt,
    Sys? sys,
    num? timezone,
    num? id,
    String? name,
    num? cod,
  }) =>
      WeatherModel(
        coord: coord ?? this.coord,
        weather: weather ?? this.weather,
        base: base ?? this.base,
        main: main ?? this.main,
        visibility: visibility ?? this.visibility,
        wind: wind ?? this.wind,
        clouds: clouds ?? this.clouds,
        dt: dt ?? this.dt,
        sys: sys ?? this.sys,
        timezone: timezone ?? this.timezone,
        id: id ?? this.id,
        name: name ?? this.name,
        cod: cod ?? this.cod,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (coord != null) {
      map['coord'] = coord?.toJson();
    }
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    map['base'] = base;
    if (main != null) {
      map['main'] = main?.toJson();
    }
    map['visibility'] = visibility;
    if (wind != null) {
      map['wind'] = wind?.toJson();
    }
    if (clouds != null) {
      map['clouds'] = clouds?.toJson();
    }
    map['dt'] = dt;
    if (sys != null) {
      map['sys'] = sys?.toJson();
    }
    map['timezone'] = timezone;
    map['id'] = id;
    map['name'] = name;
    map['cod'] = cod;
    return map;
  }
}

Sys sysFromJson(String str) => Sys.fromJson(json.decode(str));

String sysToJson(Sys data) => json.encode(data.toJson());

class Sys {
  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  Sys.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  num? type;
  num? id;
  String? country;
  num? sunrise;
  num? sunset;

  Sys copyWith({
    num? type,
    num? id,
    String? country,
    num? sunrise,
    num? sunset,
  }) =>
      Sys(
        type: type ?? this.type,
        id: id ?? this.id,
        country: country ?? this.country,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    map['country'] = country;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }
}

Clouds cloudsFromJson(String str) => Clouds.fromJson(json.decode(str));

String cloudsToJson(Clouds data) => json.encode(data.toJson());

class Clouds {
  Clouds({
    this.all,
  });

  Clouds.fromJson(dynamic json) {
    all = json['all'];
  }

  num? all;

  Clouds copyWith({
    num? all,
  }) =>
      Clouds(
        all: all ?? this.all,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = all;
    return map;
  }
}

Wind windFromJson(String str) => Wind.fromJson(json.decode(str));

String windToJson(Wind data) => json.encode(data.toJson());

class Wind {
  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  Wind.fromJson(dynamic json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  num? speed;
  num? deg;
  num? gust;

  Wind copyWith({
    num? speed,
    num? deg,
    num? gust,
  }) =>
      Wind(
        speed: speed ?? this.speed,
        deg: deg ?? this.deg,
        gust: gust ?? this.gust,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    map['gust'] = gust;
    return map;
  }
}

Main mainFromJson(String str) => Main.fromJson(json.decode(str));

String mainToJson(Main data) => json.encode(data.toJson());

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  num? pressure;
  num? humidity;

  Main copyWith({
    num? temp,
    num? feelsLike,
    num? tempMin,
    num? tempMax,
    num? pressure,
    num? humidity,
  }) =>
      Main(
        temp: temp ?? this.temp,
        feelsLike: feelsLike ?? this.feelsLike,
        tempMin: tempMin ?? this.tempMin,
        tempMax: tempMax ?? this.tempMax,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    return map;
  }
}

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  num? id;
  String? main;
  String? description;
  String? icon;

  Weather copyWith({
    num? id,
    String? main,
    String? description,
    String? icon,
  }) =>
      Weather(
        id: id ?? this.id,
        main: main ?? this.main,
        description: description ?? this.description,
        icon: icon ?? this.icon,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }
}

Coord coordFromJson(String str) => Coord.fromJson(json.decode(str));

String coordToJson(Coord data) => json.encode(data.toJson());

class Coord {
  Coord({
    this.lon,
    this.lat,
  });

  Coord.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  num? lon;
  num? lat;

  Coord copyWith({
    num? lon,
    num? lat,
  }) =>
      Coord(
        lon: lon ?? this.lon,
        lat: lat ?? this.lat,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }
}
