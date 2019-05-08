import 'package:meta/meta.dart';

@immutable
class LocalizationsState {
  final String local;
  bool  useSystem;
  LocalizationsState({this.local,this.useSystem = false});
  factory LocalizationsState.zh() {
    return LocalizationsState(local: 'zh');
  }
  factory LocalizationsState.de() {
    return LocalizationsState(local: 'de');
  }
  factory LocalizationsState.ru() {
    return LocalizationsState(local: 'ru');
  }
  factory LocalizationsState.en() {
    return LocalizationsState(local: 'en');
  }
  factory LocalizationsState.ar() {
    return LocalizationsState(local: 'ar');
  }
}
