import 'package:flutter/material.dart';

import '../models/team_member.dart';

class ProfileDetailPage extends StatelessWidget {
  const ProfileDetailPage({
    super.key,
    required this.member,
  });

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(member.name)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: theme.colorScheme.primary,
                  child: Text(
                    member.initials,
                    style: theme.textTheme.headlineSmall?.copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(member.name, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(member.role, style: theme.textTheme.titleMedium),
                      const SizedBox(height: 6),
                      Text(member.email, style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Text('Bio', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text(member.bio, style: theme.textTheme.bodyLarge?.copyWith(height: 1.7)),
            const Spacer(),
            Center(
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to team'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
