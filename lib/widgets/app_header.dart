import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Toluwalase'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/'),
          child: const Text('Home'),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/works'),
          child: const Text('Works'),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/about'),
          child: const Text('About'),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, 'setting'),
          child: const Text('setting'),
        )
        // TextButton(
        //   onPressed: () => Navigator.pushNamed(context, '/for-you'), 
        //   child: const Text('For you'),
        // )
        
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
