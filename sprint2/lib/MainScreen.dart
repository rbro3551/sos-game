import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe_example/utils.dart';
import 'package:tic_tac_toe_example/FirstScreen.dart';
import 'package:tic_tac_toe_example/main.dart';

class MainPage extends StatefulWidget {
  final String title;
  final int value;

  const MainPage({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class Player {
  static const none = '';
  static const Red = 'Red';
  static const Blue = 'Blue';
  String name;
  String curlet;
  Player({required this.name, required this.curlet});
}

class _MainPageState extends State<MainPage> {
  letters? _letter = letters.S;

  var block = 'S';

  late int countMatrix = widget.value;
  static final double size = 92;

  final Player red = new Player(name: "red", curlet: '');
  final Player blue = new Player(name: 'blue', curlet: '');

  String lastMove = Player.none;
  late List<List<String>> matrix;

  @override
  void initState() {
    super.initState();

    setEmptyFields();
  }

  void setEmptyFields() => setState(() => matrix = List.generate(
        countMatrix,
        (_) => List.generate(countMatrix, (_) => Player.none),
      ));

  Color getBackgroundColor() {
    final thisMove = lastMove == Player.Red ? Player.Blue : Player.Red;

    return getFieldColor(thisMove).withAlpha(150);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: getBackgroundColor(),
        appBar: AppBar(
          title: Text(widget.title),
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: Row(
          children: [
            new Flexible(
              child: ListTile(
                title: const Text('S'),
                leading: Radio<letters>(
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
            new Flexible(
              child: ListTile(
                title: const Text('O'),
                leading: Radio<letters>(
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
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Utils.modelBuilder(matrix, (x, value) => buildRow(x)),
        ),
      );

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
    switch (value) {
      case Player.Blue:
        return Colors.blue;
      case Player.Red:
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  Widget buildField(int x, int y) {
    final value = matrix[x][y];
    final maincolor = lastMove;
    final color = getFieldColor(value);

    return Container(
      margin: EdgeInsets.all(4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(size, size), backgroundColor: color),
        child: Text(value, style: TextStyle(fontSize: 32, color: Colors.black)),
        onPressed: () => selectField(value, x, y),
      ),
    );
  }

  void selectField(String value, int x, int y) {
    if (value == Player.none) {
      final newValue = lastMove == Player.Red ? Player.Blue : Player.Red;
      final blockLetter = block;

      setState(() {
        lastMove = newValue;
        matrix[x][y] = block;
      });

      if (matrix[x][y] == "O") {
        //   showEndDialog("hi");
        try {
          if ((matrix[x][y + 1] == "S") && (matrix[x][y - 1] == "S")) {
            showEndDialog('Hello');
          }
        } on Exception catch (exception) {
        } catch (error) {}
        try {
          if ((matrix[x + 1][y] == "S") && (matrix[x - 1][y] == "S")) {
            showEndDialog('Hello');
          }
        } on Exception catch (exception) {
        } catch (error) {}
        try {
          if ((matrix[x - 1][y - 1] == "S") && (matrix[x + 1][y + 1] == "S")) {
            showEndDialog('Hello');
          }
        } on Exception catch (exception) {
        } catch (error) {}
        try {
          if ((matrix[x + 1][y - 1] == "S") && (matrix[x - 1][y + 1] == "S")) {
            showEndDialog('Hello');
          }
        } on Exception catch (exception) {
        } catch (error) {}
      } else if (matrix[x][y] == "S") {
        try {
          if ((matrix[x][y + 1] == "O") && (matrix[x][y + 2] == "S")) {
            showEndDialog('Hello');
          }
        } on Exception catch (exception) {
        } catch (error) {}
        try {
          if ((matrix[x][y - 1] == "O") && (matrix[x][y - 2] == "S")) {
            showEndDialog('Hello');
          }
        } on Exception catch (exception) {
        } catch (error) {}
        try {
          if ((matrix[x + 1][y] == "O") && (matrix[x + 2][y] == "S")) {
            showEndDialog('Hello');
          }
        } on Exception catch (exception) {
        } catch (error) {}
        try {
          if ((matrix[x - 1][y] == "O") && (matrix[x - 2][y] == "S")) {
            showEndDialog('Hello');
          }
        } on Exception catch (exception) {
        } catch (error) {}
        try {
          if ((matrix[x - 1][y - 1] == "O") && (matrix[x - 2][y - 2] == "S")) {
            showEndDialog('Hello');
          }
        } on Exception catch (exception) {
        } catch (error) {}
        try {
          if ((matrix[x - 1][y + 1] == "O") && (matrix[x - 2][y + 2] == "S")) {
            showEndDialog('Hello');
          }
        } on Exception catch (exception) {
        } catch (error) {}
        try {
          if ((matrix[x + 1][y + 1] == "O") && (matrix[x + 2][y + 2] == "S")) {
            showEndDialog('Hello');
          }
        } on Exception catch (exception) {
        } catch (error) {}
        try {
          if ((matrix[x + 1][y - 1] == "O") && (matrix[x + 2][y - 2] == "S")) {
            showEndDialog('Hello');
          }
        } on Exception catch (exception) {
        } catch (error) {}
      }
    }
  }

  bool isEnd() =>
      matrix.every((values) => values.every((value) => value != Player.none));

  Future showEndDialog(String title) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
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
