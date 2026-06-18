import 'package:flutter/material.dart';

class BusinessClassPage extends StatelessWidget {
  const BusinessClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Business Class')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: ListView(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  'Dear Edgians,\n\n'
                  'This year we have put you on the spot twice to face uncomfortable questions. '
                  'This makes it a third 👍🏼\n\n'
                  'Questions are portals of discovery. When the question is directed towards the self, '
                  'it answers in reflection. When it is directed towards the effort, it answers as change. '
                  'When it is directed towards the collective, it answers in feedback.\n\n'
                  'Any reflection, change and feedback is as essential as oxygen.\n'
                  'All the best in its supply 👍🏼',
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.8),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionCard(context, "What's the same?", [
              'All questions are mandatory.',
              'If doubts, then clarify over dm or f2f.',
              'Self expression is key',
              'Writing is a muscle. Practice enables it\'s growth.',
            ]),
            const SizedBox(height: 16),
            _buildSectionCard(context, "What's new?", [
              'Organize yourselves into groups of three (from within the BU).',
              'All answers in a ppt. One slide for one question.',
              'You may get creative in the way you express as a group.',
              'Everyone will have access to your answers.',
            ]),
            const SizedBox(height: 24),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Instructions', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Text(
                      'i) There are 9 questions split across 3 sections\n'
                      'ii) The 1st question in every section involves you to give your individual voice\n'
                      'iii) The 2nd question in every section involves you to listen to someone and write on their behalf\n'
                      'iv) The 3rd question in every section involves you to come up with an answer as a group\n\n'
                      'Presentations (ppt) to be sent only to ratheesh.nd@spigroup.in by 23rd midnight',
                      style: theme.textTheme.bodyLarge?.copyWith(height: 1.8),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildQuestionSection(context, 'Section 1: BLITZSCALING INTUITION', [
              '"I don\'t do drugs. I am drugs" — Salvador Dali',
              '1. What is your focus for the next three months?\n   • Meeting expectations\n   • Optimising contribution\n   • Maximizing contribution\n   • Expand responsibility\n   Each one chooses and explains clearly why and how.\n   Tone: Your individual voice.',
              '2. What is my process for giving, receiving and acting on feedback?\n   Is it helping me?\n   Each one answers for the other understanding the pattern.\n   Tone: The other lends their voice for you.',
              '3. What are the three or four characteristics of our highest performing and highly successful employees?\n   You answer as a group.\n   Tone: The group comes up with one singular voice.',
            ]),
            const SizedBox(height: 16),
            _buildQuestionSection(context, 'Section 2: BLITZSCALING INCOME', [
              '"You don\'t rise to the level of your goals. You fall to the level of your systems." — James Clear',
              '4. What critical capabilities do you, your team, your vertical need to be successful?\n   • For Self\n   • For Team\n   • For Biz Unit\n   Each one responds to all three with social proofs.\n   Tone: Your individual intel.',
              '5. What part of the job most excites you? What aspect would you like to change?\n   What habits do you want to keep/drop/introduce?\n   Each one answers for the other understanding their perspectives.\n   Tone: The other lends their intel for you.',
              '6. What do you propose as new OKRs? What is stopping us from attaining our Biz goals?\n   What is helping us attain our Biz goals?\n   You answer as a group.\n   Tone: The group comes up with one singular intel.',
            ]),
            const SizedBox(height: 16),
            _buildQuestionSection(context, 'Section 3: BLITZSCALING IMPACT', [
              '"Any mission worth giving a damn must take responsibility to advance a cause, protect its people and places and generate profit as a resource for longevity. Period." — Indra Nooyi',
              '7. What is the relationship of my individual purpose to my BU\'s purpose?\n   What parts connect/align? What parts disconnect/misalign?\n   What parts are growing/decaying within my thinking?\n   Tone: Your individual emotions.',
              '8. What are key elements of our company culture?\n   Make a quadrant with X axis as Frequency (more vs less) and Y axis as Impact (positive vs negative).\n   Fill all four quadrants.\n   Tone: The other lends their inner ear to you.',
              '9. Describe our prototypical, good customer.\n   Explain their three to four traits. Obsess over their life.\n   You answer as a group.\n   Tone: The group comes up with a compelling list.',
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, String title, List<String> items) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text('• $item', style: theme.textTheme.bodySmall),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionSection(BuildContext context, String title, List<String> content) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.primary)),
            const SizedBox(height: 10),
            ...content.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(item, style: theme.textTheme.bodySmall?.copyWith(height: 1.6)),
            )),
          ],
        ),
      ),
    );
  }
}
