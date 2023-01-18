import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      ),
      home: const MyHomePage(title: '부적절한 사생활'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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

  final textController_1 = TextEditingController();

  checkTextFieldEmptyOrNot(){

    // Creating 3 String Variables.
    String text1;

    // Getting Value From Text Field and Store into String Variable
    text1 = textController_1.text ;

    // Checking all TextFields.
    if(text1 == '' )
    {
      // Put your code here which you want to execute when Text Field is Empty.
      print('Text Field is empty, Please Fill All Data');


    }else{

      // Put your code here, which you want to execute when Text Field is NOT Empty.
      print('Not Empty, All Text Input is Filled.');
    }

  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    Color cont1Color = Colors.white;
    String _text = "[먹다]";

    Color isCorrect1()
    {
      Color col = Colors.black87;
      String text1;
      text1 = textController_1.text ;

      if(text1 == '') {
        //_text = "[먹다:미입력]";
        col = Colors.black87;
      }
      else if(text1 == '먹어야 해요') {
        _text = "[먹다:정답]";
        col = Colors.cyan;
      }
      else {
        _text = "[먹다:오답]";
        col = Colors.pinkAccent;
      }

      return col;

    }

    Future<void> _onPointerDown(PointerDownEvent event) async {
      // Check if right mouse button clicked
      if (event.kind == PointerDeviceKind.mouse &&
          event.buttons == kSecondaryMouseButton) {


      }
    }


    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                const Text(
                  '올해는 꼭 국수를 ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(width: 130, height: 25,
                  child: TextField(
                    controller: textController_1,
                    enableInteractiveSelection: false,
                    toolbarOptions: const ToolbarOptions(
                        copy:false,
                        paste: false,
                        cut: false,
                        selectAll: true
                      //by default all are disabled 'false'
                    ),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10.0),
                      hintText: '-야 하다',
                    ),
                    style: TextStyle(color: isCorrect1()),

                  ),
                ),
                Text(_text,
                  style: TextStyle(
                  fontSize: 20,
                  color: isCorrect1(),
                ),),
                ElevatedButton(
                  onPressed: (){
                    setState((){
                      String text1;
                      text1 = textController_1.text ;

                      if(text1 == '') {
                        _text = "[먹다:미입력]";
                      }
                    });
                  },
                  child: const Text(
                    '확인',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const Text(
              'You have 111pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),

          ],
        ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );


  }
}
