import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:test_feature/notification.dart';

class NoteThumbnail extends StatefulWidget {
  const NoteThumbnail(
      {Key? key,
      required this.id,
      required this.color,
      required this.title,
      required this.content})
      : super(key: key);

  final int id;
  final Color color;
  final String title;
  final String content;

  @override
  State<NoteThumbnail> createState() => _NoteThumbnailState();
}

class _NoteThumbnailState extends State<NoteThumbnail> {
  DateTime selectedDate = DateTime.now();
  DateTime fullDate = DateTime.now();
  final NotificationService _notificationService = NotificationService();

  // Future<DateTime> _selectDate(BuildContext context) async {
  //   final date = await showDatePicker(
  //     context: context,
  //     fieldLabelText: "hello",
  //     firstDate: DateTime(1900),
  //     initialDate: selectedDate,
  //     lastDate: DateTime(2100),
  //   );
  //   if (date != null) {
  //     final time = await timePicker(date);
  //     if (time != null) {
  //       setState(() {
  //         DateTimeField(onDateSelected: (DateTime value) {
  //           selectedDate = value;
  //         }, selectedDate: selectedDate);
  //       });
  //       await _notificationService.scheduleNotifications(
  //           id: widget.id,
  //           title: widget.title,
  //           body: widget.content,
  //           time: fullDate);
  //     }
  //     return selectedDate;
  //   } else {
  //     return selectedDate;
  //   }
  // }

  Future<DateTime> _selectDate(BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: selectedDate,
        lastDate: DateTime(2100));
    if (date != null) {
      final time = await timePicker(date);
      if (time != null) {
        setState(() {
          fullDate = DateTime(selectedDate.year, selectedDate.month, selectedDate.day, time.hour, time.minute);
        });
        await _notificationService.scheduleNotifications(
                    id: widget.id,
                    title: widget.title,
                    body: widget.content,
                    time: fullDate);
      }
      return DateTime(selectedDate.year, selectedDate.month, selectedDate.day, time!.hour, time.minute);
    } else {
      return selectedDate;
    }
  }

  Future<TimeOfDay?> timePicker(DateTime date) async {
    TimeOfDay? dateTime = await showTimePicker(
      initialTime: TimeOfDay.fromDateTime(selectedDate),
      context: context,
    );
    return dateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(widget.content),
          const SizedBox(
            height: 80,
          ),
          Text(fullDate.toString()),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text("افزودن یادآور"))
        ],
      ),
    );
  }
}
