import 'package:flutter/material.dart';
import 'package:theme_mode_demo/helper/consoler.dart';
import 'package:theme_mode_demo/models/step_item.dart';

class CustomStepper extends StatefulWidget {
  final List<StepItem> steps;
  final int currentStep;
  final List<int> completedSteps;
  final Color activeStepColor;
  final Color completedStepColor;
  final Color incompleteStepColor;
  final Function(int) onStepTapped; // ✅ Add callback
  final bool isLinear;

  const CustomStepper({
    super.key,
    required this.steps,
    this.currentStep = 0,
    required this.completedSteps,
    required this.activeStepColor,
    required this.completedStepColor,
    required this.incompleteStepColor,
    required this.onStepTapped,
    this.isLinear = true,
  });

  @override
  CustomStepperState createState() => CustomStepperState();
}

class CustomStepperState extends State<CustomStepper> {
  late int _currentStep;

  Color _getStepColor(int index) {
    if (index == widget.currentStep) {
      return widget.activeStepColor;
    } else if (widget.completedSteps.contains(index)) {
      return widget.completedStepColor;
    } else {
      return widget.incompleteStepColor;
    }
  }

  @override
  void initState() {
    super.initState();
    _currentStep = widget.currentStep;

    Consoler.printNormal("_current step is $_currentStep");
  }

  void _goToStep(int step) {
    // ✅ Restrict navigation if `isLinear` is enabled
    if (widget.isLinear && step > 0 && !widget.completedSteps.contains(step - 1)) {
      Consoler.printNormal("Step $step is locked! Complete previous steps first.");
      return;
    }

    setState(() {
      _currentStep = step;
    });
    widget.onStepTapped(step); // ✅ Notify parent
  }

  Widget _buildStepIndicator(int index) {
    return GestureDetector(
      onTap: () => _goToStep(index),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _getStepColor(index),
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
