import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    // 获取屏幕宽度，用于计算双列模块卡片宽度（左右各16的padding，卡片间隔16）
    final screenWidth = MediaQuery.of(context).size.width;
    const double horizontalPadding = 16;
    const double spacing = 16;
    final double cardWidth = (screenWidth - horizontalPadding * 2 - spacing) / 2;
    const double cardHeight = 160;
    const double topHeight = 250;
    
    return Scaffold(
      backgroundColor: Colors.white,
      // 使用 Stack 实现顶部背景固定，下面模块滚动
      body: Stack(
        fit: StackFit.expand,  // 确保 Stack 占满全屏
        children: [
          // 固定的顶部大背景区域
          Container(
            height: topHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purpleAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Align(
          alignment: Alignment.topCenter,
           child: Padding(
            padding: const EdgeInsets.only(top: 100.0), 
            child: Text(
            '雨燕投屏',
            style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ),
          // 右上角扫描二维码图标
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              icon: const Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('开启相机')),
                );
              },
            ),
          ),
          // 滚动区域：固定在顶部背景下方，从 topHeight 到底部
          Positioned(
            top: topHeight,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(horizontalPadding),
                child: Column(
                  children: [                    
                    // 全宽模块：镜像投屏
                    SizedBox(
                      width: double.infinity,
                      height: cardHeight,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('点击了解')),
                            );
                          },
                          child: const ListTile(
                            leading: Icon(Icons.cast),
                            title: Text('镜像投屏'),
                            subtitle: Text('帮您投屏到安卓智能电视,windows电脑,Mac电脑,Apple TV'),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: spacing),
                    // 其他模块：双列模式布局
                    Wrap(
                      spacing: spacing,
                      runSpacing: spacing,
                      children: [
                        _buildVerticalCard(
                          context,
                          width: cardWidth,
                          height: cardHeight,
                          icon: Icons.web,
                          title: '浏览器投屏',
                          subtitle: '支持Chrome、Firefox、Edge、Safari等浏览器的投屏,接收端无需安装',
                          onTapMessage: '点击了解',
                        ),
                        _buildVerticalCard(
                          context,
                          width: cardWidth,
                          height: cardHeight,
                          icon: Icons.camera_alt,
                          title: '镜像相机',
                          subtitle: '从相机进行屏幕镜像',
                          onTapMessage: '点击了解',
                        ),
                        _buildVerticalCard(
                          context,
                          width: cardWidth,
                          height: cardHeight,
                          icon: Icons.file_present,
                          title: '文件互传',
                          subtitle: '手机和电脑之间互传文件,支持Windows和Mac',
                          onTapMessage: '点击了解',
                        ),
                        _buildVerticalCard(
                          context,
                          width: cardWidth,
                          height: cardHeight,
                          icon: Icons.brush,
                          title: '画图板',
                          subtitle: '自由绘画，投屏呈现，让大家都能看到精彩内容',
                          onTapMessage: '点击了解',
                        ),
                        _buildVerticalCard(
                          context,
                          width: cardWidth,
                          height: cardHeight,
                          icon: Icons.play_circle_fill,
                          title: '流媒体',
                          subtitle: '支持DLNA协议,兼容多种媒体格式和电视',
                          onTapMessage: '点击了解',
                        ),
                        _buildVerticalCard(
                          context,
                          width: cardWidth,
                          height: cardHeight,
                          icon: Icons.photo_album,
                          title: '相册',
                          subtitle: '汇聚家庭相册，回忆美好瞬间',
                          onTapMessage: '点击了解',
                        ),
                        _buildVerticalCard(
                          context,
                          width: cardWidth,
                          height: cardHeight,
                          icon: Icons.tv,
                          title: '接收投屏',
                          subtitle: '来自PC和Mac和其他设备的屏幕镜像',
                          onTapMessage: '点击了解',
                        ),
                        _buildVerticalCard(
                          context,
                          width: cardWidth,
                          height: cardHeight,
                          icon: Icons.electric_car,
                          title: '特斯拉投屏',
                          subtitle: '从手机镜像到特斯拉车载浏览器',
                          onTapMessage: '点击了解',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildVerticalCard(
    BuildContext context, {
    required double width,
    required double height,
    required IconData icon,
    required String title,
    required String subtitle,
    required String onTapMessage,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(onTapMessage)),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 36,
                  color: Colors.deepPurple,
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
