// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherController on _WeatherController, Store {
  final _$isLoadAtom = Atom(name: '_WeatherController.isLoad');

  @override
  bool get isLoad {
    _$isLoadAtom.context.enforceReadPolicy(_$isLoadAtom);
    _$isLoadAtom.reportObserved();
    return super.isLoad;
  }

  @override
  set isLoad(bool value) {
    _$isLoadAtom.context.conditionallyRunInAction(() {
      super.isLoad = value;
      _$isLoadAtom.reportChanged();
    }, _$isLoadAtom, name: '${_$isLoadAtom.name}_set');
  }

  final _$weatherAtom = Atom(name: '_WeatherController.weather');

  @override
  Weather get weather {
    _$weatherAtom.context.enforceReadPolicy(_$weatherAtom);
    _$weatherAtom.reportObserved();
    return super.weather;
  }

  @override
  set weather(Weather value) {
    _$weatherAtom.context.conditionallyRunInAction(() {
      super.weather = value;
      _$weatherAtom.reportChanged();
    }, _$weatherAtom, name: '${_$weatherAtom.name}_set');
  }

  final _$getWeatherAsyncAction = AsyncAction('getWeather');

  @override
  Future<dynamic> getWeather(double lat, double long) {
    return _$getWeatherAsyncAction.run(() => super.getWeather(lat, long));
  }
}
