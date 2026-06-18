import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  static const navItems = [
    'S.NIDHI',
    '△வீ',
    'Makkal',
    'Meeting Room Booking',
    'Awards 25\'',
  ];

  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final VoidCallback onViewProfile;
  final VoidCallback onSignOut;

  const AppTopBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.onViewProfile,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onPrimary;
    final activeColor = theme.colorScheme.secondary;

    return Material(
      color: theme.colorScheme.primary,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: kToolbarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                'S.NIDHI',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: navItems.asMap().entries.map((entry) {
                      final index = entry.key;
                      final label = entry.value;
                      final isSelected = index == selectedIndex;

                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: TextButton(
                          onPressed: () => onItemSelected(index),
                          style: TextButton.styleFrom(
                            foregroundColor: isSelected ? textColor : textColor.withOpacity(0.75),
                            backgroundColor: isSelected ? activeColor.withOpacity(0.18) : Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            label,
                            style: TextStyle(
                              color: isSelected ? textColor : textColor.withOpacity(0.85),
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              PopupMenuButton<String>(
                tooltip: 'Account menu',
                icon: CircleAvatar(
                  backgroundColor: theme.colorScheme.onPrimary,
                  foregroundColor: theme.colorScheme.primary,
                  child: const Icon(Icons.person),
                ),
                onSelected: (value) {
                  if (value == 'profile') {
                    onViewProfile();
                  } else if (value == 'sign_out') {
                    onSignOut();
                  }
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(value: 'profile', child: Text('View Profile')),
                  PopupMenuItem(value: 'sign_out', child: Text('Sign Out')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
