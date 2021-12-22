class Forecast {
  final List<ListElement> list;
  final City city;

  Forecast({
    required this.list,
    required this.city,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        city: City.fromJson(json["city"]),
      );
}

class City {
  final int id;
  final String name;
  final Coord coord;
  final String country;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: Coord.fromJson(json["coord"]),
        country: json["country"],
      );
}

class Coord {
  final double lat;
  final double lon;

  Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"],
        lon: json["lon"],
      );
}

class ListElement {
  final int dt;
  final MainClass main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final DateTime dtTxt;
  final Rain? rain;
  final Rain? snow;

  ListElement({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.dtTxt,
    this.rain,
    this.snow,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: MainClass.fromJson(json["main"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: Clouds.fromJson(json["clouds"]),
        wind: Wind.fromJson(json["wind"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
        rain: json['rain'] == null ? null : Rain.fromJson(json["rain"]),
        snow: json["snow"] == null ? null : Rain.fromJson(json["snow"]),
      );
}

class Clouds {
  final int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );
}

class MainClass {
  final int temp;
  final int pressure;
  final int humidity;

  MainClass({
    required this.temp,
    required this.pressure,
    required this.humidity,
  });

  factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"].round(),
        pressure: json["pressure"],
        humidity: json["humidity"],
      );
}

class Rain {
  final double the3H;

  Rain({
    required this.the3H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the3H: json["3h"],
      );
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"], //?? mainEnumValues.map[json["main"]],
        description: json["description"],
        icon: json["icon"],
      );
}

enum MainEnum { clear, clouds, rain }

final mainEnumValues = EnumValues({
  "Clear": MainEnum.clear,
  "Clouds": MainEnum.clouds,
  "Rain": MainEnum.rain
});

class Wind {
  final double speed;
  final int deg;

  Wind({
    required this.speed,
    required this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"],
        deg: json["deg"],
      );
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1)}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
// enum WeatherState {
//   snow,
//   rain,
// }
//
// enum WindDirectionCompass {
//   north,
//   northEast,
//   east,
//   southEast,
//   south,
//   southWest,
//   west,
//   northWest,
//   unknown
// }
//
// class Forecast {
//   const Forecast({
//     required this.dateTime,
//     required this.weatherStateName,
//     required this.weatherNameDescription,
//     required this.temp,
//     required this.pop,
//     required this.volume,
//     required this.pressure,
//     required this.windSpeed,
//     required this.windDirectionCompass,
//   });
//
//   final String dateTime;
//   final String weatherStateName;
//   final String weatherNameDescription;
//   final int temp;
//   final int pop;
//   final double volume;
//   final int pressure;
//   final int windSpeed;
//   final WindDirectionCompass windDirectionCompass;
//
//   factory Forecast.fromJson(Map<String, dynamic> json) {
//     return Forecast(
//       dateTime: json['dt_txt'],
//       weatherStateName: json['weather'][0]['main'],
//       weatherNameDescription: json['weather'][0]['description'],
//       temp: json['main']['temp'].round(),
//       pop: json['pop'].round(),
//       volume: (json['weather'][0]['main'] != 'Snow' &&
//               json['weather'][0]['main'] != 'Rain')
//           ? 0.0
//           : json['weather'][0]['main'] == 'Snow'
//               ? json['snow']['3h']
//               : json['rain']['3h'],
//       pressure: json['main']['pressure'].round(),
//       windSpeed: json['wind']['speed'].round(),
//       windDirectionCompass: WindDirectionCompass.east,
//     );
//   }
// }
