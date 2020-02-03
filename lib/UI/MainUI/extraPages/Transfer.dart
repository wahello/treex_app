import 'package:flutter/material.dart';
import 'package:treex_app/UI/MainUI/extraPages/TransferDownload.dart';
import 'package:treex_app/UI/MainUI/extraPages/TransferUpload.dart';

class TransferPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TransferState();
}

class _TransferState extends State<TransferPage> with TickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  listener() {
    _tabController.offset = _pageController.page;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('传输列表'),
        bottom: TabBar(
          indicatorColor: Colors.white,
          indicatorWeight: 5,
          controller: _tabController,
          tabs: [
            Tab(
              text: '下载',
            ),
            Tab(
              text: '上传',
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          TransferDownloadPage(),
          TransferUploadPage(),
        ],
      ),
    );
  }
}