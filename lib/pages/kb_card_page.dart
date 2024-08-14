import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/share_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MyCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String imagePath;
  final String time;
  final VoidCallback onTap;

  const MyCard({
    Key? key,
    required this.name,
    required this.subtitle,
    required this.imagePath,
    required this.onTap,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(5.r),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                child: Image.asset(
                  imagePath,
                  width: 50.r,
                  height: 50.r,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 5.r),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(fontSize: 10.r, color: Colors.grey),
                        ),
                      ],
                    ),
                    Text(
                      subtitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardListPage extends StatefulWidget {
  final String name;
  final List<String> subtitles;
  final List<String> timestamps;
  final List<String> imagePath1;
  final List<String> imagePath2;
  final List<String> starttime;
  final List<String> endtime;
  final List<String> times;
  final List<String> title;
  final List<String> titles;

  const CardListPage({
    Key? key,
    required this.name,
    required this.subtitles,
    required this.timestamps,
    required this.imagePath1,
    required this.imagePath2,
    required this.starttime,
    required this.endtime,
    required this.times,
    required this.title,
    required this.titles,
  }) : super(key: key);

  @override
  _CardListPageState createState() => _CardListPageState();
}

class _CardListPageState extends State<CardListPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollToBottom();
      });
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.name),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWeb = kIsWeb && constraints.maxWidth > 800;

          return Center(
            child: isWeb
                ? FittedBox(
              fit: BoxFit.contain,
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 360.w,
                  maxHeight: 1600.h,
                ),
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(8.0),
                  itemCount: widget.subtitles.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(
                            child: Text(
                              widget.timestamps[index],
                              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        ManyCards(
                          subtitle: widget.subtitles[index],
                          imagePath1: widget.imagePath1[index],
                          name: widget.name,
                          imagePath2: widget.imagePath2[index],
                          starttime: widget.starttime[index],
                          endtime: widget.endtime[index],
                          times: widget.times[index],
                          title: widget.title[index],
                          titles: widget.titles[index],
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
                : ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(8.0),
              itemCount: widget.subtitles.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Center(
                        child: Text(
                          widget.timestamps[index],
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    ManyCards(
                      subtitle: widget.subtitles[index],
                      imagePath1: widget.imagePath1[index],
                      name: widget.name,
                      imagePath2: widget.imagePath2[index],
                      starttime: widget.starttime[index],
                      endtime: widget.endtime[index],
                      times: widget.times[index],
                      title: widget.title[index],
                      titles: widget.titles[index],
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }


}



class ManyCards extends StatelessWidget {
  final String subtitle;
  final String name;
  final String imagePath1;
  final String imagePath2;
  final String starttime;
  final String endtime;
  final String times;
  final String title;
  final String titles;


  const ManyCards({
    Key? key,
    required this.subtitle,
    required this.name,
    required this.imagePath1,
    required this.imagePath2,
    required this.starttime,
    required this.endtime,
    required this.times,
    required this.title,
    required this.titles,
  }) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Card(
  //     elevation: 2,
  //     shadowColor: Colors.grey,
  //     margin: const EdgeInsets.all(2),
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(5)),
  //     ),
  //     child: Padding(
  //         padding: const EdgeInsets.all(12.0),
  //         child: IntrinsicHeight(
  //           child: Row(
  //             children: [
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     Text(
  //                       subtitle,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //   );
  // }

  String _subMainBody(String mainBody) {
    if (mainBody.length <= 10) {
      return mainBody;
    } else {
      return "${mainBody.substring(0, 10)}···";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 190.w,
          padding: EdgeInsets.fromLTRB(15.w, 15.w, 15.w, 0.w),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            // widget.shareContent.user.profilePicture!,
                            imagePath1,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 11,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            _subMainBody(titles),
                            style: TextStyle(
                              color: const Color(0xFFA9A9A9),
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1.w,
                  margin: EdgeInsets.only(bottom: 5.w),
                  color: const Color(0xFFDCDCDC),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "发布用户：",
                          style: TextStyle(
                            color: const Color(0xFFA9A9A9),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: name,
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "开始时间：",
                          style: TextStyle(
                            color: const Color(0xFFA9A9A9),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: starttime,
                          // DateFormat('yyyy-MM-dd HH:mm')
                              // .format(widget.shareContent.startTime),
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "结束时间：",
                          style: TextStyle(
                            color: const Color(0xFFA9A9A9),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: endtime,
                          // DateFormat('yyyy-MM-dd HH:mm')
                          //     .format(widget.shareContent.endTime),
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "有效时长：",
                          style: TextStyle(
                            color: const Color(0xFFA9A9A9),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: times,
                          //text: widget.shareContent.isExpire ? '已过期' : "${widget.shareContent.effectiveHour}小时${widget.shareContent.effectiveMinute}分钟",
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 1.w,
                  margin: EdgeInsets.symmetric(vertical: 4.w),
                  color: const Color(0xFFDCDCDC),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 40.w,
          top: 30.w,
          child: Container(
            width: 100.w,
            height: 100.w,
            color: Colors.white,
            child: Image.asset(
              imagePath2,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}