import 'package:flutter/material.dart';

class Step3 extends StatefulWidget {
  final int stepIndex;
  final Function(int, bool) isStepCompleted;

  const Step3({
    super.key,
    required this.stepIndex,
    required this.isStepCompleted,
  });

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  Future<void> _showStepDialog() async {
    bool? isCompleted = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Demo Step 3"),
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
          const Text("Step 3 text"),
          ElevatedButton(
            onPressed: _showStepDialog,
            child: const Text("Step3"),
          ),
        ],
      ),
    );
  }
}
