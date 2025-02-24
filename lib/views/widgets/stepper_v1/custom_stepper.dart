import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  final List<Widget> steps;
  final int initialStep;

  const CustomStepper({super.key, required this.steps, this.initialStep = 0});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
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

  iconForIndex(int index) {
    switch (index) {
      case 0:
        return Icon(Icons.list);
      case 1:
        if (widget.steps.length - 1 == 3) {
          return Icon(Icons.cloud_upload_sharp);
        } else {
          return Icon(Icons.fact_check_sharp);
        }
      case 2:
        if (widget.steps.length - 1 == 3) {
          return Icon(Icons.fact_check_sharp);
        } else {
          return Icon(Icons.preview_sharp);
        }
      default:
        return Icon(Icons.preview_sharp);
    }
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
        child: Center(
          // child: Text(
          //   '${index + 1}', // Or a custom icon/widget
          //   style: TextStyle(color: Colors.white),
          // ),
          child: iconForIndex(index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            widget.steps.length,
            (index) => _buildStepIndicator(index),
          ),
        ),
        Expanded(
          child: widget.steps[_currentStep],
        ),
      ],
    );
  }
}
