import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'kb_card_page.dart';

class MessagePage extends StatelessWidget {
  MessagePage({super.key});

  List<String> tabs = ["全部消息", "系统消息", "共享消息"];

  final List<String> svgIcons = [
    'lib/icon/all.svg',
    'lib/icon/system.svg',
    'lib/icon/share.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('消息'),
      ),
      body: DefaultTabController(
        length: tabs.length, // 设置 TabController 的长度
        child: Column(
          children: [
            Container(
              height: 60, // 确保 TabBar 高度足够
              child: TabBar(
                isScrollable: false,
                tabs: List.generate(
                  svgIcons.length,
                      (index) => Tab(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          svgIcons[index],
                          height: 32,
                        ),
                        Text(
                          tabs[index],
                          style: TextStyle(fontSize: 10),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _allMessage(context),
                  _systemMessage(context),
                  _shareMessage(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _systemMessage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyCard(
              name: '考勤日志',
              subtitle: '月结提醒',
              imagePath: 'lib/images/message.png',
              time: '15:42',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardListPage(
                      name: '系统管理员',
                      subtitles: ['月结提醒',],
                      timestamps: [
                        '15:42',
                      ],
                      imagePath1: [
                        'lib/images/message.png',
                      ],
                      imagePath2: [
                        'lib/images/setting.png',
                      ],
                      starttime: [
                        '-',
                      ],
                      endtime: [
                        '-',
                      ],
                      times: [
                        '-',
                      ],
                      title: [
                        '考勤日志',
                      ],
                      titles: [
                        '月结提醒',
                      ]
                    ),
                  ),
                );
              },
          ),
          MyCard(
              name: '系统管家',
              subtitle: '您的名称违反了社区规范，请尽快修正，如果不修正将会影响到您对app的使用',
              imagePath: 'lib/images/message.png',
            time: '13:45',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardListPage(
                      name: '系统管家',
                      subtitles: ['您的名称违反了社区规范，请尽快修正，如果不修正将会影响到您对app的使用'],
                      timestamps: [
                        '12:00',
                      ],
                      imagePath1: [
                        'lib/images/message.png',
                      ],
                      imagePath2: [
                        'lib/images/setting.png',
                      ],
                      starttime: [
                        '-',
                      ],
                      endtime: [
                        '-',
                      ],
                      times: [
                        '-',
                      ],
                      title: [
                        '系统管家',
                      ],
                      titles: [
                        '您的名称违反了社区规范，请尽快修正，如果不修正将会影响到您对app的使用',
                      ]
                    ),
                  ),
                );
              },
          ),
          const SizedBox(height: 200),
        ],
      ),
    );
  }

  Widget _allMessage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyCard(
            name: '考勤日志',
            subtitle: '月结提醒',
            imagePath: 'lib/images/message.png',
            time: '15:42',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                      name: '系统管理员',
                      subtitles: ['月结提醒',],
                      timestamps: [
                        '15:42',
                      ],
                      imagePath1: [
                        'lib/images/message.png',
                      ],
                      imagePath2: [
                        'lib/images/setting.png',
                      ],
                      starttime: [
                        '-',
                      ],
                      endtime: [
                        '-',
                      ],
                      times: [
                        '-',
                      ],
                      title: [
                        '考勤日志',
                      ],
                      titles: [
                        '月结提醒',
                      ]
                  ),
                ),
              );
            },
          ),
          MyCard(
            name: '系统管家',
            subtitle: '您的名称违反了社区规范，请尽快修正，如果不修正将会影响到您对app的使用',
            imagePath: 'lib/images/message.png',
            time: '13:45',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                      name: '系统管家',
                      subtitles: ['您的名称违反了社区规范，请尽快修正，如果不修正将会影响到您对app的使用'],
                      timestamps: [
                        '12:00',
                      ],
                      imagePath1: [
                        'lib/images/message.png',
                      ],
                      imagePath2: [
                        'lib/images/setting.png',
                      ],
                      starttime: [
                        '-',
                      ],
                      endtime: [
                        '-',
                      ],
                      times: [
                        '-',
                      ],
                      title: [
                        '系统管家',
                      ],
                      titles: [
                        '您的名称违反了社区规范，请尽快修正，如果不修正将会影响到您对app的使用',
                      ]
                  ),
                ),
              );
            },
          ),
          MyCard(
            name: '胡图图',
            subtitle: '这是我给你分享的文件  word.txt',
            imagePath: 'lib/images/rabbit.png',
            time: '星期五',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                      name: '胡图图',
                      subtitles: [
                        '这是我给你分享的文件  word.txt',
                        '这是我给你分享的文件  word1.txt',
                        '这是我给你分享的文件  word2.txt',
                        '这是我给你分享的文件  word3.txt',
                        '这是我给你分享的文件  word4.txt',
                        '这是我给你分享的文件  word5.txt',
                      ],
                      timestamps: [
                        '7月26日',
                        '7月27日',
                        '星期一',
                        '星期二',
                        '星期四',
                        ' ',
                      ],
                      imagePath1: [
                        'lib/images/rabbit.png',
                        'lib/images/rabbit.png',
                        'lib/images/rabbit.png',
                        'lib/images/rabbit.png',
                        'lib/images/rabbit.png',
                        'lib/images/rabbit.png',
                      ],
                      imagePath2: [
                        'lib/images/expired.png',
                        'lib/images/expired.png',
                        'lib/images/expired.png',
                        'lib/images/expired.png',
                        'lib/images/expired.png',
                        'lib/images/effective.png',
                      ],
                      starttime: [
                        '2024-07-26 03:37',
                        '2024-07-27 04:37',
                        '2024-08-05 01:37',
                        '2024-08-06 01:37',
                        '2024-08-07 01:37',
                        '2024-08-08 19:00',
                      ],
                      endtime: [
                        '2024-07-27 03:37',
                        '2024-07-28 04:37',
                        '2024-08-06 01:37',
                        '2024-08-07 01:37',
                        '2024-08-08 01:37',
                        '2024-08-09 19:00',
                      ],
                      times: [
                        '已过期',
                        '已过期',
                        '已过期',
                        '已过期',
                        '已过期',
                        '5小时20分钟',
                      ],
                      title: [
                        '原生开发',
                        '原生开发',
                        '跨平台技术简介',
                        'H5 + 原生',
                        '原生开发',
                        '跨平台技术简介',
                      ],
                      titles: [
                        '原生应用程序是指某一个移动平台（比如iOS或安卓）所特有的应用，使用相应平台支持的开发工具和语言，并直接调用系统提供的SDK API。比如Android原生应用就是指使用Java或Kotlin语言直接调用Android SDK开发的应用程序；而iOS原生应用就是指通过Objective-C或Swift语言直接调用iOS SDK开发的应用程序。原生开发有以下主要优势：',
                        '原生应用程序是指某一个移动平台（比如iOS或安卓）所特有的应用，使用相应平台支持的开发工具和语言，并直接调用系统提供的SDK API。比如Android原生应用就是指使用Java或Kotlin语言直接调用Android SDK开发的应用程序；而iOS原生应用就是指通过Objective-C或Swift语言直接调用iOS SDK开发的应用程序。原生开发有以下主要优势：',
                        '针对原生开发面临的问题，业界一直都在努力寻找好的解决方案，而时至今日，已经有很多跨平台框架（注意，本书中所指的“跨平台”若无特殊说明，即特指 Android 和 iOS 两个平台），根据其原理，主要分为三类：',
                        '这类框架主要原理就是将 App 中需要动态变动的内容通过HTML5（简称 H5）来实现，通过原生的网页加载控件WebView （Android）或 WKWebView（iOS）来加载（以后若无特殊说明，我们用WebView来统一指代 Android 和 iOS 中的网页加载控件）。这种方案中，H5 部分是可以随时改变而不用发版，动态化需求能满足；同时，由于 H5 代码只需要一次开发，就能同时在 Android 和 iOS 两个平台运行，这也可以减小开发成本，也就是说，H5 部分功能越多，开发成本就越小。我们称这种 H5 + 原生 的开发模式为混合开发 ，采用混合模式开发的App我们称之为混合应用或 HTMLybrid App ，如果一个应用的大多数功能都是 H5 实现的话，我们称其为 Web App 。',
                        '原生应用程序是指某一个移动平台（比如iOS或安卓）所特有的应用，使用相应平台支持的开发工具和语言，并直接调用系统提供的SDK API。比如Android原生应用就是指使用Java或Kotlin语言直接调用Android SDK开发的应用程序；而iOS原生应用就是指通过Objective-C或Swift语言直接调用iOS SDK开发的应用程序。原生开发有以下主要优势：',
                        '针对原生开发面临的问题，业界一直都在努力寻找好的解决方案，而时至今日，已经有很多跨平台框架（注意，本书中所指的“跨平台”若无特殊说明，即特指 Android 和 iOS 两个平台），根据其原理，主要分为三类：',
                      ]
                  ),
                ),
              );
            },
          ),
          MyCard(
            name: '胡英俊',
            subtitle: '这是我给你分享的文件  HELLO.txt',
            imagePath: 'lib/images/rabbit.png',
            time: '星期四',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                      name: '胡英俊',
                      subtitles: [
                        '这是我给你分享的文件  HELLO.txt',
                        '这是我给你分享的文件  HELLO1.txt',
                        '这是我给你分享的文件  HELLO2.txt',
                      ],
                      timestamps: [
                        '7月29日',
                        '星期一',
                        '星期四',
                      ],
                      imagePath1: [
                        'lib/images/rabbit.png',
                        'lib/images/rabbit.png',
                        'lib/images/rabbit.png',
                      ],
                      imagePath2: [
                        'lib/images/expired.png',
                        'lib/images/expired.png',
                        'lib/images/expired.png',
                      ],
                      starttime: [
                        '2024-07-29 03:37',
                        '2024-08-05 01:37',
                        '2024-08-08 01:37',
                      ],
                      endtime: [
                        '2024-07-30 03:37',
                        '2024-08-06 01:37',
                        '2024-08-09 01:37',
                      ],
                      times: [
                        '已过期',
                        '已过期',
                        '已过期',
                      ],
                      title: [
                        '原生开发',
                        '原生开发',
                        '跨平台技术简介',
                      ],
                      titles: [
                        '原生应用程序是指某一个移动平台（比如iOS或安卓）所特有的应用，使用相应平台支持的开发工具和语言，并直接调用系统提供的SDK API。比如Android原生应用就是指使用Java或Kotlin语言直接调用Android SDK开发的应用程序；而iOS原生应用就是指通过Objective-C或Swift语言直接调用iOS SDK开发的应用程序。原生开发有以下主要优势：',
                        '原生应用程序是指某一个移动平台（比如iOS或安卓）所特有的应用，使用相应平台支持的开发工具和语言，并直接调用系统提供的SDK API。比如Android原生应用就是指使用Java或Kotlin语言直接调用Android SDK开发的应用程序；而iOS原生应用就是指通过Objective-C或Swift语言直接调用iOS SDK开发的应用程序。原生开发有以下主要优势：',
                        '针对原生开发面临的问题，业界一直都在努力寻找好的解决方案，而时至今日，已经有很多跨平台框架（注意，本书中所指的“跨平台”若无特殊说明，即特指 Android 和 iOS 两个平台），根据其原理，主要分为三类：',
                      ]
                  ),
                ),
              );
            },
          ),
          MyCard(
            name: '小李',
            subtitle: '这是我给你分享的文件  1.txt',
            imagePath: 'lib/images/rabbit.png',
            time: '星期三',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                      name: '小李',
                      subtitles: [
                        '这是我给你分享的文件  1.txt',
                      ],
                      timestamps: [
                        '星期三',
                      ],
                      imagePath1: [
                        'lib/images/rabbit.png',
                      ],
                      imagePath2: [
                        'lib/images/expired.png',
                      ],
                      starttime: [
                        '2024-08-07 01:37',
                      ],
                      endtime: [
                        '2024-08-08 01:37',
                      ],
                      times: [
                        '已过期',
                      ],
                      title: [
                        '跨平台技术简介',
                      ],
                      titles: [
                        '针对原生开发面临的问题，业界一直都在努力寻找好的解决方案，而时至今日，已经有很多跨平台框架（注意，本书中所指的“跨平台”若无特殊说明，即特指 Android 和 iOS 两个平台），根据其原理，主要分为三类：',
                      ]
                  ),
                ),
              );
            },
          ),
          MyCard(
            name: '小闪',
            subtitle: '这是我给你分享的文件  1.txt',
            imagePath: 'lib/images/rabbit.png',
            time: '星期二',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                      name: '小闪',
                      subtitles: [
                        '这是我给你分享的文件  1.txt',
                      ],
                      timestamps: [
                        '星期二',
                      ],
                      imagePath1: [
                        'lib/images/rabbit.png',
                      ],
                      imagePath2: [
                        'lib/images/expired.png',
                      ],
                      starttime: [
                        '2024-08-06 01:37',
                      ],
                      endtime: [
                        '2024-08-07 01:37',
                      ],
                      times: [
                        '已过期',
                      ],
                      title: [
                        '跨平台技术简介',
                      ],
                      titles: [
                        '针对原生开发面临的问题，业界一直都在努力寻找好的解决方案，而时至今日，已经有很多跨平台框架（注意，本书中所指的“跨平台”若无特殊说明，即特指 Android 和 iOS 两个平台），根据其原理，主要分为三类：',
                      ]
                  ),
                ),
              );
            },
          ),
          MyCard(
            name: '小朱',
            subtitle: '这是我给你分享的文件  1.txt',
            imagePath: 'lib/images/rabbit.png',
            time: '星期一',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                      name: '小朱',
                      subtitles: [
                        '这是我给你分享的文件  1.txt',
                      ],
                      timestamps: [
                        '星期一',
                      ],
                      imagePath1: [
                        'lib/images/rabbit.png',
                      ],
                      imagePath2: [
                        'lib/images/expired.png',
                      ],
                      starttime: [
                        '2024-08-05 01:37',
                      ],
                      endtime: [
                        '2024-08-06 01:37',
                      ],
                      times: [
                        '已过期',
                      ],
                      title: [
                        '跨平台技术简介',
                      ],
                      titles: [
                        '针对原生开发面临的问题，业界一直都在努力寻找好的解决方案，而时至今日，已经有很多跨平台框架（注意，本书中所指的“跨平台”若无特殊说明，即特指 Android 和 iOS 两个平台），根据其原理，主要分为三类：',
                      ]
                  ),
                ),
              );
            },
          ),
          MyCard(
            name: '小豪',
            subtitle: '这是我给你分享的文件  1.txt',
            imagePath: 'lib/images/rabbit.png',
            time: '8月4日',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                      name: '小豪',
                      subtitles: [
                        '这是我给你分享的文件  1.txt',
                      ],
                      timestamps: [
                        '8月4日',
                      ],
                      imagePath1: [
                        'lib/images/rabbit.png',
                      ],
                      imagePath2: [
                        'lib/images/expired.png',
                      ],
                      starttime: [
                        '2024-08-04 01:37',
                      ],
                      endtime: [
                        '2024-08-05 01:37',
                      ],
                      times: [
                        '已过期',
                      ],
                      title: [
                        '跨平台技术简介',
                      ],
                      titles: [
                        '针对原生开发面临的问题，业界一直都在努力寻找好的解决方案，而时至今日，已经有很多跨平台框架（注意，本书中所指的“跨平台”若无特殊说明，即特指 Android 和 iOS 两个平台），根据其原理，主要分为三类：',
                      ]
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 200),
        ],
      ),
    );
  }

  Widget _shareMessage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyCard(
            name: '胡图图',
            subtitle: '这是我给你分享的文件  word.txt',
            imagePath: 'lib/images/rabbit.png',
            time: '星期五',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                    name: '胡图图',
                    subtitles: [
                      '这是我给你分享的文件  word.txt',
                      '这是我给你分享的文件  word1.txt',
                      '这是我给你分享的文件  word2.txt',
                      '这是我给你分享的文件  word3.txt',
                      '这是我给你分享的文件  word4.txt',
                      '这是我给你分享的文件  word5.txt',
                    ],
                    timestamps: [
                      '7月26日',
                      '7月27日',
                      '星期一',
                      '星期二',
                      '星期四',
                      ' ',
                    ],
                    imagePath1: [
                      'lib/images/rabbit.png',
                      'lib/images/rabbit.png',
                      'lib/images/rabbit.png',
                      'lib/images/rabbit.png',
                      'lib/images/rabbit.png',
                      'lib/images/rabbit.png',
                    ],
                    imagePath2: [
                      'lib/images/expired.png',
                      'lib/images/expired.png',
                      'lib/images/expired.png',
                      'lib/images/expired.png',
                      'lib/images/expired.png',
                      'lib/images/effective.png',
                    ],
                    starttime: [
                      '2024-07-26 03:37',
                      '2024-07-27 04:37',
                      '2024-08-05 01:37',
                      '2024-08-06 01:37',
                      '2024-08-07 01:37',
                      '2024-08-08 19:00',
                    ],
                    endtime: [
                      '2024-07-27 03:37',
                      '2024-07-28 04:37',
                      '2024-08-06 01:37',
                      '2024-08-07 01:37',
                      '2024-08-08 01:37',
                      '2024-08-09 19:00',
                    ],
                    times: [
                      '已过期',
                      '已过期',
                      '已过期',
                      '已过期',
                      '已过期',
                      '5小时20分钟',
                    ],
                    title: [
                      '原生开发',
                      '原生开发',
                      '跨平台技术简介',
                      'H5 + 原生',
                      '原生开发',
                      '跨平台技术简介',
                    ],
                    titles: [
                      '原生应用程序是指某一个移动平台（比如iOS或安卓）所特有的应用，使用相应平台支持的开发工具和语言，并直接调用系统提供的SDK API。比如Android原生应用就是指使用Java或Kotlin语言直接调用Android SDK开发的应用程序；而iOS原生应用就是指通过Objective-C或Swift语言直接调用iOS SDK开发的应用程序。原生开发有以下主要优势：',
                      '原生应用程序是指某一个移动平台（比如iOS或安卓）所特有的应用，使用相应平台支持的开发工具和语言，并直接调用系统提供的SDK API。比如Android原生应用就是指使用Java或Kotlin语言直接调用Android SDK开发的应用程序；而iOS原生应用就是指通过Objective-C或Swift语言直接调用iOS SDK开发的应用程序。原生开发有以下主要优势：',
                      '针对原生开发面临的问题，业界一直都在努力寻找好的解决方案，而时至今日，已经有很多跨平台框架（注意，本书中所指的“跨平台”若无特殊说明，即特指 Android 和 iOS 两个平台），根据其原理，主要分为三类：',
                      '这类框架主要原理就是将 App 中需要动态变动的内容通过HTML5（简称 H5）来实现，通过原生的网页加载控件WebView （Android）或 WKWebView（iOS）来加载（以后若无特殊说明，我们用WebView来统一指代 Android 和 iOS 中的网页加载控件）。这种方案中，H5 部分是可以随时改变而不用发版，动态化需求能满足；同时，由于 H5 代码只需要一次开发，就能同时在 Android 和 iOS 两个平台运行，这也可以减小开发成本，也就是说，H5 部分功能越多，开发成本就越小。我们称这种 H5 + 原生 的开发模式为混合开发 ，采用混合模式开发的App我们称之为混合应用或 HTMLybrid App ，如果一个应用的大多数功能都是 H5 实现的话，我们称其为 Web App 。',
                      '原生应用程序是指某一个移动平台（比如iOS或安卓）所特有的应用，使用相应平台支持的开发工具和语言，并直接调用系统提供的SDK API。比如Android原生应用就是指使用Java或Kotlin语言直接调用Android SDK开发的应用程序；而iOS原生应用就是指通过Objective-C或Swift语言直接调用iOS SDK开发的应用程序。原生开发有以下主要优势：',
                      '针对原生开发面临的问题，业界一直都在努力寻找好的解决方案，而时至今日，已经有很多跨平台框架（注意，本书中所指的“跨平台”若无特殊说明，即特指 Android 和 iOS 两个平台），根据其原理，主要分为三类：',
                    ]
                  ),
                ),
              );
            },
          ),
          MyCard(
            name: '胡英俊',
            subtitle: '这是我给你分享的文件  HELLO.txt',
            imagePath: 'lib/images/rabbit.png',
            time: '星期四',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                    name: '胡英俊',
                    subtitles: [
                      '这是我给你分享的文件  HELLO.txt',
                      '这是我给你分享的文件  HELLO1.txt',
                      '这是我给你分享的文件  HELLO2.txt',
                    ],
                    timestamps: [
                      '7月29日',
                      '星期一',
                      '星期四',
                    ],
                      imagePath1: [
                        'lib/images/rabbit.png',
                        'lib/images/rabbit.png',
                        'lib/images/rabbit.png',
                      ],
                      imagePath2: [
                        'lib/images/expired.png',
                        'lib/images/expired.png',
                        'lib/images/expired.png',
                      ],
                      starttime: [
                        '2024-07-29 03:37',
                        '2024-08-05 01:37',
                        '2024-08-08 01:37',
                      ],
                      endtime: [
                        '2024-07-30 03:37',
                        '2024-08-06 01:37',
                        '2024-08-09 01:37',
                      ],
                      times: [
                        '已过期',
                        '已过期',
                        '已过期',
                      ],
                      title: [
                        '原生开发',
                        '原生开发',
                        '跨平台技术简介',
                      ],
                      titles: [
                        '原生应用程序是指某一个移动平台（比如iOS或安卓）所特有的应用，使用相应平台支持的开发工具和语言，并直接调用系统提供的SDK API。比如Android原生应用就是指使用Java或Kotlin语言直接调用Android SDK开发的应用程序；而iOS原生应用就是指通过Objective-C或Swift语言直接调用iOS SDK开发的应用程序。原生开发有以下主要优势：',
                        '原生应用程序是指某一个移动平台（比如iOS或安卓）所特有的应用，使用相应平台支持的开发工具和语言，并直接调用系统提供的SDK API。比如Android原生应用就是指使用Java或Kotlin语言直接调用Android SDK开发的应用程序；而iOS原生应用就是指通过Objective-C或Swift语言直接调用iOS SDK开发的应用程序。原生开发有以下主要优势：',
                        '针对原生开发面临的问题，业界一直都在努力寻找好的解决方案，而时至今日，已经有很多跨平台框架（注意，本书中所指的“跨平台”若无特殊说明，即特指 Android 和 iOS 两个平台），根据其原理，主要分为三类：',
                      ]
                  ),
                ),
              );
            },
          ),
          MyCard(
            name: '小李',
            subtitle: '这是我给你分享的文件  1.txt',
            imagePath: 'lib/images/rabbit.png',
            time: '星期三',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                    name: '小李',
                    subtitles: [
                      '这是我给你分享的文件  1.txt',
                    ],
                    timestamps: [
                      '星期三',
                    ],
                      imagePath1: [
                        'lib/images/rabbit.png',
                      ],
                      imagePath2: [
                        'lib/images/expired.png',
                      ],
                      starttime: [
                        '2024-08-07 01:37',
                      ],
                      endtime: [
                        '2024-08-08 01:37',
                      ],
                      times: [
                        '已过期',
                      ],
                      title: [
                        '跨平台技术简介',
                      ],
                      titles: [
                        '针对原生开发面临的问题，业界一直都在努力寻找好的解决方案，而时至今日，已经有很多跨平台框架（注意，本书中所指的“跨平台”若无特殊说明，即特指 Android 和 iOS 两个平台），根据其原理，主要分为三类：',
                      ]
                  ),
                ),
              );
            },
          ),
          MyCard(
            name: '小闪',
            subtitle: '这是我给你分享的文件  1.txt',
            imagePath: 'lib/images/rabbit.png',
            time: '星期二',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                    name: '小闪',
                    subtitles: [
                      '这是我给你分享的文件  1.txt',
                    ],
                    timestamps: [
                      '星期二',
                    ],
                      imagePath1: [
                        'lib/images/rabbit.png',
                      ],
                      imagePath2: [
                        'lib/images/expired.png',
                      ],
                      starttime: [
                        '2024-08-06 01:37',
                      ],
                      endtime: [
                        '2024-08-07 01:37',
                      ],
                      times: [
                        '已过期',
                      ],
                      title: [
                        '跨平台技术简介',
                      ],
                      titles: [
                        '针对原生开发面临的问题，业界一直都在努力寻找好的解决方案，而时至今日，已经有很多跨平台框架（注意，本书中所指的“跨平台”若无特殊说明，即特指 Android 和 iOS 两个平台），根据其原理，主要分为三类：',
                      ]
                  ),
                ),
              );
            },
          ),
          MyCard(
            name: '小朱',
            subtitle: '这是我给你分享的文件  1.txt',
            imagePath: 'lib/images/rabbit.png',
            time: '星期一',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                    name: '小朱',
                    subtitles: [
                      '这是我给你分享的文件  1.txt',
                    ],
                    timestamps: [
                      '星期一',
                    ],
                      imagePath1: [
                        'lib/images/rabbit.png',
                      ],
                      imagePath2: [
                        'lib/images/expired.png',
                      ],
                      starttime: [
                        '2024-08-05 01:37',
                      ],
                      endtime: [
                        '2024-08-06 01:37',
                      ],
                      times: [
                        '已过期',
                      ],
                      title: [
                        '跨平台技术简介',
                      ],
                      titles: [
                        '针对原生开发面临的问题，业界一直都在努力寻找好的解决方案，而时至今日，已经有很多跨平台框架（注意，本书中所指的“跨平台”若无特殊说明，即特指 Android 和 iOS 两个平台），根据其原理，主要分为三类：',
                      ]
                  ),
                ),
              );
            },
          ),
          MyCard(
            name: '小豪',
            subtitle: '这是我给你分享的文件  1.txt',
            imagePath: 'lib/images/rabbit.png',
            time: '8月4日',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardListPage(
                    name: '小豪',
                    subtitles: [
                      '这是我给你分享的文件  1.txt',
                    ],
                    timestamps: [
                      '8月4日',
                    ],
                      imagePath1: [
                        'lib/images/rabbit.png',
                      ],
                      imagePath2: [
                        'lib/images/expired.png',
                      ],
                      starttime: [
                        '2024-08-04 01:37',
                      ],
                      endtime: [
                        '2024-08-05 01:37',
                      ],
                      times: [
                        '已过期',
                      ],
                      title: [
                        '跨平台技术简介',
                      ],
                      titles: [
                        '针对原生开发面临的问题，业界一直都在努力寻找好的解决方案，而时至今日，已经有很多跨平台框架（注意，本书中所指的“跨平台”若无特殊说明，即特指 Android 和 iOS 两个平台），根据其原理，主要分为三类：',
                      ]
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 200),
        ],
      ),
    );
  }
 }

