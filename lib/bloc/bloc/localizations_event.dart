import 'package:meta/meta.dart';

@immutable
abstract class LocalizationsEvent {}

class ChangeLocalizationsEvent extends  LocalizationsEvent {
  final String local;
  final bool useSystem;
  ChangeLocalizationsEvent({this.local, this.useSystem = true});
}
