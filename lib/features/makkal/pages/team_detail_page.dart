import 'package:flutter/material.dart';

import '../models/team_member.dart';
import 'profile_detail_page.dart';

class TeamDetailPage extends StatelessWidget {
  const TeamDetailPage({
    super.key,
    required this.teamName,
    required this.teamDescription,
    required this.activeMembers,
    required this.alumniMembers,
  });

  final String teamName;
  final String teamDescription;
  final List<TeamMember> activeMembers;
  final List<TeamMember> alumniMembers;

  static TeamDetailPage forTeam(String teamName) {
    final lowerName = teamName.toLowerCase();
    switch (lowerName) {
      case 'aspire':
        return TeamDetailPage(
          teamName: 'Aspire',
          teamDescription:
              'Aspire is the growth engine of our community. The team focuses on building scalable impact with empathy and energy.',
          activeMembers: _aspireActive,
          alumniMembers: _aspireAlumni,
        );
      case 'dolabs':
        return TeamDetailPage(
          teamName: 'Dolabs',
          teamDescription:
              'Dolabs is where design and development meet for thoughtful product experiences. They drive user-first, polished outcomes.',
          activeMembers: _dolabsActive,
          alumniMembers: _dolabsAlumni,
        );
      case 'externship':
        return TeamDetailPage(
          teamName: 'Externship',
          teamDescription:
              'Externship is the bridge between emerging talent and real-world business challenges. They mentor, upskill and onboard new energy.',
          activeMembers: _externshipActive,
          alumniMembers: _externshipAlumni,
        );
      case 'sisu':
        return TeamDetailPage(
          teamName: 'SISU',
          teamDescription:
              'SISU is the operational backbone that keeps collaboration sharp, systems efficient, and people aligned for impact.',
          activeMembers: _sisuActive,
          alumniMembers: _sisuAlumni,
        );
      case 'edgeops':
        return TeamDetailPage(
          teamName: 'EdgeOps',
          teamDescription:
              'EdgeOps is the execution squad that makes every event, launch and program run smoothly with precision and care.',
          activeMembers: _edgeopsActive,
          alumniMembers: _edgeopsAlumni,
        );
      default:
        return TeamDetailPage(
          teamName: teamName,
          teamDescription: 'This team page is under construction.',
          activeMembers: const [],
          alumniMembers: const [],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(teamName)),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        children: [
          _buildGroupImage(context),
          const SizedBox(height: 20),
          Text(teamDescription, style: theme.textTheme.bodyLarge?.copyWith(height: 1.7)),
          const SizedBox(height: 28),
          Text('Active', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ...activeMembers.map((member) => _buildMemberCard(context, member)).toList(),
          const SizedBox(height: 28),
          Text('Alumini', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ...alumniMembers.map((member) => _buildMemberCard(context, member)).toList(),
        ],
      ),
    );
  }

  Widget _buildGroupImage(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.group, size: 52, color: theme.colorScheme.onPrimaryContainer),
          const SizedBox(height: 16),
          Text(
            '$teamName Team',
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Team group picture placeholder',
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMemberCard(BuildContext context, TeamMember member) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileDetailPage(member: member)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: theme.colorScheme.primary,
                child: Text(
                  member.initials,
                  style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(member.name, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(member.role, style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 6),
                    Text(member.email, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: theme.colorScheme.primary),
            ],
          ),
        ),
      ),
    );
  }
}

const _aspireActive = <TeamMember>[
  TeamMember(
    name: 'Aarav N.',
    role: 'Growth Lead',
    email: 'aarav.n@sannidhi.com',
    bio: 'Leads client growth programs and partnership initiatives.',
  ),
  TeamMember(
    name: 'Meera S.',
    role: 'Community Manager',
    email: 'meera.s@sannidhi.com',
    bio: 'Builds team wellbeing rituals and community engagement.',
  ),
  TeamMember(
    name: 'Karthik R.',
    role: 'Operations Analyst',
    email: 'karthik.r@sannidhi.com',
    bio: 'Optimizes internal workflows and operational execution.',
  ),
];

const _aspireAlumni = <TeamMember>[
  TeamMember(
    name: 'Divya P.',
    role: 'Alumini',
    email: 'divya.p@alumni.sannidhi.com',
    bio: 'Former Aspire lead focused on growth engineering.',
  ),
];

const _dolabsActive = <TeamMember>[
  TeamMember(
    name: 'Nisha K.',
    role: 'Design Lead',
    email: 'nisha.k@sannidhi.com',
    bio: 'Shapes visual direction and experience design across teams.',
  ),
  TeamMember(
    name: 'Rohan M.',
    role: 'Product Designer',
    email: 'rohan.m@sannidhi.com',
    bio: 'Designs product interactions and visual workflows.',
  ),
];

const _dolabsAlumni = <TeamMember>[
  TeamMember(
    name: 'Sana J.',
    role: 'Alumini',
    email: 'sana.j@alumni.sannidhi.com',
    bio: 'Previously led Dolabs design experiments.',
  ),
];

const _externshipActive = <TeamMember>[
  TeamMember(
    name: 'Anand V.',
    role: 'Intern Mentor',
    email: 'anand.v@sannidhi.com',
    bio: 'Guides externs through work and experience delivery.',
  ),
  TeamMember(
    name: 'Priya T.',
    role: 'Learning Coordinator',
    email: 'priya.t@sannidhi.com',
    bio: 'Coordinates externship projects and feedback loops.',
  ),
];

const _externshipAlumni = <TeamMember>[
  TeamMember(
    name: 'Vivek R.',
    role: 'Alumini',
    email: 'vivek.r@alumni.sannidhi.com',
    bio: 'Former externship communications lead.',
  ),
];

const _sisuActive = <TeamMember>[
  TeamMember(
    name: 'Riya S.',
    role: 'Systems Lead',
    email: 'riya.s@sannidhi.com',
    bio: 'Maintains operational systems and team coordination.',
  ),
  TeamMember(
    name: 'Arun K.',
    role: 'Logistics Specialist',
    email: 'arun.k@sannidhi.com',
    bio: 'Supports event logistics and facility management.',
  ),
];

const _sisuAlumni = <TeamMember>[
  TeamMember(
    name: 'Mala P.',
    role: 'Alumini',
    email: 'mala.p@alumni.sannidhi.com',
    bio: 'Previously managed SISU operational programs.',
  ),
];

const _edgeopsActive = <TeamMember>[
  TeamMember(
    name: 'Jai S.',
    role: 'Program Lead',
    email: 'jai.s@sannidhi.com',
    bio: 'Leads execution for EdgeOps events and launches.',
  ),
  TeamMember(
    name: 'Shreya M.',
    role: 'Execution Specialist',
    email: 'shreya.m@sannidhi.com',
    bio: 'Keeps timelines aligned and delivery on track.',
  ),
];

const _edgeopsAlumni = <TeamMember>[
  TeamMember(
    name: 'Ramesh T.',
    role: 'Alumini',
    email: 'ramesh.t@alumni.sannidhi.com',
    bio: 'Former EdgeOps launch coordinator.',
  ),
];
