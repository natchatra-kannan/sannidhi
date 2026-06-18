import 'package:flutter/material.dart';

import '../../../shared/services/team_service.dart';
import '../models/team.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  final TeamService _teamService = TeamService();

  late Future<List<Team>> teamsFuture;

  @override
  void initState() {
    super.initState();
    teamsFuture = _teamService.getTeams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams'),
      ),
      body: FutureBuilder<List<Team>>(
        future: teamsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          }

          final teams = snapshot.data ?? [];

          return ListView.builder(
            itemCount: teams.length,
            itemBuilder: (context, index) {
              final team = teams[index];

              return Card(
                margin: const EdgeInsets.all(12),
                child: ListTile(
                  title: Text(team.name),
                  subtitle: Text(
                    team.description ??
                        'No description',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}