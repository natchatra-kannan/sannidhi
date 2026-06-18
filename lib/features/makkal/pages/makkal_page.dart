import 'package:flutter/material.dart';

class MakkalPage extends StatelessWidget {
  const MakkalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: ListView(
        children: [
          Text(
            'Makkal',
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
            'Teams',
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildTeamCard(context, 'Aspire'),
              _buildTeamCard(context, 'Dolabs'),
              _buildTeamCard(context, 'Externship'),
              _buildTeamCard(context, 'SISU'),
              _buildTeamCard(context, 'EdgeOps'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamCard(BuildContext context, String teamName) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 200,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                teamName,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('Check out the team'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
