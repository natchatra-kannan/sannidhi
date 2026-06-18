import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SooraraiPottruVideosPage extends StatelessWidget {
  const SooraraiPottruVideosPage({super.key});

  static const videos = [
    _VideoItem(
      title: '2024 Soorarai Pottru - SPI EDGE Theme',
      description: 'Dear 2024, Fact is everybody\'s truth. Fiction is nobody\'s truth. Myth is... more',
      youtubeUrl: 'https://www.youtube.com/watch?v=example1',
    ),
    _VideoItem(
      title: '2024 is Soorarai Pottru: Hail the LGBTQAI+ {New Lens}',
      description: 'The Navagunjara is your chosen symbol for 2024. Navagunjara is an...more',
      youtubeUrl: 'https://www.youtube.com/watch?v=example2',
    ),
    _VideoItem(
      title: '2024 is Soorarai Pottru: Navagunjara, Economic Engines - Part 1',
      description: 'We all have the currency of a country or two in our wallets; maybe a ...more',
      youtubeUrl: 'https://www.youtube.com/watch?v=example3',
    ),
    _VideoItem(
      title: '2024 is Soorarai Pottru: Navagunjara, Economic Engines - Part 2',
      description: 'We all have the currency of a country or two in our wallets; maybe a passport....more',
      youtubeUrl: 'https://www.youtube.com/watch?v=example4',
    ),
    _VideoItem(
      title: 'Navagunjara Explained',
      description: 'Understanding the symbolism and significance of Navagunjara',
      youtubeUrl: 'https://www.youtube.com/watch?v=example5',
    ),
    _VideoItem(
      title: '2024 is Soorarai Pottru: Thalinomics = Nature + Myth',
      description: 'Dear 2024, Fact is everybody\'s truth. Fiction is nobody\'s truth. Myth is somebody\'s....more',
      youtubeUrl: 'https://www.youtube.com/watch?v=example6',
    ),
  ];

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Soorarai Pottru Videos')),
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
                      'Instructions',
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '→ This is a playlist. Watch the videos in the same order as displayed, first things first.\n'
                      '→ The total run time is about 3 hours.\n'
                      '→ Read the description first and then watch the video.\n'
                      '→ Unless you watch, there are high chances you will be sent back in your own expenses.',
                      style: theme.textTheme.bodyLarge?.copyWith(height: 1.8),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Playlist',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...videos.asMap().entries.map((entry) {
              final index = entry.key;
              final video = entry.value;
              return _buildVideoCard(context, index + 1, video);
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoCard(BuildContext context, int order, _VideoItem video) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Text(
                    '$order',
                    style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video.title,
                        style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        video.description,
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => _launchUrl(video.youtubeUrl),
                icon: const Icon(Icons.play_arrow),
                label: const Text('Watch on YouTube'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VideoItem {
  const _VideoItem({
    required this.title,
    required this.description,
    required this.youtubeUrl,
  });

  final String title;
  final String description;
  final String youtubeUrl;
}
