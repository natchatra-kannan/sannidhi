import 'package:flutter/material.dart';

class Awards25Page extends StatelessWidget {
  const Awards25Page({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: ListView(
        children: [
          Text(
            'Awards 25\'',
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Instructions',
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '• Nominate at least one person, pursuit, or project for each award.\n'
                    '• Review each award description before submitting.\n'
                    '• Support every nomination with data, social proof, or a story.\n'
                    '• Nominations auto-save — you can return anytime to complete.',
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.8),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Award Categories',
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildAwardCard(context, 'Sei - செய்', 'A bias for action to try and implement innovative and thoughtful ideas.'),
          _buildAwardCard(context, 'Yayum - யாயும்', 'An outgoing employee or an alumnus who helped others shine.'),
          _buildAwardCard(context, 'Ulavu - உழவு', 'A risk-driven experiment that failed well and its lessons took us forward.'),
          _buildAwardCard(context, 'Uppu - உப்பு', 'You are the salt of the earth - deeply virtuous, worthy and valuable.'),
          _buildAwardCard(context, 'Yaal - யாழ்', 'An intern who became a key ingredient or an instrument of significance.'),
          _buildAwardCard(context, 'Savaal - சவால்', 'An intentional action that challenges status quo through intelligent effort.'),
          _buildAwardCard(context, 'Sol - சொல்', 'A thoroughly executed activity that met standards and metrics of success.'),
          _buildAwardCard(context, 'Samam - சமம்', 'A person who increased capacity and improved capability for the company.'),
          _buildAwardCard(context, 'Uyir - உயிர்', 'An employee whose assiduity, fidelity and loyalty in the profession stands out.'),
          _buildAwardCard(context, 'Saram - சரம்', 'A series of efforts in the direction of future and consistent advancement.'),
          _buildAwardCard(context, 'Uru - உரு', 'A well built idea that helps fulfill our existential mission.'),
        ],
      ),
    );
  }

  Widget _buildAwardCard(BuildContext context, String title, String description) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
