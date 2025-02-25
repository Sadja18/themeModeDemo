import 'package:flutter/material.dart';
import 'package:theme_mode_demo/helper/consoler.dart';
import 'package:theme_mode_demo/models/step_item.dart';
import 'package:theme_mode_demo/views/widgets/Steps/step.dart';
import 'package:theme_mode_demo/views/widgets/custom/custom_stepper.dart';

class StepperNonLinear extends StatefulWidget {
  const StepperNonLinear({super.key});

  @override
  State<StepperNonLinear> createState() => _StepperNonLinearState();
}

class _StepperNonLinearState extends State<StepperNonLinear> {
  int _currentStep = 0;
  List<int> _completedSteps = [];
  late List<StepItem> steps;

  isStepCompleted(int index, bool isStepCompleted) {
    if (index < 0 || index > 3) {
      Consoler.printNormal("Index $index out of possible steps");
      return;
    }

    List<int> updatedSteps = List.from(_completedSteps);

    if (!isStepCompleted) {
      var markAsIncomplete = updatedSteps.remove(index);
      if (markAsIncomplete) {
        setState(() {
          _completedSteps = updatedSteps;
        });
        Consoler.printNormal(
            "Removed $index. Updated completed steps: $_completedSteps");
        changeCurrentStep(index);
      }
      return;
    }

    if (!updatedSteps.contains(index)) {  
      updatedSteps.add(index);
      updatedSteps.sort();
    }

    int newCurrentStep =
        (updatedSteps.last + 1 < steps.length - 1) && (index >= 0)
            ? updatedSteps.last + 1
            : steps.length - 1;

    setState(() {
      _completedSteps = updatedSteps;
    });

    changeCurrentStep(newCurrentStep);

    Consoler.printNormal(
        "Step $index completed: $isStepCompleted | Completed: $_completedSteps | Current: $_currentStep");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Consoler.printNormal("updating didChangeDependencies");

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ✅ Check if all steps are already completed (e.g., from API or DB)
      if (_completedSteps.length == steps.length) {
        Future.delayed(Duration.zero, () => _showUploadDialog());
      }
    });
  }

  void _showUploadDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("All Steps Completed"),
        content: Text("Your information is ready to upload."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
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
    super.initState();

    // _currentStep = 0;
    steps = [
      StepItem(
        icon: Icon(Icons.list_sharp, color: Colors.white),
        content: StepWidget(
          stepName: "Step 1",
          stepIndex: 0,
          isStepCompleted: isStepCompleted,
        ),
      ),
      StepItem(
        icon: Icon(Icons.file_upload_sharp, color: Colors.white),
        content: StepWidget(
          stepName: "Step 2",
          stepIndex: 1,
          isStepCompleted: isStepCompleted,
        ),
      ),
      StepItem(
        icon: Icon(Icons.upload_sharp, color: Colors.white),
        content: StepWidget(
          stepName: "Step 3",
          stepIndex: 2,
          isStepCompleted: isStepCompleted,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomStepper(
      key: ValueKey(
          "$_currentStep $_completedSteps"), // Forces a rebuild when _currentStep changes
      steps: steps,
      currentStep: _currentStep, // Optional, default is 0
      completedSteps: _completedSteps,
      activeStepColor: Colors.blue,
      completedStepColor: Colors.orange,
      incompleteStepColor: Colors.grey,
      onStepTapped: (step) => changeCurrentStep(step), // ✅ Handle step tap,
      isLinear: false,
    );
  }
}
