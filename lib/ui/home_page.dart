import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/bloc/forecast_event.dart';
import 'package:weather_application/bloc/forecast_state.dart';
import 'package:weather_application/ui/forecast_page.dart';
import 'package:weather_application/ui/today_page.dart';
import 'package:weather_icons/weather_icons.dart';

import '../bloc/forecast_bloc.dart';
import '../services/forecast_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  //final List _pages = const [TodayPage(), ForecastPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ForecastBloc forecastBloc = context.read<ForecastBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0 ? 'Today' : 'London',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      // body: _pages.elementAt(_selectedIndex),
      body: BlocBuilder<ForecastBloc, ForecastState>(
        builder: (BuildContext context, state) {
          if (state is ForecastEmptyState) {
            return const Center(child: Text('Empty'));
          } else if (state is ForecastLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ForecastLoadedState) {
            return _selectedIndex == 0
                ? const TodayPage()
                : ForecastPage(forecast: state.loadedForecast);
          } else if (state is ForecastErrorState) {
            return const Center(
              child: Text('Error occurs'),
            );
          }
          return const SizedBox.shrink();
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          forecastBloc.add(ForecastRequested());
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wb_sunny_outlined,
              size: 30,
            ),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              WeatherIcons.night_alt_cloudy,
              size: 30,
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
