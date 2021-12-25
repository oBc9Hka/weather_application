import 'package:dash_painter/dash_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import 'package:weather_application/bloc/forecast_event.dart';
import 'package:weather_application/bloc/forecast_state.dart';
import 'package:weather_application/models/forecast.dart';
import 'package:weather_application/ui/forecast_page.dart';
import 'package:weather_application/ui/today_page.dart';
import 'package:weather_application/ui/today_page_wide.dart';
import 'package:weather_application/ui/widgets/custom_app_bar_bottom.dart';
import 'package:weather_application/ui/widgets/custom_flutter_app_icons.dart';
import 'package:weather_application/ui/widgets/custom_progress_indicator.dart';
import 'package:weather_application/ui/widgets/forecast_widgets/forecast_error.dart';
import 'package:weather_application/ui/widgets/geolocation_widgets/geolocation_loading.dart';
import 'package:weather_application/ui/widgets/geolocation_widgets/geolocation_loading_error.dart';

import '../bloc/forecast_bloc.dart';
import '../models/tab_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _cityName = 'Searching...';

  static const double bottomNavigationIconSize = 24;
  final List<TabItem> _bottomBarIcons = [
    TabItem(title: 'Today', icon: Icons.wb_sunny_outlined),
    TabItem(title: 'Forecast', icon: CustomIcons.cloud_sun)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<List<ListElement>> _forecastSplit(List<ListElement> list) {
    List<ListElement> today = [];
    List<ListElement> forecast1 = [];
    List<ListElement> forecast2 = [];
    List<ListElement> forecast3 = [];
    List<ListElement> forecast4 = [];
    List<ListElement> forecast5 = [];

    List<List<ListElement>> _forecastsForWeek = [
      today,
      forecast1,
      forecast2,
      forecast3,
      forecast4,
      forecast5,
    ];
    int index = list.first.dtTxt.weekday;

    for (int i = 0; i < 6; i++) {
      if (index == 7) {
        try {
          _forecastsForWeek[i] = list.sublist(
            list.indexOf(
                list.firstWhere((element) => element.dtTxt.weekday == index)),
            list.indexOf(
                list.firstWhere((element) => element.dtTxt.weekday == 1)),
          );
        } catch (_) {
          _forecastsForWeek[i] = list.sublist(
            list.indexOf(
                list.firstWhere((element) => element.dtTxt.weekday == index)),
            list.length,
          );
        }
        index = 0;
      } else {
        try {
          _forecastsForWeek[i] = list.sublist(
            list.indexOf(
                list.firstWhere((element) => element.dtTxt.weekday == index)),
            list.indexOf(list
                .firstWhere((element) => element.dtTxt.weekday == index + 1)),
          );
        } catch (_) {
          _forecastsForWeek[i] = list.sublist(
            list.indexOf(
                list.firstWhere((element) => element.dtTxt.weekday == index)),
            list.length,
          );
          break;
        }
      }

      index++;
    }

    for (int i = 0; i < 6; i++) {
      if (_forecastsForWeek.last.isEmpty) {
        _forecastsForWeek.removeLast();
        break;
      }
    }

    return _forecastsForWeek;
  }

  void _onSharePressed(City city, ListElement weather) {
    Share.share('''Forecast for ${city.name}:
Temperature: ${weather.main.temp}°C
Weather: ${weather.weather.first.description}
Humidity: ${weather.main.humidity}%
Pressure: ${weather.main.pressure} hPa
Wind speed: ${(weather.wind.speed / 3.6).round()} km/h
Date: ${weather.dtTxt.day}.${weather.dtTxt.month}.${weather.dtTxt.year}''');
  }

  @override
  Widget build(BuildContext context) {
    final ForecastBloc forecastBloc = context.read<ForecastBloc>();
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ForecastBloc, ForecastState>(
          builder: (BuildContext context, state) {
            return Text(
              _selectedIndex == 0 ? 'Today' : _cityName,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            );
          },
        ),
        bottom: const CustomAppBarBottom(),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: BlocBuilder<ForecastBloc, ForecastState>(
        builder: (BuildContext context, state) {
          if (state is ForecastEmptyState) {
            forecastBloc.add(ForecastRequestedEvent());
            return const Center(child: Text('Loading...'));
          } else if (state is ForecastGettingGeolocationState) {
            return const Center(
              child: GeolocationLoading(),
            );
          } else if (state is ForecastLoadingState) {
            return const Center(
              child: CustomCircularProgressIndicator(),
            );
          } else if (state is ForecastLoadedState) {
            _cityName = state.loadedForecast.city.name;
            if (_selectedIndex == 0) {
              if ((MediaQuery.of(context).size.width >
                  MediaQuery.of(context).size.height)) {
                return TodayPageWide(
                  city: state.loadedForecast.city,
                  currentWeather: state.loadedForecast.list[0],
                  onSharePressed: () {
                    _onSharePressed(
                      state.loadedForecast.city,
                      state.loadedForecast.list[0],
                    );
                  },
                );
              } else {
                return TodayPage(
                  currentWeather: state.loadedForecast.list[0],
                  city: state.loadedForecast.city,
                  onSharePressed: () {
                    _onSharePressed(
                      state.loadedForecast.city,
                      state.loadedForecast.list[0],
                    );
                  },
                );
              }
            } else {
              return ForecastPage(
                forecast: state.loadedForecast,
                forecastList: _forecastSplit(state.loadedForecast.list),
              );
            }
          } else if (state is ForecastErrorState) {
            return Center(
              child: ForecastError(
                onRetryPressed: () {
                  forecastBloc.add(ForecastRequestedEvent());
                },
              ),
            );
          } else if (state is ForecastGeolocationErrorState) {
            return Center(
              child: GeolocationError(
                onRetryPressed: () {
                  forecastBloc.add(ForecastRequestedEvent());
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          ..._bottomBarIcons.map(
            (item) => BottomNavigationBarItem(
              icon: Container(
                decoration: DashDecoration(
                  gradient: const SweepGradient(
                    colors: [
                      Colors.grey,
                      Colors.grey,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    item.icon,
                    size: bottomNavigationIconSize,
                  ),
                ),
              ),
              label: item.title,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
