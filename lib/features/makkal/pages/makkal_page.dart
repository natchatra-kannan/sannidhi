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
            'Teams',
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildTeamCard(context, 'Aspire', Icons.rocket_launch),
                _buildTeamCard(context, 'Dolabs', Icons.design_services),
                _buildTeamCard(context, 'Externship', Icons.handshake),
                _buildTeamCard(context, 'SISU', Icons.settings),
                _buildTeamCard(context, 'EdgeOps', Icons.speed),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamCard(BuildContext context, String teamName, IconData icon) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        width: 260,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Icon(icon, color: theme.colorScheme.onPrimaryContainer, size: 28),
                ),
                const SizedBox(height: 16),
                Text(
                  teamName,
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'View team details, active members and alumni.',
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 18),
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
      ),
    );
  }
}
