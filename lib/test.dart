import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // intl kutubxonasini qo'shish

class DateTimePickerExample extends StatefulWidget {
  @override
  _DateTimePickerExampleState createState() => _DateTimePickerExampleState();
}

class _DateTimePickerExampleState extends State<DateTimePickerExample> {
  DateTime? _selectedDate; // Sana uchun o'zgaruvchi
  TimeOfDay? _selectedTime; // Vaqt uchun o'zgaruvchi

  Future<void> _selectDateTime(BuildContext context) async {
    // Sanani tanlash
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      // Vaqtni tanlash
      final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        setState(() {
          _selectedDate = selectedDate; // Tanlangan sana
          _selectedTime = selectedTime; // Tanlangan vaqt
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date & Time Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tanlangan sana va vaqtni ko'rsatish
            Text(
              _selectedDate != null && _selectedTime != null
                  ? "Tanlangan sana: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}\nTanlangan vaqt: ${_selectedTime!.format(context)}"
                  : "Sana va vaqt tanlanmagan",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDateTime(context),
              child: Text("Sana va vaqtni tanlang"),
            ),
          ],
        ),
      ),
    );
  }
}
