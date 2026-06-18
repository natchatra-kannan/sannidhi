import 'package:flutter/material.dart';

class JeevakaaviPage extends StatelessWidget {
  const JeevakaaviPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: ListView(
        children: [
          Text(
            '△வீ',
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Lifeline of edge, SANNIDHI',
            style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
          ),
          const SizedBox(height: 28),
          Text(
            'Subpages',
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildLinkCard(context, 'Prep', 'Books + Movies + Standees'),
              _buildLinkCard(context, 'Business Class', 'Questions & Reflections'),
              _buildLinkCard(context, 'Soorarai Pottru Videos', 'Video Playlist'),
              _buildLinkCard(context, 'Itinerary', 'Event Schedule'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLinkCard(BuildContext context, String title, String subtitle) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 240,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
