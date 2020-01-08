import "dart:html";

lbtokg(num lb){
return lb*0.4536;
}

kgtolb(num kg){
return kg*2.2046;
}

main() {
    
    InputElement tempInput = querySelector("#weight");
    querySelector("#submit").onClick.listen((e) => convert(tempInput.value));
}

convert(String data){ 
  int len;  
  var type;  
  var number;
  
  LabelElement output = querySelector("#output");
  
  len = data.length;  
  type = data[len-2];
  number = data.substring(0, len-2);
  
  number = int.parse(number);
  if (type == "L" || type == "l"){
     output.innerHtml = " $number 英磅 =  ${lbtokg(number).toStringAsFixed(4)} 公斤";
  } else if ((type == "K" || type == "k")){
     output.innerHtml = " $number 公斤 =  ${kgtolb(number).toStringAsFixed(4)} 英磅";
  } else {
     output.innerHtml = "請輸入數字加上 LB 或 KG!";
  }
} 