import 'package:flutter/material.dart';
import 'package:managresguard/constants.dart';
import 'package:managresguard/domain/models/bank_card_model.dart';
import 'package:managresguard/widgets/add_card.dart';
import 'package:managresguard/widgets/bank_card.dart';
import 'package:managresguard/widgets/profile_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pg = PageController(
    viewportFraction: .8,
    initialPage: 0,
  );

  double page = 1.0;

  late Size size;
  double verPos = 0.0;
  Duration defaultDuration = const Duration(milliseconds: 300);

  void pageListener() {
    setState(() {
      page = _pg.page!;
    });
  }

  void onVerticalDrag(DragUpdateDetails details) {
    setState(() {
      verPos += details.primaryDelta!;
      verPos = verPos.clamp(0, double.infinity);
    });
  }

  void onVerticalDragEnds(DragEndDetails details) {
    setState(() {
      if (details.primaryVelocity! > 500 || verPos > size.height / 2) {
        verPos = size.height - 40;
      } else if (details.primaryVelocity! < -500 || verPos < size.height / 2) {
        verPos = 0;
      }
    });
  }

  @override
  void initState() {
    _pg.addListener(pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pg.removeListener(pageListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: (size.height * .25) + verPos,
            bottom: size.height * .2 - verPos,
            left: 0,
            right: 0,
            child: PageView(
              controller: _pg,
              children: cards.map((e) => BankCard(bankCard: e)).toList(),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            top: MediaQuery.of(context).padding.top - verPos,
            left: size.width * .1 - verPos,
            right: size.width * .1 - verPos,
            bottom: size.height * .75 - verPos,
            child: ProfileSection(verticalPos: verPos),
          ),
          Positioned(
            top: size.height * .85 + verPos,
            left: size.width * .1,
            right: size.width * .1,
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 25.0, end: 0),
              duration: const Duration(milliseconds: 200),
              builder: (context, double value, _) => Transform.translate(
                offset: Offset(0, value),
                child: ListTile(
                  leading: CircleAvatar(
                    foregroundImage: AssetImage(cards[page.round()].expenses.first.image),
                  ),
                  title: Text(cards[page.round()].expenses.first.title),
                  subtitle: Text(cards[page.round()].expenses.first.description),
                  trailing: Text(
                    "-\$${cards[page.round()].expenses.first.amount.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
