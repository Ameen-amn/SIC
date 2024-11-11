import 'dart:async';

import 'package:flutter/material.dart';

class TypingTextAnimationWithCursor extends StatefulWidget {
  final String text;
  final Duration typingSpeed;
  final Duration cursorBlinkSpeed;

  const TypingTextAnimationWithCursor({
    super.key,
    required this.text,
    this.typingSpeed = const Duration(milliseconds: 60), // Typing speed
    this.cursorBlinkSpeed =
        const Duration(milliseconds: 500), // Cursor blink speed
  });

  @override
  _TypingTextAnimationWithCursorState createState() =>
      _TypingTextAnimationWithCursorState();
}

class _TypingTextAnimationWithCursorState
    extends State<TypingTextAnimationWithCursor> {
  String _displayedText = "";
  int _currentIndex = 0;
  Timer? _typingTimer;
  Timer? _cursorTimer;
  bool _showCursor = true;

  @override
  void initState() {
    super.initState();
    _startTypingAnimation();
    _startCursorBlink();
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    _cursorTimer?.cancel();
    super.dispose();
  }

  void _startTypingAnimation() {
    _typingTimer = Timer.periodic(widget.typingSpeed, (timer) {
      if (_currentIndex < widget.text.length) {
        setState(() {
          _displayedText += widget.text[_currentIndex];
          _currentIndex++;
        });
      } else {
        timer.cancel();
        _stopCursorBlink(); // Stop the cursor blinking when typing is done
      }
    });
  }

  void _startCursorBlink() {
    _cursorTimer = Timer.periodic(widget.cursorBlinkSpeed, (timer) {
      setState(() {
        _showCursor = !_showCursor; // Toggle cursor visibility
      });
    });
  }

  void _stopCursorBlink() {
    _cursorTimer?.cancel(); // Stop the cursor timer
    setState(() {
      _showCursor = false; // Hide cursor
    });
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: _displayedText,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 22)),
          if (_showCursor)
            const TextSpan(
                text: "I",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22))
        ]));
    // Text(
    //   _displayedText + (_showCursor ? "I" : ""), // Add cursor at the end
    //   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    // );
  }
}
