import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(const GoldenOpportunityApp());

class GoldenOpportunityApp extends StatelessWidget {
  const GoldenOpportunityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golden Opportunity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAFAF9),
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF9C33B),
          primary: const Color(0xFFF4B400),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Color(0xFF111827),
            letterSpacing: .2,
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            color: Color(0xFF6B7280),
            height: 1.35,
            letterSpacing: .2,
          ),
        ),
      ),
      home: const GoldenOpportunityPage(),
    );
  }
}

class Slot {
  final String title;
  final String time;
  final String priceLabel;
  final bool highlighted;
  const Slot({
    required this.title,
    required this.time,
    required this.priceLabel,
    this.highlighted = false,
  });
}

class GoldenOpportunityPage extends StatelessWidget {
  const GoldenOpportunityPage({super.key});

  List<Slot> get slots => const [
    Slot(
      title: 'Laser Hair Removal',
      time: '10:00 AM - 11:00 AM',
      priceLabel: '20 JOD',
      highlighted: true,
    ),
    Slot(
      title: 'Laser Hair Removal',
      time: '11:00 AM - 12:00 PM',
      priceLabel: '40 JOD',
    ),
    Slot(
      title: 'Laser Hair Removal',
      time: '12:00 PM - 1:00 PM',
      priceLabel: '40 JOD',
    ),
    Slot(
      title: 'Laser Hair Removal',
      time: '1:00 PM - 2:00 PM',
      priceLabel: '20 JOD',
      highlighted: true,
    ),
    Slot(
      title: 'Laser Hair Removal',
      time: '2:00 PM - 3:00 PM',
      priceLabel: '40 JOD',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: const _KodaBottomNav(currentIndex: 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(
                        CupertinoIcons.arrow_left,
                        size: 22,
                        color: Color(0xFF374151),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Golden Opportunity',
                    style: theme.textTheme.headlineMedium,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 2, 16, 14),
              child: Text(
                'Unlock exclusive discounts. Find the golden slots and book now!',
                style: theme.textTheme.bodyMedium,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 12),
              child: Text(
                'Available Slots',
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 24,
                  letterSpacing: .2,
                ),
              ),
            ),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                itemCount: slots.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) => _SlotCard(slot: slots[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SlotCard extends StatelessWidget {
  final Slot slot;
  const _SlotCard({required this.slot});

  @override
  Widget build(BuildContext context) {
    final bool hi = slot.highlighted;
    final radius = BorderRadius.circular(16.0);

    const lightEdge = Color(0xFFFFFAF1);
    const gradStart = Color(0xFFFFF3DB);
    const gradMid = Color(0xFFF6D788);
    const gradEnd = Color(0xFFEFC257);
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(
          color: hi ? const Color(0xFFFFE4A6) : const Color(0xFFE5E7EB),
          width: 1,
        ),
        boxShadow: [
          if (hi)
            BoxShadow(
              color: const Color(0xFFB88A14).withOpacity(.18),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
        ],
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: Stack(
          children: [
            if (hi)
              Positioned.fill(
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Color(0xFFFFF3DB),
                        Color(0xFFF6D788),
                        Color.fromARGB(255, 232, 210, 158),
                        Color.fromARGB(255, 232, 210, 158),
                        Color(0xFFFFF6E6),
                      ],

                      stops: <double>[0.16, 0.55, 0.82, 0.90, 1.00],
                    ),
                  ),
                ),
              ),

            if (hi)
              const Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                width: 56,
                child: ColoredBox(color: Color(0xFFFFFAF1)),
              ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Row(
                children: [
                  // النصوص
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          slot.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF111827),
                            letterSpacing: .2,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          slot.time,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .2,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ),

                  _PricePill(text: slot.priceLabel, highlighted: hi),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PricePill extends StatelessWidget {
  final String text;
  final bool highlighted;
  const _PricePill({required this.text, this.highlighted = false});

  @override
  Widget build(BuildContext context) {
    if (highlighted) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFECAA0F), Color(0xFFD89408)],
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFAF7D0F).withOpacity(.3),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 16,
            letterSpacing: .2,
            color: Color(0xFF111827),
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF0F2F7), Color(0xFFE3E7EE)],
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 16,
            letterSpacing: .2,
            color: Color(0xFF2D2F33),
          ),
        ),
      );
    }
  }
}

class _KodaBottomNav extends StatelessWidget {
  final int currentIndex;
  const _KodaBottomNav({required this.currentIndex});

  BottomNavigationBarItem _item(IconData icon, String label) =>
      BottomNavigationBarItem(icon: Icon(icon), label: label);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFFF4B400),
      unselectedItemColor: const Color(0xFF9CA3AF),
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: .2,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        letterSpacing: .2,
      ),
      items: [
        _item(Icons.home_rounded, 'Home'),
        _item(Icons.calendar_month_rounded, 'Book'),
        _item(Icons.bookmark_border_rounded, 'My KODA'),
        _item(Icons.confirmation_number_outlined, 'Passport'),
        _item(Icons.person_outline_rounded, 'Profile'),
      ],
      onTap: (_) {},
    );
  }
}
