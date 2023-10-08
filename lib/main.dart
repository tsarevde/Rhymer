// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFF82810);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFEFF1F3),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          HistoryBlock(),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          RhymesBlock(),
        ],
      ),
      bottomNavigationBar: MainBottomBar(),
    );
  }
}

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
      centerTitle: true,
      title: Text(
        'Rhymer',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SearhLine(),
      ),
    );
  }
}

class HistoryBlock extends StatelessWidget {
  const HistoryBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          padding: const EdgeInsets.only(left: 16),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(width: 16),
          itemCount: 10,
          itemBuilder: (context, index) {
            final rhymes = List.generate(4, (index) => 'Рифма ${index + 1}');
            return RhymeHistoryCard(rhymes: rhymes);
          },
        ),
      ),
    );
  }
}

class RhymesBlock extends StatelessWidget {
  const RhymesBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 30, itemBuilder: (context, index) => const RhymeListCard());
  }
}

class MainBottomBar extends StatelessWidget {
  const MainBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomNavigationBar(
      selectedItemColor: theme.primaryColor,
      unselectedItemColor: theme.hintColor,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: 'Поиск',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Избранное',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Стихи',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Настройки',
        ),
      ],
    );
  }
}

class RhymeHistoryCard extends StatelessWidget {
  const RhymeHistoryCard({
    super.key,
    required this.rhymes,
  });

  final List<String> rhymes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainer(
      width: 200,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Слово',
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          Wrap(
            children: rhymes
                .map((e) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Text(e),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    Key? key,
    required this.width,
    required this.child,
    this.margin,
    this.padding = const EdgeInsets.only(left: 12),
  }) : super(key: key);

  final double width;
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      height: 40,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

class RhymeListCard extends StatelessWidget {
  const RhymeListCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainer(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Рифма',
            style: theme.textTheme.bodyLarge,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                size: 20,
                color: theme.hintColor.withOpacity(0.2),
              ))
        ],
      ),
    );
  }
}

class SearhLine extends StatelessWidget {
  const SearhLine({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.hintColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search_rounded,
            color: theme.hintColor.withOpacity(0.4),
          ),
          const SizedBox(width: 12),
          Text(
            'Поиск рифм...',
            style: TextStyle(
              fontSize: 18,
              color: theme.hintColor.withOpacity(0.4),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
