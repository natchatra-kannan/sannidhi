import 'package:flutter/material.dart';

class PrepPage extends StatelessWidget {
  const PrepPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Prep - Books + Movies + Standees')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: ListView(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reading & Viewing Guide',
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '→ Reading is not mandatory\n→ Movies is mandatory',
                      style: theme.textTheme.bodyLarge?.copyWith(height: 1.8),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Recommended Books',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildResourceCard(
              context,
              'The Lean Startup',
              'Eric Ries',
              'Building products efficiently and learning fast',
            ),
            _buildResourceCard(
              context,
              'Zero to One',
              'Peter Thiel',
              'Creating value and thinking differently',
            ),
            _buildResourceCard(
              context,
              'Good to Great',
              'Jim Collins',
              'Building sustained organizational success',
            ),
            const SizedBox(height: 24),
            Text(
              'Recommended Movies',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildResourceCard(
              context,
              'The Social Network',
              'Drama / Tech',
              'Ambition and innovation in the digital age',
            ),
            _buildResourceCard(
              context,
              'Steve Jobs',
              'Biography / Drama',
              'Vision, perfectionism, and leadership',
            ),
            _buildResourceCard(
              context,
              'Moneyball',
              'Sports / Drama',
              'Unconventional thinking and transformation',
            ),
            const SizedBox(height: 24),
            Text(
              'Standees',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Resource links will be added soon. Check back for downloadable standees and additional materials.',
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceCard(BuildContext context, String title, String subtitle, String description) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
            const SizedBox(height: 6),
            Text(description, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
