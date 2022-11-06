import 'package:flutter/material.dart';
import '../utils/style.dart';

class ProgressBar extends StatefulWidget {
  final int progression;
  const ProgressBar(this.progression, {Key? key}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late double ratio;

  @override
  void initState() {
    super.initState();
    ratio = widget.progression / 20;

    _initAnimation();
  }

  void _initAnimation() {
    final double _endValue = widget.progression / 100;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      upperBound: _endValue,
    );
    _animation = _controller;

    _animation = Tween<double>(
      begin: _animation.value,
      end: _endValue,
    ).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: _controller,
    ));

    if (widget.progression > 0) _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Progress", style: AppStyle.smallWhiteTextStyle),
            AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return Text(
                  "${(_controller.value * 100).toInt()}%",
                  style: AppStyle.smallWhiteTextStyle,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 5),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final boxWidth = constraints.constrainWidth();
            const dashCount = 5;

            final dashWidth = (boxWidth / dashCount) - 5;

            return Flex(
              children: List.generate(5, (index) {
                return SizedBox(
                  width: dashWidth,
                  height: 6,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: LinearProgressIndicator(
                        value: _barValue(index + 1),
                        semanticsLabel: "Linear progress indicator",
                        minHeight: 5,
                        color: Colors.white,
                        backgroundColor: Colors.white.withOpacity(.2),
                      ),
                    ),
                  ),
                );
              }),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
            );
          },
        )
      ],
    );
  }

  double _barValue(int position) {
    if (position < ratio) {
      return 1;
    }

    final int barCount = ratio.truncate();
    if (position == barCount + 1) {
      return ratio.remainder(barCount);
    }

    return 0;
  }
}
