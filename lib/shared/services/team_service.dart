import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/teams/models/team.dart';

class TeamService {
  final SupabaseClient _supabase =
      Supabase.instance.client;

  Future<List<Team>> getTeams() async {
    final response = await _supabase
        .from('teams')
        .select();

    return response
        .map<Team>((team) => Team.fromMap(team))
        .toList();
  }
}