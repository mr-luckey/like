import 'package:ff_annotation_route_library/ff_annotation_route_library.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

///
///  create by zhoumaotuo on 2019/5/27
///

const double buttonSize = 40.0;

@FFRoute(
  name: 'fluttercandies://LikeButtonDemo',
  routeName: 'like button',
  description: 'show how to build like button',
)
class LikeButtonDemo extends StatefulWidget {
  @override
  _LikeButtonDemoState createState() => _LikeButtonDemoState();
}

class _LikeButtonDemoState extends State<LikeButtonDemo> {
  final int likeCount = 999;
  final GlobalKey<LikeButtonState> _globalKey = GlobalKey<LikeButtonState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Like Button Demo'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300),
        children: <Widget>[
          LikeButton(
            size: buttonSize,
            likeCount: likeCount,
            key: _globalKey,
            countBuilder: (int? count, bool isLiked, String text) {
              final ColorSwatch<int> color =
                  isLiked ? Colors.pinkAccent : Colors.grey;
              Widget result;
              if (count == 0) {
                result = Text(
                  'love',
                  style: TextStyle(color: color),
                );
              } else
                result = Text(
                  count! >= 1000
                      ? (count / 1000.0).toStringAsFixed(1) + 'k'
                      : text,
                  style: TextStyle(color: color),
                );
              return result;
            },
            likeCountAnimationType: likeCount < 1000
                ? LikeCountAnimationType.part
                : LikeCountAnimationType.none,
            likeCountPadding: const EdgeInsets.only(left: 15.0),
            onTap: onLikeButtonTapped,
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.favorite),
        onPressed: () {
          _globalKey.currentState!.onTap();
        },
      ),
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }
}
