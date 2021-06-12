/// Builds indication marks for PageView from any Widget and/or Animation.
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:frontend/layouts/horizontal-slidable/indicator.dart';
import 'package:frontend/main.dart';

typedef Widget IndicatorBuilder(AnimationController controller, int index);

// ignore: must_be_immutable
class IndicatorContainer extends StatefulWidget {
  IndicatorContainer({
    required this.pageIndexNotifier,
    required this.length,
    required this.getOffset,
    required this.normalBuilder,
    required this.highlightedBuilder,
  });

  ValueNotifier<int> pageIndexNotifier;
  int length;
  IndicatorBuilder normalBuilder;
  IndicatorBuilder highlightedBuilder;
  double Function(int) getOffset;

  @override
  _IndicatorContainerState createState() => _IndicatorContainerState();
}

class _IndicatorContainerState extends State<IndicatorContainer>
    with TickerProviderStateMixin {
  List<Indicator> _indicators = [];
  late int _prevPage;

  void _generateIndicators() {
    _indicators.forEach((indicator) => indicator.dispose());
    _indicators = List.generate(
        widget.length,
        (index) => Indicator(
            index: index,
            normalController: AnimationController(
              vsync: this,
              duration: Duration(microseconds: 200),
            )..forward(),
            highlightedController: AnimationController(
              vsync: this,
              duration: Duration(milliseconds: 200),
            )));
  }

  void _indicatorsListener() {
    final currPage = widget.pageIndexNotifier.value;

    if (currPage != _prevPage) {
      _indicators[_prevPage].normalController.forward();
      _indicators[_prevPage].highlightedController.reverse();

      _indicators[currPage].normalController.reverse();
      _indicators[currPage].highlightedController.forward();

      _prevPage = currPage;
    }
  }

  void _addIndicatorsListener() {
    widget.pageIndexNotifier.removeListener(_indicatorsListener);
    widget.pageIndexNotifier.addListener(_indicatorsListener);
  }

  @override
  void initState() {
    super.initState();
    _prevPage = max(0, widget.pageIndexNotifier.value);

    _generateIndicators();

    _indicators[widget.pageIndexNotifier.value].normalController.reverse();
    _indicators[widget.pageIndexNotifier.value].highlightedController.forward();

    _addIndicatorsListener();
  }

  @override
  void didUpdateWidget(IndicatorContainer oldWidget) {
    if (oldWidget.length != widget.length) {
      final currPage = min(widget.pageIndexNotifier.value, widget.length - 1);

      _generateIndicators();

      _indicators[currPage].normalController.reverse();
      _indicators[currPage].highlightedController.forward();

      _prevPage = currPage;
    }

    super.didUpdateWidget(oldWidget);

    _addIndicatorsListener();
  }

  @override
  void dispose() {
    _indicators.forEach((indicator) => indicator.dispose());
    widget.pageIndexNotifier.removeListener(_indicatorsListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: _indicators
            .map<Widget>(
              (indicator) => Positioned(
                left: widget.getOffset(indicator.index),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    widget.normalBuilder(
                        indicator.normalController, indicator.index),
                    widget.highlightedBuilder(
                        indicator.highlightedController, indicator.index),
                  ],
                ),
              ),
            )
            .toList());
  }
}
