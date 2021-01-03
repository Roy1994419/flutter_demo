import 'package:flutter/material.dart';

void main()=> runApp(MyAPP());

class MyAPP extends StatefulWidget{  //StatelessWidget 无状态不能更新  StatefulWidget可以更新



  @override
  MyApp2 createState() {
    // TODO: implement createState
    return MyApp2();
  }
}


class MyApp2 extends State<MyAPP>{
   String s1 = "哈哈哈";
   MyApp2(){
    debugPrint("我执行了0");
    Future.delayed(Duration(seconds: 3)).then((s){ //加了future 可以触发更新的 原因是 build的任务队列触发时机比 future先执行
        s1 = "wogaibianle";
        debugPrint("我执行了1");
        setState(() {  //不要在构造方法里面 setState 因为 先执行构造 在去执行build初始化ui
          debugPrint("我执行了2");             //触发更新操作
        });
    });
  }


   @override
  void initState() {
//构造函数执行完后调用他
  }


   @override
  void didChangeDependencies() {
//initState执行完后调用他
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("我执行了3");
    // TODO: implement build
     return MaterialApp( //和android 5.0的样式类似 具有默认属性
        home:Scaffold( //具有默认样式s
          appBar: AppBar(title: Text(s1)),
            body:  Center(child: Text(s1,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12),
            ))
        )
    );;
  }

   @override
  void deactivate() {
// 销毁动作  相当于onStop方法
  }

   @override
  void dispose() {
// 相当于 onDestory方法
  }
}

