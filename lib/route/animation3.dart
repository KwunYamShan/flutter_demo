import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * hero共享元素动画  不能多个hero指定同一个widget
 * 使用key的方式进行路由跳转   路由跳转三种方式：1.widget拆分出去 2.builder 3.key
 */
void main() {
  runApp(Animation3());
}

class Animation3 extends StatefulWidget {
  const Animation3({Key? key}) : super(key: key);

  @override
  _Animation3State createState() => _Animation3State();
}

late AnimationController controller;

class _Animation3State extends State<Animation3>
    with SingleTickerProviderStateMixin {
  GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: key,
      home: Scaffold(
        appBar: AppBar(
          title: Text("动画"),
        ),
        body: Row(
          //水平布局
          children: [
            Expanded(child: Text("111111111111")),
            //权重   先摆Container  剩余空间摆Expanded
            InkWell(
              child: Column(
                children: [
                  Container(
                    width: 120.0,
                    height: 120.0,
                    child: Hero(
                      tag: "aaa", //tag共享元素标识
                      child: Image.network(
                          "https://img2.baidu.com/it/u=217644621,621859478&fm=253&fmt=auto&app=138&f=JPEG?w=616&h=396"),
                    ),
                  ), Container(
                    width: 120.0,
                    height: 120.0,
                    child: Hero(
                      tag: "aaa1", //tag共享元素标识
                      child: Image.network(
                          "https://img2.baidu.com/it/u=217644621,621859478&fm=253&fmt=auto&app=138&f=JPEG?w=616&h=396"),
                    ),
                  )
                ],
              ),
              onTap: () {
                key.currentState?.push(MaterialPageRoute(builder: (_){  //使用key的方式进行路由跳转
                  return NewPage();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新页面"),
      ),
      body: Column(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            child: Hero(
              tag: "aaa", //tag共享元素标识
              child: Image.network(
                  "https://img2.baidu.com/it/u=217644621,621859478&fm=253&fmt=auto&app=138&f=JPEG?w=616&h=396"),
            ),
          ), Container(
            width: 120.0,
            height: 120.0,
            child: Hero(
              tag: "aaa1", //tag共享元素标识
              child: Image.network(
                  "https://img2.baidu.com/it/u=217644621,621859478&fm=253&fmt=auto&app=138&f=JPEG?w=616&h=396"),
            ),
          )
        ],
      ),
    );
  }
}
