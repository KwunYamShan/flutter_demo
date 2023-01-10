import 'package:flutter/material.dart';
import 'package:flutter_demo/route/route.dart';
//用代码模板快速生成 stful  stless
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(// android的ui风格
      title: 'Flutter Demo',
      routes: {
        "/page2" :(_)=>Page2()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}); //构造方法里不能setState
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/**
 * State 生命周期方法提供不同的状态由flutter调用执行
 *
 * 开始
 * 构造函数
 * initState      只执行一次  相当于activity的onCreate
 * didChangeDependencies   initstate之后立刻调用
 * build  绘制界面  当setState触发时会被再次调用
 *
 * deactivate 相当于activity的onStop
 * dispose 相当于activity的onDestory
 *
 * 结束
 */
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
      Navigator.pushNamed(context, "/page2");
    });
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
