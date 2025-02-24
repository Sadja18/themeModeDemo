import 'package:flutter/material.dart';
import 'package:theme_mode_demo/helper/consoler.dart';
import 'package:theme_mode_demo/models/step_item.dart';
import 'package:theme_mode_demo/views/widgets/Steps/step1.dart';
import 'package:theme_mode_demo/views/widgets/Steps/step2.dart';
import 'package:theme_mode_demo/views/widgets/Steps/step3.dart';
import 'package:theme_mode_demo/views/widgets/stepper_v2/custom_stepper_v2.dart';

class StepperV2 extends StatefulWidget {
  const StepperV2({super.key});

  @override
  State<StepperV2> createState() => _StepperV2State();
}

class _StepperV2State extends State<StepperV2> {
  int _currentStep = 0;
  List<int> _completedSteps = [];
  late List<StepItem> steps;

  isStepCompleted(int index, bool isStepCompleted) {
    if (index > 3 || index < 0) {
      Consoler.printNormal("Index $index out of possible steps");
      return;
    }

    if (!isStepCompleted && _completedSteps.contains(index)) {
      Consoler.printNormal("Removing $index from $_completedSteps");
      List<int> tmpSteps = _completedSteps;
      tmpSteps.removeWhere((element) => element == index);
      setState(() {
        _completedSteps = tmpSteps;
      });
      Consoler.printNormal("Updated completed steps $_completedSteps");
    }

    // if control came here
    // this means the index for step was completed

    var steps = _completedSteps;
    if (!_completedSteps.contains(index)) {
      steps.add(index);
    }

    steps.sort();

    int newCurrentStep =
        steps.last < steps.length - 1 && steps.last + 1 < steps.length - 1
            ? steps.last + 1
            : steps.length - 1;

    setState(() {
      _completedSteps = steps;
      _currentStep = newCurrentStep; // Ensure current step is always max
    });

    Consoler.printNormal(
        "For step index $index : completed state is $isStepCompleted $_completedSteps $_currentStep $steps $newCurrentStep");
  }

  void changeCurrentStep(int stepValue) {
    if (stepValue < 0 || stepValue > 3) {
      Consoler.printNormal("Step value out of bounds");
    }
    setState(() {
      _currentStep = stepValue;
    });
  }

  @override
  void initState() {
    setState(() {
      _currentStep = 0;
      steps = [
        StepItem(
          icon: Icon(Icons.looks_one, color: Colors.white),
          content: Step1(
            stepIndex: 0,
            isStepCompleted: isStepCompleted,
          ),
        ),
        StepItem(
          icon: Icon(Icons.looks_two, color: Colors.white),
          content: Step2(
            stepIndex: 1,
            isStepCompleted: isStepCompleted,
          ),
        ),
        StepItem(
          icon: Icon(Icons.looks_3, color: Colors.white),
          content: Step3(
            stepIndex: 2,
            isStepCompleted: isStepCompleted,
          ),
        ),
      ];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomStepperV2(
      steps: steps,
      initialStep: _currentStep, // Optional, default is 0
    );
  }
}
