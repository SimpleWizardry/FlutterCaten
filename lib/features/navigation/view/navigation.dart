import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Навигация"),
      ),
      body: ListView.separated(
        itemBuilder: (context, i) => ListTile(
          trailing: const Icon(Icons.arrow_forward_ios),
          title: Text('Утверждение счетов', style: theme.textTheme.bodyMedium),
          onTap: () {
            Navigator.of(context).pushNamed('/schet-list');
          },
        ),
        separatorBuilder: (context, i) => const Divider(),
        itemCount: 1,
      ),
    );
  }
}
