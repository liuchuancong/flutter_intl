import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:init/sharepreferences/index.dart';
import './bloc.dart';
class LocalizationsBloc extends Bloc<LocalizationsEvent, LocalizationsState> {
  @override
  LocalizationsState get initialState => LocalizationsState(local: 'system',useSystem: true);
  void chageLocaltions({String local,bool useSystem}) {
    dispatch(ChangeLocalizationsEvent(local: local,useSystem: useSystem));
  }

  @override
  Stream<LocalizationsState> mapEventToState(
    LocalizationsEvent event,
  ) async* {
    if (event is ChangeLocalizationsEvent) {
      setSession('languageCode',event.local);
      switch (event.local) {
        case 'zh':
         yield LocalizationsState.zh();
          break;
        case 'de':
         yield LocalizationsState.de();
          break;
        case 'ar':
         yield LocalizationsState.ar();
          break;
        case 'en':
         yield LocalizationsState.en();
          break;
        case 'ru':
         yield LocalizationsState.ru();
          break;
        default: 
        yield LocalizationsState(local: event.local,useSystem: event.useSystem);
      }

    }
  }
  @override
  void onTransition(Transition<LocalizationsEvent, LocalizationsState> transition) {
    super.onTransition(transition);
  }
}
