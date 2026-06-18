import 'package:flutter/material.dart';

import 'community_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const values = [
    _SannidhiValue(
      title: 'Gratitude',
      subtitle: 'நன்றியுணர்வு',
      icon: Icons.favorite,
      description: 'Share moments of gratitude and appreciation.',
    ),
    _SannidhiValue(
      title: 'Pioneering',
      subtitle: 'முன்னோடி',
      icon: Icons.auto_graph,
      description: 'Innovate and lead with bold thinking.',
    ),
    _SannidhiValue(
      title: 'Entrepreneurial',
      subtitle: 'தொழில்முனைவு',
      icon: Icons.lightbulb,
      description: 'Build with ownership and creative drive.',
    ),
    _SannidhiValue(
      title: 'Holistic Growth',
      subtitle: 'ஒட்டுமொத்த வளர்ச்சி',
      icon: Icons.spa,
      description: 'Grow personally, professionally and together.',
    ),
    _SannidhiValue(
      title: 'Inclusive',
      subtitle: 'உள்ளடக்கிய தன்மை',
      icon: Icons.people,
      description: 'Create a space where everyone belongs.',
    ),
    _SannidhiValue(
      title: 'Excellence',
      subtitle: 'சிறப்பு',
      icon: Icons.star,
      description: 'Deliver quality with pride and care.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'S.NIDHI Objectives',
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Explore each community and share your moments for the value that matters to you.',
            style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.builder(
              itemCount: values.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                final value = values[index];
                return _ValueCard(
                  value: value,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommunityPage(
                          title: value.title,
                          subtitle: value.subtitle,
                          icon: value.icon,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  const _ValueCard({required this.value, required this.onTap});

  final _SannidhiValue value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Icon(value.icon, size: 28, color: theme.colorScheme.onPrimaryContainer),
            ),
            const SizedBox(height: 18),
            Text(
              value.title,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              value.subtitle,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const Spacer(),
            Text(
              value.description,
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}

class _SannidhiValue {
  const _SannidhiValue({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.description,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String description;
}
