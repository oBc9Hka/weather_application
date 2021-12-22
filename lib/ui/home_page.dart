import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/bloc/forecast_event.dart';
import 'package:weather_application/bloc/forecast_state.dart';
import 'package:weather_application/models/forecast.dart';
import 'package:weather_application/ui/forecast_page.dart';
import 'package:weather_application/ui/today_page.dart';
import 'package:weather_application/ui/widgets/forecast_error.dart';
import 'package:weather_icons/weather_icons.dart';

import '../bloc/forecast_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _cityName = 'Searching...';

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
    int index = list.first.dtTxt.day;
    for (int i = 0; i < 6; i++) {
      try {
        _forecastsForWeek[i] = list.sublist(
          list.indexOf(
              list.firstWhere((element) => element.dtTxt.day == index)),
          list.indexOf(
              list.firstWhere((element) => element.dtTxt.day == index + 1)),
        );
      } catch (_) {
        _forecastsForWeek[i] = list.sublist(
          list.indexOf(
              list.firstWhere((element) => element.dtTxt.day == index)),
          list.length,
        );
      }
      index++;
    }
    return _forecastsForWeek;
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
                fontWeight: FontWeight.w300,
              ),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: BlocBuilder<ForecastBloc, ForecastState>(
        builder: (BuildContext context, state) {
          if (state is ForecastEmptyState) {
            forecastBloc.add(ForecastRequested());
            return const Center(child: Text('Loading...'));
          } else if (state is ForecastLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.orangeAccent,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          } else if (state is ForecastLoadedState) {
            _cityName = state.loadedForecast.city.name;
            return _selectedIndex == 0
                ? TodayPage(
              currentWeather: state.loadedForecast.list[0],
              city: state.loadedForecast.city,
            )
                : ForecastPage(
              forecast: state.loadedForecast,
              forecastList: _forecastSplit(state.loadedForecast.list),
            );
          } else if (state is ForecastErrorState) {
            return Center(
              child: ForecastError(
                onRetryPressed: () {
                  forecastBloc.add(ForecastRequested());
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     forecastBloc.add(ForecastRequested());
      //   },
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Icon(
                WeatherIcons.day_sunny,
                size: 30,
              ),
            ),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Icon(
                WeatherIcons.night_alt_cloudy,
                size: 30,
              ),
            ),
            label: 'Forecast',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
