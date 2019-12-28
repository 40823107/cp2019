// 導入數學程式庫
import "dart:math" as math;

// 定義 Point 類別
class Point {
 // x, y 變數宣告其資料型別為 num, 且該變數為 final
 // final 變數在賦值後不允許改變
 final num x, y;
 //
 Point(this.x, this.y);
 //
 Point.origin() : x = 0, y = 0;
    
num distanceTo(Point other) {
 var dx = x - other.x;
 var dy = y - other.y;
 return math.sqrt(dx * dx + dy * dy);
 }
 Point operator +(Point other) => Point(x + other.x, y + other.y);
}

void main() {
 var p1 = Point(10, 10);
 var p2 = Point.origin();
 var distance = p1.distanceTo(p2);
 print(distance);
}