import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter App Drawer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _showSnackBar(BuildContext context) {
    Navigator.of(context).pop();
    scaffoldState.currentState.showSnackBar(SnackBar(
        content: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Welcome To Flutter Alerts Tutorial!'),
        IconButton(icon: Icon(Icons.logout), onPressed: _showMyDialog)
      ],
    )));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 15,
              color: Colors.indigo,
              child: Container(
                padding: EdgeInsets.all(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You have pushed the button this many times:',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      '$_counter',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.fromLTRB(18, 60, 18, 60),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new FlatButton(
                  onPressed: () => _onHomeButtonPressed(context),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      new Icon(Icons.home),
                      new Text(
                        'Home',
                        textDirection: TextDirection.ltr,
                      ),
                    ],
                  )),
              new FlatButton(
                  onPressed: () => _showMyDialog(),
                  child: new Text(
                    'Alert Dialog',
                    textDirection: TextDirection.ltr,
                  )),
              new FlatButton(
                  onPressed: () => _showBottomSheet(context),
                  child: new Text(
                    'Bottom Sheet',
                    textDirection: TextDirection.ltr,
                  )),
              new FlatButton(
                  onPressed: () => _showSimpleDialog(),
                  child: new Text(
                    'Simple Dialog',
                    textDirection: TextDirection.ltr,
                  )),
              new FlatButton(
                  onPressed: () => _showSnackBar(context),
                  child: new Text(
                    'SnackBar',
                    textDirection: TextDirection.ltr,
                  )),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onHomeButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout),
              Text(
                'User Log out',
                style: TextStyle(color: Colors.indigo),
              )
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Icon(Icons.add_alert_outlined),
                Text('Are you sure you want to logout?'),
                Text(
                  'You will lost your unsaved data!',
                  style: new TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Yes', style: TextStyle(color: Colors.red)),
            )
          ],
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Button'),
                  onPressed: () => debugPrint('Button 1'),
                ),
                ElevatedButton(
                  child: const Text('Button 2'),
                  onPressed: () => debugPrint('Button 2'),
                ),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showSimpleDialog() async {
    switch (await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select assignment'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: const Text('Treasury department'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 2);
                },
                child: const Text('State department'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 2);
                },
                child: const Text('IT department'),
              ),
            ],
          );
        })) {
      case 1:
        // ...
        break;
      case 2:
        // ...
        break;
      case 3:
        // ...
        break;
      default:
        // Invalid Selection
        break;
    }
  }
}
