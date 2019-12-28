// 導入 Material Components Widget 程式庫
// 目前針對 flutter web 與 mobile 的程式庫已經整合為一
import 'package:flutter/material.dart';

// 延伸自 StatefulWidget 定義一個 SpinningSquare 類別
// StatefulWidget 是一種可變狀態的 Widget
// StatefulWidget 使用 setState 方法管理此部件狀態的改變
// 方法是透過 setState 通知狀態變化, 接著 Flutter 會重新運行 build 方法
// 將最新狀態呈現出來
/*
StatefulWidget 通常用於:

1. 需要與使用者透過表單輸入或滑鼠, 進行互動時
2. 部件狀態隨時間產生變化時
3. 數據傳遞過程需要更新使用者介面內容時
*/
class SpinningSquare extends StatefulWidget {
/*
延伸自其他物件的類別定義時, 若要改寫在父類別已經存在的同名方法或實現一個 abstract method 時, 可以選擇冠上 @override 標示
abstract methods 只能存在 abstract class 中.
建立 abstract method 時隨後必須直接加上分號 (;) 而無方法內容定義.
而 abstract class 則是一種無法直接產生案例的類別, 但可以用於 sub-classed.
定義 abstract class 時必須使用 abstract 關鍵字.
https://medium.com/jay-tillu/abstract-class-and-abstract-methods-in-dart-4630f1e39f64
*/
  @override
  // 改寫 createState() 方法
  _SpinningSquareState createState() => new _SpinningSquareState();
}

class _SpinningSquareState extends State<SpinningSquare>
    with SingleTickerProviderStateMixin {
  AnimationController _animation;
  /*
延伸自其他物件的類別定義時, 若要改寫在父類別已經存在的同名方法或實現一個 abstract method 時, 可以選擇冠上 @override 標示
*/
  @override
  // 改寫 initState() 方法
  void initState() {
    super.initState();
    // We use 3600 milliseconds instead of 1800 milliseconds because 0.0 -> 1.0
    // represents an entire turn of the square whereas in the other examples
    // we used 0.0 -> math.pi, which is only half a turn.
    _animation = new AnimationController(
      duration: const Duration(milliseconds: 3600),
      vsync: this,
    )..repeat();
  }

  @override
  // 改寫 build()
  Widget build(BuildContext context) {
    return new RotationTransition(
        turns: _animation,
        child: new Container(
          width: 200.0,
          height: 200.0,
          color: const Color(0xFFFF0000),
        ));
  }

  @override
  //  改寫 dispost()
  void dispose() {
    _animation.dispose();
    super.dispose();
  }
}


// Dart 程式必須從 main() 函式啟動執行
void main() {
// main() 函式中只實現一個 runApp() 案例, 其中的輸入為 MaterialApp 物件
// 且 MaterialApp 中, 帶有兩個屬性的設定, 包括 debugShowCheckedModeBanner 與 home 欄位中的資料設定
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Center(child: new SpinningSquare()),
    ),
  );
}
