var tipuesearch = {"pages": [{'title': 'About', 'text': 'https://40823107.github.io/cp2019 \xa0\xa0 \n 你是在哈囉嗎? \n \n', 'tags': '', 'url': 'About.html'}, {'title': '迴圈', 'text': '\n dartpad: https://mde.tw/dartpad/?id=2bd023d70d6e6f340ae2ace62e011c25 \n gist: https://gist.github.com/40823107/2bd023d70d6e6f340ae2ace62e011c25 \n void main() {\n print("你是在哈囉? ");\n} \n \n dartpad: https://mde.tw/dartpad/?id=a3ed7f5db09348be4665fe3e76002dcc \n gist: https://gist.github.com/40823107/a3ed7f5db09348be4665fe3e76002dcc \n void main() {\n  for (int i = 0; i < 5; i++) {\n  print(\'hello $i\');\n }\n print("你是在哈囉? ");\n}\n \n \n \n dartpad: https://mde.tw/dartpad/?id=926c6e88742b424d61fdbb99cc101b98 \n gist: https://gist.github.com/40823107/926c6e88742b424d61fdbb99cc101b98 \n import \'dart:html\';\n\nvoid main() {\n  // 每一組 10 人\n  int num = 10;\n  // 組序由 1 開始\n  int gth = 1;\n  // 迴圈序號變數\n  int i;\n  // 每組學員暫存數列\n  var gp_list = [];\n  // 全班分組數列\n  var cp2019 = [];\n\n  HttpRequest.getString(\n          \'https://mde.tw/cp2019/downloads/2019fall_cp_1a_list.txt\')\n      .then((String resp) {\n    // 利用 trim() 去除字串最後的跳行符號, 之後再利用 split() 根據 \\n 轉為數列\n    var stud_list = resp.trim().split("\\n");\n    // 數列利用 shuffle() 方法以隨機方法弄亂順序\n    stud_list.shuffle();\n    // 逐一讀取已經弄亂的學生學號數列, 利用模數運算每幾人分成一組\n    for (i = 0; i < stud_list.length; i++) {\n      // 0, 1~(num-1), num\n      if (i % num == 0) {\n        gp_list = [];\n        // 列印區隔符號\n        print(\'=\' * 20);\n        print("group $gth :");\n        print(stud_list[i]);\n        // 在各分組數列中加入將對應的學員學號\n        gp_list.add(stud_list[i]);\n        gth = gth + 1;\n      } else {\n        print(stud_list[i]);\n        // 在各分組數列中加入將對應的學員學號\n        gp_list.add(stud_list[i]);\n      }\n      if (i % num == 0) {\n        // 逐步將各組暫存的分組數列加入全班分組數列中\n        cp2019.add(gp_list);\n      }\n    }\n    // 列出全班分組數列\n    print(cp2019);\n  });\n} \n \n', 'tags': '', 'url': '迴圈.html'}, {'title': 'W7', 'text': 'dartpad: https://mde.tw/dartpad/?id=1956c7efea9c4b2e154ee0697d06e29d \n gist: https://gist.github.com/40823107/1956c7efea9c4b2e154ee0697d06e29d \n int i;\nint sum;\n\nmain() {\n  sum = 0;\n  for(i=1;i <=10 ;i++){\n    sum += i;\n    print("$sum");\n  }\n print("sum = $sum");\n}\n\nfun1(){\n} \n \n \n 阻尼 \n \n \n', 'tags': '', 'url': 'W7.html'}, {'title': 'Temperature', 'text': '', 'tags': '', 'url': 'Temperature.html'}, {'title': '華氏、攝氏的轉換', 'text': '\n 攝氏轉華氏 \n 華氏轉攝氏 \n', 'tags': '', 'url': '華氏、攝氏的轉換.html'}, {'title': 'Javascript 建立按鈕', 'text': 'temperature \n 華氏轉攝氏 \n 攝氏轉華氏 \n  內建放入的 Dart 原始碼  \n 放大   回復 \n gh_owner=40823107&gh_repo=cp2019&gh_path=downloads\n/dart_ex/華氏轉攝氏&theme=dark" gt="" gh_owner="40823107&gh_repo=cp2019&gh_path=downloads/dart_ex/攝氏轉華氏&theme=dark">" p=""> 華氏、攝氏的轉換 <<  Previous \n  footer  \n \n \n  Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0.   Copyright ©\n\ndocument.write(new Date().getFullYear());\n\nAll rights reserved | This template is made with   by  Colorlib    Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0.  \n \n \n  for footer  \n \n  for site wrap  \n \n  <script src="../cmsimde/static/chimper/js/jquery-3.3.1.min.js"></script>  \n <!-- \n\n\nvar typed = new Typed(\'.typed-words\', {\n                    strings: ["Web Apps"," WordPress"," Mobile Apps"],\n                    typeSpeed: 80,\n                    backSpeed: 80,\n                    backDelay: 4000,\n                    startDelay: 1000,\n                    loop: true,\n                    showCursor: true\n                    }); \n', 'tags': '', 'url': 'Javascript 建立按鈕.html'}, {'title': 'W16 查驗考試', 'text': '\n  取 Dart 程式的按鈕  \n 純 Dart 程式 \n rungekutta helloworld For Loop Sum RK ex1 Mass Spring Damping Function   Function Parameter   Fat Arrow \n Html 程式 \n ROC Flag USA Flag   Grid   X-Y Plot   Slithery   temperature \n Flutter 程式 \n Flutter0   Flutter1   Flutter2   Flutter3   Flutter4   Flutter Counter   ROC Flag   踩地雷 1   踩地雷 2   踩地雷 3   踩地雷 4 \n  內建放入的 Dart 原始碼  \n 放大   回復 \n \n Javascript 建立按鈕 <<  Previous   Next  >> Javascript 建立按鈕 \n  footer  \n \n \n  Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0.   Copyright ©\n \nAll rights reserved | This template is made with   by  Colorlib    Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0.  \n \n \n  for footer  \n \n  for site wrap  \n \n  <script src="../cmsimde/static/chimper/js/jquery-3.3.1.min.js"></script>  \n \n \n \n \n \n \n \n \n \n \n \n            <script src="../cmsimde/static/chimper/js/typed.js"></script>\n                    <script>\n                    var typed = new Typed(\'.typed-words\', {\n                    strings: ["Web Apps"," WordPress"," Mobile Apps"],\n                    typeSpeed: 80,\n                    backSpeed: 80,\n                    backDelay: 4000,\n                    startDelay: 1000,\n                    loop: true,\n                    showCursor: true\n                    });\n                    </script>\n            ', 'tags': '', 'url': 'W16 查驗考試.html'}]};