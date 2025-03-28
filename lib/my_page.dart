import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  '免费版本\n首次试用免费',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            // 列表菜单项
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('恢复购买'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('反馈'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.clear),
              title: Text('清除缓存'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('分享'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('评价我们'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.support),
              title: Text('在线支持'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('关于'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
