import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 两个标签页
      child: Scaffold(
        appBar: AppBar(
          title: const Text('发现'),
          backgroundColor: Colors.purple,
          bottom: const TabBar(
            indicatorColor: Colors.white, 
            tabs: [
              Tab(text: '使用帮助'),
              Tab(text: '常见问题'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // 第一个tab：使用帮助
            UsageHelpTab(),
            // 第二个tab：常见问题
            CommonQuestionsTab(),
          ],
        ),
      ),
    );
  }
}

/// 使用帮助tab
class UsageHelpTab extends StatelessWidget {
  const UsageHelpTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ExpansionTile(
          title: Text('手机投屏到电视/电脑'),
          children: [
            ListTile(title: Text('1:')),
            ListTile(title: Text('2:')),
            ListTile(title: Text('3:')),
          ],
        ),
        ExpansionTile(
          title: Text('投屏到手机'),
          children: [
            ListTile(title: Text('1:')),
            ListTile(title: Text('2:')),
            ListTile(title: Text('3:')),
          ],
        ),
        ExpansionTile(
          title: Text('电脑投屏到电视'),
          children: [
            ListTile(title: Text('1:')),
            ListTile(title: Text('2:')),
            ListTile(title: Text('3:')),
          ],
        ),
      ],
    );
  }
}

/// 常见问题tab
class CommonQuestionsTab extends StatelessWidget {
  const CommonQuestionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 搜索框
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: '请输入搜索内容',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            ),
          ),
        ),
        // 问题列表
        Expanded(
          child: ListView(
            children: const [
              // 安装与软件版本问题
              ExpansionTile(
                leading: Icon(Icons.push_pin, color: Colors.redAccent),
                title: Text('安装与软件版本问题'),
                children: [
                  ListTile(title: Text('1')),
                  ListTile(title: Text('2')),
                ],
              ),
              // 设备连接问题
              ExpansionTile(
                leading: Icon(Icons.push_pin, color: Colors.redAccent),
                title: Text('设备连接问题'),
                children: [
                  ListTile(title: Text('1')),
                  ListTile(title: Text('2')),
                ],
              ),
              // 投屏体验问题
              ExpansionTile(
                leading: Icon(Icons.push_pin, color: Colors.redAccent),
                title: Text('投屏体验问题'),
                children: [
                  ListTile(title: Text('1')),
                  ListTile(title: Text('2')),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
