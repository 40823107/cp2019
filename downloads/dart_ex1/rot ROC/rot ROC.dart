import 'dart:html';
import 'dart:math' as Math;
// for Timer
import 'dart:async';

CanvasElement canvas;
CanvasRenderingContext2D ctx;
int flagW = 300;
int flagH = 200;
num circleX = flagW / 4;
num circleY = flagH / 4;
Timer timer;
num rotAngle = 0;
num incAngle = 0;

void main() {
  canvas = querySelector('#canvas');
  ctx = canvas.getContext('2d');

  //drawROC(ctx);
  querySelector("#stopROC").onClick.listen((e) => stopROC());
  querySelector("#rotROC").onClick.listen((e) => rotROC());
  // 每 10 ms 重新繪製轉動 incAngle 的 drawROC 國旗
  timer = Timer.periodic(const Duration(milliseconds: 10), (t) => drawROC(ctx));
}

void stopROC() {
  // 白日旋轉角度增量值
  incAngle = 0;
}

void rotROC() {
  // 白日旋轉角度增量值
  incAngle = 1;
}

void drawROC(ctx) {
  // 先清除畫面
  ctx.clearRect(0, 0, flagW, flagH);
  // 先畫滿地紅
  ctx.clearRect(0, 0, flagW, flagH);
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 0, flagW, flagH);
  // 再畫青天
  ctx.fillStyle = 'rgb(0, 0, 150)';
  ctx.fillRect(0, 0, flagW / 2, flagH / 2);
  // 畫十二道光芒白日
  ctx.beginPath();
  num starRadius = flagW / 8;
  num angle = 0;
  // 加入 rotAngle 旋轉角度
  for (int i = 0; i < 24; i++) {
    angle += 5 * Math.pi * 2 / 12;
    num toX = circleX + Math.cos(angle + rotAngle) * starRadius;
    num toY = circleY + Math.sin(angle + rotAngle) * starRadius;
    // 只有 i 為 0 時移動到 toX, toY, 其餘都進行 lineTo
    if (i != 0)
      ctx.lineTo(toX, toY);
    else
      ctx.moveTo(toX, toY);
  }
  ctx.closePath();
  // 將填色設為白色
  ctx.fillStyle = '#fff';
  ctx.fill();
  // 白日:藍圈
  ctx.beginPath();
  ctx.arc(circleX, circleY, flagW * 17 / 240, 0, Math.pi * 2, true);
  ctx.closePath();
  // 填色設為藍色
  ctx.fillStyle = 'rgb(0, 0, 149)';
  ctx.fill();
  // 白日:白心
  ctx.beginPath();
  ctx.arc(circleX, circleY, flagW / 16, 0, Math.pi * 2, true);
  ctx.closePath();
  // 填色設為白色
  ctx.fillStyle = '#fff';
  ctx.fill();
  // 旋轉角度以徑度表示
  rotAngle += incAngle * Math.pi / 180;
}
