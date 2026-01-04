import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import 'package:confetti/confetti.dart';

class DedicationPage extends StatefulWidget {
  const DedicationPage({super.key});

  @override
  State<DedicationPage> createState() => _DedicationPageState();
}

class _DedicationPageState extends State<DedicationPage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play(); // Automatically start confetti on page load
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const AppHeader(), 
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Confetti Layer
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                maxBlastForce: 20,
                minBlastForce: 5,
                emissionFrequency: 0.05,
                numberOfParticles: 150,
                gravity: 0.1,
                shouldLoop: false,
                colors: [
                  Colors.pink.shade300,
                  Colors.yellow.shade300,
                  Colors.orange.shade300,
                  Colors.blue.shade300,
                  Colors.green.shade300,
                ],
              ),
            ),
        
            // Main content
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          'For You',
                          style: textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 16),
        
                        // Divider
                        Container(
                          width: 40,
                          height: 2,
                          color: colors.onSurface.withAlpha(40),
                        ),
        
                        const SizedBox(height: 40),
        
                        // Dedication text
                        Text(
                          'This space was built for your words.\n\n'
                          'For the thoughts you carry quietly, '
                          'the ideas you shape carefully, '
                          'and the voice you continue to refine with intention.\n\n'
                          'May this always be a place where your writing feels at home.\n\n'
                          'Happy Birthday.',
                          style: textTheme.bodyLarge?.copyWith(
                            height: 1.8,
                            color: colors.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
