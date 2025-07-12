import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
 
  final Function(String) onTimeSelected; // Add callback function
  const DropDown({super.key, required this.onTimeSelected});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  int _hour = 0;
  int _minute = 0;
  int _second = 0;

  List<DropdownMenuItem<int>> get hours {
    return List.generate(24, (index) => DropdownMenuItem(
      value: index,
      child: Text(index < 10 ? '0$index' : '$index'),
    ));
  }

  List<DropdownMenuItem<int>> get minutes {
    return List.generate(60, (index) => DropdownMenuItem(
      value: index,
      child: Text(index < 10 ? '0$index' : '$index'),
    ));
  }

  List<DropdownMenuItem<int>> get seconds {
    return List.generate(60, (index) => DropdownMenuItem(
      value: index,
      child: Text(index < 10 ? '0$index' : '$index'),
    ));
  }

  void _onSelected(int value, int dropdownIndex) {
    setState(() {
      switch (dropdownIndex) {
        case 0:
          _hour = value;
          break;
        case 1:
          _minute = value;
          break;
        case 2:
          _second = value;
          break;
      }
    });
  }
void _printSelectedTime() {
  // Format each of the time components to a two-digit string
  String formattedHour = _hour.toString().padLeft(2, '0');
  String formattedMinute = _minute.toString().padLeft(2, '0');
  String formattedSecond = _second.toString().padLeft(2, '0');

  // Print the formatted time
  // ignore: avoid_print
  print('Selected Time: $formattedHour:$formattedMinute:$formattedSecond');
  String selectedTime = '$formattedHour:$formattedMinute:$formattedSecond';
  widget.onTimeSelected(selectedTime); // Call callback function

  String Timer = selectedTime; // Assign to Timer variable
}


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text("Hour",style: TextStyle(fontWeight: FontWeight.bold),),
                  DropdownButton<int>(
                    value: _hour,
                    items: hours,
                    onChanged: (value) => _onSelected(value!, 0),
                    hint: const Text('Hour'),
                  ),
                  
                ],
              ),
              const Text(':'),
              Column(
                children: [
                  const Text("Minutes",style: TextStyle(fontWeight: FontWeight.bold),),
                  DropdownButton<int>(
                    value: _minute,
                    items: minutes,
                    onChanged: (value) => _onSelected(value!, 1),
                    hint: const Text('Minute'),
                  ),
                ],
              ),
              const Text(':'),
              Column(
                children: [
                  const Text("Seconds",style: TextStyle(fontWeight: FontWeight.bold),),
                  DropdownButton<int>(
                    value: _second,
                    items: seconds,
                    onChanged: (value) => _onSelected(value!, 2),
                    hint: const Text('Second'),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: _printSelectedTime,
            child: const Text('Check'),
          ),
        ],
      ),
    );
  }
}
