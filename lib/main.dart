import 'package:flutter/material.dart';
import 'package:init/bloc/bloc/bloc.dart';
import 'package:init/sharepreferences/index.dart';
import 'application.dart';
import 'bloc/bloc/localizations_bloc.dart';
import 'bloc/bloc/localizations_event.dart';
import 'localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApplication());

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentLocale;
  @override
  void initState() {
    super.initState();
  }

  Future getSystemLan(callback) async {
    String langu = await getSession('languageCode');
    currentLocale = langu;
    callback(langu);
  }

  @override
  Widget build(BuildContext context) {
    final LocalizationsBloc _localizations = LocalizationsBloc();
    return BlocListener(
      bloc: _localizations,
      listener: (BuildContext context, LocalizationsState state) {},
      child: BlocProvider(
        bloc: _localizations,
        child: BlocBuilder<LocalizationsEvent, LocalizationsState>(
          bloc: _localizations,
          builder: (BuildContext context, LocalizationsState state) {
            getSystemLan((langu) {
              if (langu == 'system') {
                _localizations.chageLocaltions(
                    local: 'system', useSystem: true);
              } else {
                _localizations.chageLocaltions(local: langu, useSystem: false);
              }
            });
            
            return MaterialApp(
              locale: state.useSystem ? null : Locale(currentLocale ?? state?.local),
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context).title(),
              localizationsDelegates: [
                const AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: applic.supportedLocales(),
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: MyHomePage(),
            );
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final LocalizationsBloc _localizations =
        BlocProvider.of<LocalizationsBloc>(context);

    return BlocProvider(
      bloc: _localizations,
      child: BlocBuilder<LocalizationsEvent, LocalizationsState>(
          bloc: _localizations,
          builder: (BuildContext context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  AppLocalizations.of(context).title(),
                ),
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context).hintText(),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context).text(_counter),
                    ),
                    FlatButton(
                      child: new Text('跟随系统'),
                      onPressed: () {
                        _localizations.chageLocaltions(
                            local: 'system', useSystem: true);
                      },
                    ),
                    FlatButton(
                      child: new Text('zh'),
                      onPressed: () {
                        _localizations.chageLocaltions(local: 'zh');
                      },
                    ),
                    FlatButton(
                      child: new Text('de'),
                      onPressed: () {
                        _localizations.chageLocaltions(local: 'de');
                      },
                    ),
                    FlatButton(
                      child: new Text('en'),
                      onPressed: () {
                        _localizations.chageLocaltions(local: 'en');
                      },
                    ),
                    FlatButton(
                      child: new Text('ru'),
                      onPressed: () {
                        _localizations.chageLocaltions(local: 'ru');
                      },
                    ),
                    FlatButton(
                      child: new Text('ar'),
                      onPressed: () {
                        _localizations.chageLocaltions(local: 'ar');
                      },
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  _incrementCounter();
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ), // This trailing comma makes auto-formatting nicer for build methods.
            );
          }),
    );
  }
}
