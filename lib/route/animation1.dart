import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Animation1());
}

class Animation1 extends StatefulWidget {
  const Animation1({Key? key}) : super(key: key);

  @override
  _Animation1State createState() => _Animation1State();
}

late AnimationController controller;

late ColorTween tweenAnim;
late Animation colorAnim;
late CurvedAnimation curveAnim;
class _Animation1State extends State<Animation1>
    with SingleTickerProviderStateMixin {
  late Animation<double> curveTween;


  @override
  Widget build(BuildContext context) {
    print("2222");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("动画"),
        ),
        body:Container(
          // width: controller.value,//开始到停止的默认区间 100开始 300结束
          // height:controller.value,//开始到停止的默认区间 100开始 300结束
          width: curveTween.value,
          height: curveTween.value,
          color: colorAnim.value,
          child: Text("111"),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    print("3333");
    super.initState();
    print("11111");
    //vsync Ticker的作用是添加屏幕刷新回调，屏幕刷新会调用TickerCallback，我们可以通过Ticker来驱动动画会防止屏幕外动画消耗不必要的资源（比如锁屏）  最简单的方法是使用SingleTickerProviderStateMixin 如果有多个controller使用TickerProviderStateMixin
    // 不可见不更新资源
    controller = AnimationController(
        vsync: this,
         // lowerBound: 100,//开始到停止的默认区间 100开始 300结束
         // upperBound: 300,//开始到停止的默认区间 100开始 300结束
        duration: Duration(seconds: 3));
    print(controller == null);
    print("controller1: ${controller.value}");
    controller.addListener(() {
      setState(() {
      });
      print("controller2: ${controller.value}");
      print("controller2: ${colorAnim.value}    ${controller.value}");
    });

    controller.addStatusListener((status) {
      //正向动画完成之后
      if(status == AnimationStatus.completed){
        controller.reverse();
        //反向动画完成之后
      }else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    //动画插值器
    curveAnim = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    curveTween = Tween(begin: 10.0,end: 400.0).animate(curveAnim);//插值器默认0-1  需要用到包一层补间

    tweenAnim = ColorTween(begin: Colors.white,end: Colors.yellow);//补间动画
    colorAnim = tweenAnim.animate(controller);

    controller.forward(); //开始动画
    // controller.reverse(); //反向启动动画
    //循环动画就是在状态监听中反复调用这两个
    //我们自己加标识符可不可以实现这个功能 ？ 不可以 手动调用stop方法不会给状态回调
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();//用完释放
  }
}
