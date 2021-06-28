import 'package:flutter/material.dart';
import '../Models/TBKBanner.dart';
import '../Pages/WebViewPage.dart';
// 网格view

class LLGridView extends StatelessWidget {
  final List<TBKBanner> items;

  LLGridView({this.items});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                //TODO: 处理原生的列表
                //TODO: 添加定位权限
                print("Url:${items[index].address}");
                return WebViewPage(title: "${items[index].name ?? ""}", url: items[index].address ?? "");
              }));
            },
            child: GridViewCell(
                title: items[index].name,
                imageUrl: items[index].iconUrl
            ),
          );
        });
  }

}

class GridViewCell extends StatelessWidget {
  GridViewCell({this.title,this.imageUrl});
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        new Expanded(
            child: Image.network(imageUrl)
        ),
        new Text(title)
      ],
    );
  }
}