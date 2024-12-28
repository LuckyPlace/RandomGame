import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_game/coin_flip/coin_flip.dart';
import 'package:random_game/main_menu/reusable_card.dart';
import 'package:random_game/random_color/random_color.dart';
import 'package:random_game/random_picker/random_picker.dart';
import 'package:random_game/rock_scissors_paper/rock_scissors_paper.dart';
import 'package:random_game/yes_or_no/yes_or_no.dart';
import '../constants.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNormalBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Randomizer',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: kNormalBackgroundColor,
      ),
      body: const SafeArea(
        child: GameList(),
      ),
    );
  }
}

class GameList extends StatelessWidget {
  const GameList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        ReusableCard(
          iconData: CupertinoIcons.collections,
          gameName: 'Ads',
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RandomPicker(),
                    ),
                  );
                },
                child: ReusableCard(
                  iconData: CupertinoIcons.shuffle,
                  gameName: 'Random Picker',
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CoinFlip()));
                },
                child: ReusableCard(
                  iconData: CupertinoIcons.arrow_2_circlepath_circle_fill,
                  gameName: 'Coin Flip',
                  iconSize: 30.0,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RandomColor()));
                },
                child: ReusableCard(
                  iconData: CupertinoIcons.paintbrush,
                  gameName: 'Random Color',
                  iconSize: 30.0,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => YesOrNo()));
                },
                child: ReusableCard(
                  iconData: CupertinoIcons.check_mark,
                  gameName: 'Yes or No',
                  iconSize: 30.0,
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RockScissorsPaper()));
          },
          child: ReusableCard(
            iconData: CupertinoIcons.hand_raised,
            gameName: 'Rock Scissors Paper',
            iconSize: 30.0,
          ),
        )
      ],
    );
  }
}

//currentColor : 0xFF2622fb

//cardBackground : 0xFF202124

//indigo : 0xFF4050B5
