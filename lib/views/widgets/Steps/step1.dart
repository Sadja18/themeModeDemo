import 'package:flutter/material.dart';

class Step1 extends StatefulWidget {
  final int stepIndex;
  final Function(int, bool) isStepCompleted;

  const Step1({
    super.key,
    required this.stepIndex,
    required this.isStepCompleted,
  });

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  void showDialogForStep1() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Demo Step 1"),
        content: const Text("Mark this step as completed or unmark it?"),
        actions: [
          TextButton(
            onPressed: () {
              widget.isStepCompleted(widget.stepIndex, false);
              Navigator.pop(context);
            },
            child: const Text(
              "Unmark",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () {
              widget.isStepCompleted(widget.stepIndex, true);
              Navigator.pop(context);
            },
            child: const Text(
              "Confirm",
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Step 1 text"),
          ElevatedButton(
            onPressed: showDialogForStep1,
            child: const Text("Step1"),
          ),
        ],
      ),
    );
  }
}
