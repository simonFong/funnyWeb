import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(new MyApp(
    items: new List(),
  ));
}

class WebBean {
  String title;
  String webPath;

  WebBean(this.title, this.webPath);
}

class MyApp extends StatelessWidget {
  final List<WebBean> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = '有趣的网站';
    items.add(new WebBean("少女生成器", "https://www.thiswaifudoesnotexist.net/"));
    items.add(new WebBean(
        "文章生成器", "https://suulnnka.github.io/BullshitGenerator/index.html"));
    items.add(new WebBean("爱豆翻牌体验器", "http://wb.newbfun.com/fanpai/main.html"));
    items.add(new WebBean("王者荣耀主页生成器", "https://cc.bjadjty.com//cx3/2515/"));
    items.add(new WebBean("GUCCI购物单生成器", "https://cc.bjadjty.com/cx3/2517/"));
    items.add(new WebBean("朋友圈文案生成器", "https://pyq.shadiao.app/"));
    items.add(new WebBean("奥利奥生成器", "https://ddiu8081.github.io/oreooo/"));
    items.add(new WebBean("举牌小人生成器", "http://upuptoyou.com/#"));
    items.add(new WebBean("藏头诗生成器", "https://cts.chazhi.net/"));
    items.add(new WebBean("初音未来音乐生成器", "https://aidn.jp/mikutap/"));
    items.add(new WebBean("今天吃什么生成器", "http://mofun.c7sky.com/rnd4dinner/"));
    items.add(new WebBean("小黄脸表情生成器",
        "https://www.html5tricks.com/demo/html5-emoji-editor/index.html"));
    items.add(
        new WebBean("4格小人生成器", "http://r.ftqq.com/fangtangGif/interview/"));
    items.add(new WebBean("各种小说生成器", "http://wb.newbfun.com/"));
    items.add(new WebBean("彩虹屁生成器", "https://chp.shadiao.app/"));
    items.add(new WebBean("为所欲为成语生成器", "https://lab.bangbang93.com/wsyw"));
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: new ListTile(
                title: new Text('${items[index].title}'),
              ),
              onTap: () {
                //跳转带参
//                Navigator.pushNamed(context, '/register',
//                    arguments: <String, String>{'web': '${items[index]}'});
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Web(
                      '${items[index].title}', '${items[index].webPath}');
                }));
              },
            );
          },
        ),
      ),
    );
  }
}

class Web extends StatelessWidget {
  final String title;
  final String web;

  Web(this.title, this.web);

  @override
  Widget build(BuildContext context) {
    List<Widget> titleContent = [];
    titleContent.add(new Text(
      title,
      style: new TextStyle(color: Colors.white),
    ));
    titleContent.add(new Container(width: 50.0));
    return new WebviewScaffold(
      url: web,
      // 登录的URL
      appBar: new AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleContent,
        ),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      withZoom: true,
      // 允许网页缩放
      withLocalStorage: true,
      // 允许LocalStorage
      withJavascript: true, // 允许执行js代码

      useWideViewPort: true,

      displayZoomControls:true,

      withOverviewMode: true,
    );
  }
}
