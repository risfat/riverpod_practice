import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';



// Note: StateNotifierProvider has *two* type annotations
final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});


class Clock extends StateNotifier<DateTime> {
  // 1. initialize with current time
  Clock() : super(DateTime.now()) {
    startTimer();
  }

  late final Timer _timer;

  void startTimer(){
    // 2. create a timer that fires every second
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      // 3. update the state with the current time
      state = DateTime.now();
    });
  }
  void resetTimer() {
    if (_timer.isActive){
    _timer.cancel();
    // startTimer();
    }else{
      startTimer();
    }
  }

  // 4. cancel the timer when finished
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
