import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Flipper extends StatefulWidget {
  final int? count;
  const Flipper({Key? key, this.count}) : super(key: key);

  @override
  _FlipperState createState() => _FlipperState();
}

class _FlipperState extends State<Flipper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: AnimationLimiter(
          child: GridView.count(
            childAspectRatio: 1.2,
            reverse: true,
            crossAxisCount: 4,
            children: List.generate(
              28,
              (int index) {
                return index >= widget.count!
                    ? const SizedBox()
                    : AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        delay: const Duration(milliseconds: 200),
                        columnCount: 4,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: Container(
                              margin: const EdgeInsets.all(0.3),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                // border: Border.all()
                              ),
                            ),
                          ),
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
    // Scaffold(
    //     appBar: AppBar(
    //       title: Text(widget.title!),
    //       centerTitle: true,
    //     ),
    //     body: Center(
    //       child: Container(
    //         constraints: BoxConstraints.tight(const Size.square(200.0)),
    //         child: _buildFlipAnimation(),
    //       ),
    //     ));
  }
}
