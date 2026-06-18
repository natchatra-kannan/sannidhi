import 'package:flutter/material.dart';

class ItineraryPage extends StatelessWidget {
  const ItineraryPage({super.key});

  static const days = [
    _DayItem(title: 'Vetri Vel Day 1', emoji: '🌅'),
    _DayItem(title: 'Veera Vel Day 2', emoji: '☀️'),
    _DayItem(title: 'Shakthi Vel Day 3', emoji: '🌙'),
  ];

  static const teamAcronyms = [
    'A',
    'D',
    'E',
    'S',
    'O',
    'T',
    'C',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Itinerary')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: ListView(
          children: [
            Text(
              'Event Schedule',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...days.map((day) => _buildDayCard(context, day)).toList(),
            const SizedBox(height: 28),
            Divider(thickness: 1, color: theme.colorScheme.onSurface.withOpacity(0.1)),
            const SizedBox(height: 28),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'House Rules',
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '→ All women stay in "PICO"\n'
                      '→ Men from Odd Number teams (1, 3, 5) should stay in "TANG"\n'
                      '→ Men from Even Number teams (2, 4, 6, 8) should stay in "NEST"\n'
                      '→ Men from team 7 will stay in "COOP"',
                      style: theme.textTheme.bodyLarge?.copyWith(height: 1.8),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Teams',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: teamAcronyms.asMap().entries.map((entry) {
                final teamNum = entry.key + 1;
                return _buildTeamLogo(context, teamAcronyms[entry.key], teamNum);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayCard(BuildContext context, _DayItem day) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    day.emoji,
                    style: const TextStyle(fontSize: 28),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      day.title,
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: theme.colorScheme.primary),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Placeholder for event image',
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamLogo(BuildContext context, String acronym, int teamNum) {
    final theme = Theme.of(context);
    return Column(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: theme.colorScheme.primaryContainer,
          child: Text(
            acronym,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Team $teamNum',
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _DayItem {
  const _DayItem({required this.title, required this.emoji});

  final String title;
  final String emoji;
}
