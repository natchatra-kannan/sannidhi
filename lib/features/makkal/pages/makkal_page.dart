import 'package:flutter/material.dart';

import 'team_detail_page.dart';

class MakkalPage extends StatelessWidget {
  const MakkalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: ListView(
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.primaryContainer,
                    ),
                    child: Icon(
                      Icons.verified_user,
                      size: 36,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Makkal',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Lifeline of edge, SANNIDHI',
                          style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Explore the five teams that power our community.',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'Team Links',
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildTeamTab(context, 'Aspire'),
                _buildTeamTab(context, 'Dolabs'),
                _buildTeamTab(context, 'Externship'),
                _buildTeamTab(context, 'SISU'),
                _buildTeamTab(context, 'EdgeOps'),
              ],
            ),
          ),
          const SizedBox(height: 32),
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

  Widget _buildTeamTab(BuildContext context, String teamName) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: FilledButton.tonal(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TeamDetailPage.forTeam(teamName),
            ),
          );
        },
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          backgroundColor: theme.colorScheme.secondaryContainer,
          foregroundColor: theme.colorScheme.onSecondaryContainer,
        ),
        child: Text(teamName),
      ),
    );
  }

  Widget _buildTeamCard(BuildContext context, String teamName) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 220,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeamDetailPage.forTeam(teamName),
                      ),
                    );
                  },
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
