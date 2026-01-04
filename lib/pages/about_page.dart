import 'package:flutter/material.dart';
import '../widgets/app_header.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const AppHeader(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 820),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: 60,
                    height: 2,
                    color: colors.onSurface.withAlpha(90),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: colors.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: colors.onSurface.withAlpha(1),
                      ),
                    ),
                    child: Column(
                       children: [
                        const Text(
                          "I write powerful content and scripts",
                 
                          style: TextStyle(
                            height: 1.75,
                            fontSize: 16,
                            fontWeight: FontWeight.w300
                          ), 
                        
                        ),
                        const SizedBox(height: 16), 

                        const Text(
                          'Content Writer | Ghostwriter | Healthy Lifestyle Advocate', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                        ),

                         const SizedBox(height: 24),
            const Text(
      
              "Stop waiting for the perfect moment—it doesnt exist. "
              "Stop telling yourself \"I'll start tomorrow\". Tomorrow has its own excuses waiting for you."
              "Every dream, every goal, every life-changing decision begins with one bold step."
             "Not when you have everything figured out. Not when you feel 100% ready. "
              "But NOW—in the messy, scary, uncertain now."
             " Fear will try to chain you. Doubt will whisper “you're not ready.”"
              " Procrastination will dress up in comfort and call it “wisdom.”"
              " But if you keep waiting, youll watch opportunities slip by while others move forward."
              "The truth?\n\n"
              "Youll never know whats on the other side until you step out."
              " So today, silence the excuses. Take the leap. Push through the fear."
              " Stop overthinking. Stop delaying."
              " Close your eyes, take a deep breath… and move."
              " Because courage is not the absence of fear, its moving forward in spite of it."
              " Your breakthrough is waiting for you to take that bold step today!"
            , 
            style: TextStyle(height: 1.7, fontSize: 16),
            )
                      ],

                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
