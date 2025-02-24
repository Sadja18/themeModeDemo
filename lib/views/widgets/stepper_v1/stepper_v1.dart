import 'package:flutter/material.dart';
import 'package:theme_mode_demo/helper/consoler.dart';
import 'package:theme_mode_demo/views/widgets/Steps/step1.dart';
import 'package:theme_mode_demo/views/widgets/Steps/step2.dart';
import 'package:theme_mode_demo/views/widgets/Steps/step3.dart';
import 'package:theme_mode_demo/views/widgets/stepper_v1/custom_stepper.dart';

class StepperV1 extends StatefulWidget {
  const StepperV1({super.key});

  @override
  State<StepperV1> createState() => _StepperV1State();
}

class _StepperV1State extends State<StepperV1> {
  List<int> _completedSteps = [];
  int _currentStep = 0;

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

    Consoler.printNormal(
        "For step index $index : completed state is $isStepCompleted");
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
      _completedSteps = [];
      _currentStep = 0;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomStepper(steps: [
      Step1(
        stepIndex: 0,
        isStepCompleted: isStepCompleted,
      ),
      Step2(
        stepIndex: 1,
        isStepCompleted: isStepCompleted,
      ),
      Step3(
        stepIndex: 2,
        isStepCompleted: isStepCompleted,
      ),
      // Step3(
      //   stepIndex: 2,
      //   isStepCompleted: isStepCompleted,
      // ),
    ]);
  }
}
