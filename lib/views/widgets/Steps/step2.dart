import 'package:flutter/material.dart';

class Step2 extends StatefulWidget {
  final int stepIndex;
  final Function(int, bool) isStepCompleted;

  const Step2({
    super.key,
    required this.stepIndex,
    required this.isStepCompleted,
  });

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  Future<void> _showStepDialog() async {
    bool? isCompleted = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Demo Step 2"),
        content: const Text("Mark this step as completed or unmark it?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              "Unmark",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              "Confirm",
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );

    if (isCompleted != null) {
      widget.isStepCompleted(widget.stepIndex, isCompleted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Step 2 text"),
          ElevatedButton(
            onPressed: _showStepDialog,
            child: const Text("Step2"),
          ),
        ],
      ),
    );
  }
}
