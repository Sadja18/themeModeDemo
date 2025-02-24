import 'package:flutter/material.dart';
import 'package:theme_mode_demo/models/step_item.dart';

class CustomStepperV2 extends StatefulWidget {
  final List<StepItem> steps;
  final int initialStep;

  const CustomStepperV2({super.key, required this.steps, this.initialStep = 0});

  @override
  CustomStepperV2State createState() => CustomStepperV2State();
}

class CustomStepperV2State extends State<CustomStepperV2> {
  late int _currentStep;

  @override
  void initState() {
    super.initState();
    _currentStep = widget.initialStep;
  }

  void _goToStep(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  Widget _buildStepIndicator(int index) {
    bool isActive = index == _currentStep;
    return GestureDetector(
      onTap: () => _goToStep(index),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.blue : Colors.grey,
        ),
        child: Center(child: widget.steps[index].icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      color: Colors.white10,
      child: Column(
        children: [
          Row(
            children: List.generate(
              widget.steps.length * 2 - 1,
              (index) {
                if (index.isEven) {
                  int stepIndex = index ~/ 2;
                  return _buildStepIndicator(stepIndex);
                } else {
                  return Expanded(
                    child: Container(
                      height: 4,
                      color: Colors.grey, // Line between steps
                    ),
                  );
                }
              },
            ),
          ),
          Expanded(
            child: widget.steps[_currentStep].content,
          ),
        ],
      ),
    );
  }
}
