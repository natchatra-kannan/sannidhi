import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key, required this.title, required this.subtitle, required this.icon});

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  static final Map<String, List<_CommunityPost>> _communityCache = {};

  late final List<_CommunityPost> _posts;

  @override
  void initState() {
    super.initState();
    _posts = _communityCache[widget.title] ?? [
      _CommunityPost(
        author: 'system',
        content: 'Welcome to the ${widget.title} community. Share your gratitude and moments here!',
        imageUrl: null,
      ),
    ];
    _communityCache[widget.title] = _posts;
  }

  void _addPost() {
    final contentController = TextEditingController();
    final imageController = TextEditingController();
    final authorController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('New ${widget.title} post'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: authorController,
              decoration: const InputDecoration(
                labelText: 'Your name / ID',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                labelText: 'Share your thought or moment',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(
                labelText: 'Image URL (optional)',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final author = authorController.text.trim();
              final content = contentController.text.trim();
              if (content.isEmpty) return;
              setState(() {
                _posts.insert(
                  0,
                  _CommunityPost(
                    author: author.isEmpty ? 'Anonymous' : author,
                    content: content,
                    imageUrl: imageController.text.trim().isEmpty ? null : imageController.text.trim(),
                  ),
                );
              });
              Navigator.pop(context);
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: theme.colorScheme.primaryContainer,
                      child: Icon(widget.icon, size: 30, color: theme.colorScheme.onPrimaryContainer),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.subtitle,
                            style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Community posts',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: _posts.isEmpty
                  ? Center(
                      child: Text(
                        'No posts yet. Add the first moment for ${widget.title}.',
                        style: theme.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      itemCount: _posts.length,
                      itemBuilder: (context, index) {
                        final post = _posts[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      post.author,
                                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '1m ago',
                                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  post.content,
                                  style: theme.textTheme.bodyLarge,
                                ),
                                if (post.imageUrl != null && post.imageUrl!.isNotEmpty) ...[
                                  const SizedBox(height: 12),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      post.imageUrl!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stack) => Container(
                                        height: 180,
                                        color: theme.colorScheme.onSurface.withOpacity(0.05),
                                        alignment: Alignment.center,
                                        child: const Icon(Icons.broken_image, size: 48),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addPost,
        icon: const Icon(Icons.add_comment),
        label: const Text('New post'),
      ),
    );
  }
}

class _CommunityPost {
  _CommunityPost({required this.author, required this.content, this.imageUrl});

  final String author;
  final String content;
  final String? imageUrl;
}
