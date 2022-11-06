import 'package:flutter/material.dart';
import 'package:tic_tac_toe_example/utils.dart';
import 'package:tic_tac_toe_example/main.dart';
import 'package:tic_tac_toe_example/winconditions.dart';
import 'Player.dart';
import 'globals.dart';
import 'globalext.dart';
import 'package:collection/collection.dart';

class MyCustomPainter extends CustomPainter {
  List<Offset> linelist;
  List<Offset> linelistt;
  List<Color> colors;
  MyCustomPainter(this.linelist, this.linelistt, this.colors);
  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < linelist.length; i++) {
      canvas.drawLine(
          linelist[i],
          linelistt[i],
          Paint()
            ..strokeWidth = 4
            ..color = colors[i]);
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class MainPage extends StatefulWidget {
  final String title;
  final int value;

  const MainPage({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Offset> linelist = [];
  List<Offset> linelistt = [];
  List<Color> colors = [];
  letters? _letter = letters.S;

  var block = 'S';

  Player redplayer = new Player(color: 'red', points: 0);
  Player blueplayer = new Player(color: 'blue', points: 0);

  late int countMatrix = widget.value;
  static final double size = 92;

  String lastMove = '';
  late List<List<String>> matrix;

  @override
  void initState() {
    super.initState();
    winnums = [];
    coords = [];
    keylist.clear();
    blocklist.clear();
    setEmptyFields();
    if (blocklist.length < countMatrix) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => getitems(keylist, blocklist));
    }
  }

  void setEmptyFields() => setState(() => matrix = List.generate(
        countMatrix,
        (_) => List.generate(countMatrix, (_) => ''),
      ));

  Color getBackgroundColor() {
    final thisMove =
        lastMove == redplayer.color ? blueplayer.color : redplayer.color;

    return getFieldColor(thisMove).withAlpha(150);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: getBackgroundColor(),
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Red: ${redplayer.points}',
                ),
                Text('Blue: ${blueplayer.points}')
              ],
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: ListTile(
              title: const Text('S'),
              leading: Radio<letters>(
                key: ValueKey('S button'),
                value: letters.S,
                groupValue: _letter,
                onChanged: (letters? value) {
                  setState(() {
                    _letter = value;
                    block = "S";
                  });
                },
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: ListTile(
              title: const Text('O'),
              leading: Radio<letters>(
                key: ValueKey('O button'),
                value: letters.O,
                groupValue: _letter,
                onChanged: (letters? value) {
                  setState(() {
                    _letter = value;
                    block = "O";
                  });
                },
              ),
            ),
          ),
        ],
      ),
      body: Container(
          child: Stack(children: [
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: Utils.modelBuilder(matrix, (x, value) => buildRow(x)),
            ),
          ),
        ),
        CustomPaint(
          foregroundPainter: MyCustomPainter(linelist, linelistt, colors),
          size: Size.infinite,
        )
      ])));

  Widget buildRow(int x) {
    final values = matrix[x];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Utils.modelBuilder(
        values,
        (y, value) => buildField(x, y),
      ),
    );
  }

  Color getFieldColor(String value) {
    if (value == blueplayer.color) {
      return Colors.blue;
    } else if (value == redplayer.color) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }

  Widget buildField(int x, int y) {
    final value = matrix[x][y];
    final color = getFieldColor(value);
    final containerKey = new GlobalKey();

    keylist.add(containerKey);

    return Container(
      margin: EdgeInsets.all(4),
      child: ElevatedButton(
          key: containerKey,
          style: ElevatedButton.styleFrom(
              minimumSize: Size(size, size), backgroundColor: color),
          child: Text(value,
              key: ValueKey(value),
              style: TextStyle(fontSize: 32, color: Colors.black)),
          onPressed: () {
            print(containerKey.globalPaintBounds?.center);
            selectField(matrix, value, x, y, blocklist);
          }),
    );
  }

  void getitems(List<GlobalKey> keylist, List<Offset?> blocklist) {
    for (var i = 0; i < keylist.length; i++) {
      RenderBox box =
          keylist[i].currentContext?.findRenderObject() as RenderBox;
      final Size size = box.size;
      Offset? position = keylist[i].globalPaintBounds?.center;
      var posx = position?.dx;
      var posy = (position!.dy - (size.height * 1.3));
      Offset? newpos = Offset(posx!, posy);
      blocklist.add((newpos));
    }
  }

  void selectField(List<List<String>> matrix, String value, int x, int y,
      List<Offset?> keys) {
    if (value == '') {
      final newValue =
          lastMove == redplayer.color ? blueplayer.color : redplayer.color;
      coords = keys.slices(widget.value);
      setState(() {
        matrix[x][y] = block;
        if ((widget.title == "General Game") &&
            (winconditions(matrix, value, x, y) == "TRUE")) {
          if (lastMove == redplayer.color) {
            linelist.add(winnums[0]);
            linelistt.add(winnums[1]);
            colors.add(getFieldColor(newValue));
            winnums.clear();
            blueplayer.points += 1;
          } else {
            // print(winnums);
            // print(coords);
            linelist.add(winnums[0]);
            linelistt.add(winnums[1]);
            colors.add(getFieldColor(newValue));
            winnums.clear();
            redplayer.points += 1;
          }
          lastMove = lastMove;
        } else if ((winconditions(matrix, value, x, y) == "TRUE") &&
            (widget.title == "Simple Game")) {
          // print(winnums);

          showEndDialog("Player ${newValue} won!");
        } else {
          lastMove = newValue;
        }
      });
      if (isEnd()) {
        if (redplayer.points > blueplayer.points) {
          showEndDialog("Player red wins!");
        } else if (redplayer.points < blueplayer.points) {
          showEndDialog("Player blue wins!");
        } else {
          showEndDialog("Tie!");
        }
      }
    }
  }

  bool isEnd() =>
      matrix.every((values) => values.every((value) => value != ''));

  Future showEndDialog(String title) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          key: ValueKey('game end'),
          title: Text(title),
          content: Text('Press to Restart the Game'),
          actions: [
            ElevatedButton(
              onPressed: () {
                setEmptyFields();
                //Navigator.of(context).pop();
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 3);
              },
              child: Text('Restart'),
            )
          ],
        ),
      );
}
