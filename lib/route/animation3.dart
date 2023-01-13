import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * hero共享元素动画
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("动画"),
        ),
        body:Row(//水平布局
         children: [
           Expanded(child: Text("111111111111")), //权重   先摆Container  剩余空间摆Expanded
           Container(
             width: 120.0,
             height: 120.0,
             child: Image.network("https://img2.baidu.com/it/u=217644621,621859478&fm=253&fmt=auto&app=138&f=JPEG?w=616&h=396"),
           )
         ],
        ),
      ),
    );
  }

}