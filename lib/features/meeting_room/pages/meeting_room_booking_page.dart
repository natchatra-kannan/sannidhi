import 'package:flutter/material.dart';

class _Booking {
  _Booking({
    required this.start,
    required this.end,
    required this.bookedBy,
  });

  final DateTime start;
  final DateTime end;
  final String bookedBy;

  String get rangeString => '${start.toString()} to ${end.toString()}';

  bool overlaps(DateTime otherStart, DateTime otherEnd) {
    return start.isBefore(otherEnd) && otherStart.isBefore(end);
  }
}

class MeetingRoomBookingPage extends StatefulWidget {
  const MeetingRoomBookingPage({super.key});

  @override
  State<MeetingRoomBookingPage> createState() => _MeetingRoomBookingPageState();
}

class _MeetingRoomBookingPageState extends State<MeetingRoomBookingPage> {
  final List<_Booking> bookedSlots = [];
  DateTime? fromDateTime;
  DateTime? toDateTime;

  void _showBookingDialog() {
    fromDateTime = null;
    toDateTime = null;
    String bookedBy = '';

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogContext, setDialogState) => AlertDialog(
          title: const Text('Book a Slot'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Booked by'),
                onChanged: (value) => setDialogState(() => bookedBy = value.trim()),
              ),
              const SizedBox(height: 12),
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
              onPressed: fromDateTime != null && toDateTime != null && bookedBy.isNotEmpty
                  ? () {
                      final newBooking = _Booking(
                        start: fromDateTime!,
                        end: toDateTime!,
                        bookedBy: bookedBy,
                      );
                      if (bookedSlots.any((booking) => booking.overlaps(newBooking.start, newBooking.end))) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('This slot is already occupied.')),
                        );
                        return;
                      }
                      setState(() {
                        bookedSlots.add(newBooking);
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
    final today = DateTime.now();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Meeting Room Booking',
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              FilledButton.icon(
                onPressed: _showBookingDialog,
                icon: const Icon(Icons.add),
                label: const Text('Book a Slot'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Today • ${today.day}/${today.month}/${today.year}',
                          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '${bookedSlots.length} bookings',
                        style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: theme.colorScheme.outline),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildTimeSlotRow(theme, '08:00', bookedSlots),
                        _buildTimeSlotRow(theme, '10:00', bookedSlots),
                        _buildTimeSlotRow(theme, '12:00', bookedSlots),
                        _buildTimeSlotRow(theme, '14:00', bookedSlots),
                        _buildTimeSlotRow(theme, '16:00', bookedSlots),
                        _buildTimeSlotRow(theme, '18:00', bookedSlots),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          if (bookedSlots.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Slot details',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: bookedSlots.length,
                  itemBuilder: (context, index) {
                    final booking = bookedSlots[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: const Icon(Icons.event_available),
                        title: Text('${booking.bookedBy}'),
                        subtitle: Text(booking.rangeString),
                      ),
                    );
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildTimeSlotRow(ThemeData theme, String time, List<_Booking> bookings) {
    final booking = _bookingForTime(time, bookings);
    final isBooked = booking != null;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.outline.withOpacity(0.7)),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Text(
              time,
              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              isBooked ? 'Booked by ${booking!.bookedBy}' : 'Available',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isBooked ? theme.colorScheme.error : theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _Booking? _bookingForTime(String time, List<_Booking> bookings) {
    final now = DateTime.now();
    final parts = time.split(':');
    if (parts.length != 2) {
      return null;
    }

    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);
    if (hour == null || minute == null) {
      return null;
    }

    final slotTime = DateTime(now.year, now.month, now.day, hour, minute);
    for (final booking in bookings) {
      if (!slotTime.isBefore(booking.start) && slotTime.isBefore(booking.end)) {
        return booking;
      }
      if (slotTime.isAtSameMomentAs(booking.start)) {
        return booking;
      }
    }
    return null;
  }
}
