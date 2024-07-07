import 'dart:developer' as developer;
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logs in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    final timelineTask = developer.TimelineTask();
    timelineTask.start('_incrementCounter');
    try {
      // developer.Timeline.startSync('_incrementCounter');
      await Future.delayed(
        const Duration(seconds: 2),
      );
      print('calling _incrementCounter');
      // int.parse('abc');
      developer.log(
        'calling _incrementCounter',
        name: 'felipecastrosales',
        error: 'sending error',
      );
      developer.inspect(_counter);
      developer.debugger();
      developer.debugger(when: _counter > 2);
      setState(() {
        _counter++;
      });
      developer.inspect(this);
      developer.inspect(_counter);
    } catch (e, s) {
      developer.log(
        'error in _incrementCounter',
        name: 'felipecastrosales',
        error: e.toString(),
        stackTrace: s,
      );
    }
    // developer.Timeline.finishSync();
    timelineTask.finish();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
