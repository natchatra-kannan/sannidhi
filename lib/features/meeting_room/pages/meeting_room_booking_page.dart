import 'package:flutter/material.dart';

class MeetingRoomBookingPage extends StatefulWidget {
  const MeetingRoomBookingPage({super.key});

  @override
  State<MeetingRoomBookingPage> createState() => _MeetingRoomBookingPageState();
}

class _MeetingRoomBookingPageState extends State<MeetingRoomBookingPage> {
  final List<String> bookedSlots = [];
  DateTime? fromDateTime;
  DateTime? toDateTime;

  void _showBookingDialog() {
    fromDateTime = null;
    toDateTime = null;

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogContext, setDialogState) => AlertDialog(
          title: const Text('Book a Slot'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('From'),
                subtitle: Text(
                  fromDateTime != null ? fromDateTime.toString() : 'Select date and time',
                ),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: dialogContext,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (picked != null) {
                    final time = await showTimePicker(
                      context: dialogContext,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      setDialogState(() {
                        fromDateTime = DateTime(
                          picked.year,
                          picked.month,
                          picked.day,
                          time.hour,
                          time.minute,
                        );
                      });
                    }
                  }
                },
              ),
              ListTile(
                title: const Text('To'),
                subtitle: Text(
                  toDateTime != null ? toDateTime.toString() : 'Select date and time',
                ),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: dialogContext,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (picked != null) {
                    final time = await showTimePicker(
                      context: dialogContext,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      setDialogState(() {
                        toDateTime = DateTime(
                          picked.year,
                          picked.month,
                          picked.day,
                          time.hour,
                          time.minute,
                        );
                      });
                    }
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: fromDateTime != null && toDateTime != null
                  ? () {
                      setState(() {
                        bookedSlots.add('$fromDateTime to $toDateTime');
                      });
                      Navigator.pop(dialogContext);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Slot booked successfully!')),
                      );
                    }
                  : null,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: ListView(
        children: [
          Text(
            'Meeting Room Booking',
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _showBookingDialog,
              icon: const Icon(Icons.add),
              label: const Text('Book a Slot +'),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Booked Slots',
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          if (bookedSlots.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  'No slots booked yet.',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: bookedSlots.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text(bookedSlots[index]),
                  leading: const Icon(Icons.event),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
