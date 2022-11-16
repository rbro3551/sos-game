import 'globals.dart';
import 'MainScreen.dart';

String winconditions(List<List<String>> matrix, String value, int x, int y) {
  if (matrix[x][y] == "O") {
    //   showEndDialog("hi");
    try {
      if ((matrix[x][y + 1] == "S") && (matrix[x][y - 1] == "S")) {
        winnums.add(coords.elementAt(x)[y + 1]);
        winnums.add(coords.elementAt(x)[y - 1]);
        return "TRUE";
      }
    } on Exception catch (exception) {
    } catch (error) {}
    try {
      if ((matrix[x + 1][y] == "S") && (matrix[x - 1][y] == "S")) {
        winnums.add(coords.elementAt(x + 1)[y]);
        winnums.add(coords.elementAt(x - 1)[y]);
        return "TRUE";
      }
    } on Exception catch (exception) {
    } catch (error) {}
    try {
      if ((matrix[x - 1][y - 1] == "S") && (matrix[x + 1][y + 1] == "S")) {
        winnums.add(coords.elementAt(x - 1)[y - 1]);
        winnums.add(coords.elementAt(x + 1)[y + 1]);
        return "TRUE";
      }
    } on Exception catch (exception) {
    } catch (error) {}
    try {
      if ((matrix[x + 1][y - 1] == "S") && (matrix[x - 1][y + 1] == "S")) {
        winnums.add(coords.elementAt(x + 1)[y - 1]);
        winnums.add(coords.elementAt(x - 1)[y + 1]);
        return "TRUE";
      }
    } on Exception catch (exception) {
    } catch (error) {}
  } else if (matrix[x][y] == "S") {
    try {
      if ((matrix[x][y + 1] == "O") && (matrix[x][y + 2] == "S")) {
        winnums.add(coords.elementAt(x)[y]);
        winnums.add(coords.elementAt(x)[y + 2]);
        return "TRUE";
      }
    } on Exception catch (exception) {
    } catch (error) {}
    try {
      if ((matrix[x][y - 1] == "O") && (matrix[x][y - 2] == "S")) {
        winnums.add(coords.elementAt(x)[y]);
        winnums.add(coords.elementAt(x)[y - 2]);
        return "TRUE";
      }
    } on Exception catch (exception) {
    } catch (error) {}
    try {
      if ((matrix[x + 1][y] == "O") && (matrix[x + 2][y] == "S")) {
        winnums.add(coords.elementAt(x)[y]);
        winnums.add(coords.elementAt(x + 2)[y]);
        return "TRUE";
      }
    } on Exception catch (exception) {
    } catch (error) {}
    try {
      if ((matrix[x - 1][y] == "O") && (matrix[x - 2][y] == "S")) {
        winnums.add(coords.elementAt(x)[y]);
        winnums.add(coords.elementAt(x - 2)[y]);
        return "TRUE";
      }
    } on Exception catch (exception) {
    } catch (error) {}
    try {
      if ((matrix[x - 1][y - 1] == "O") && (matrix[x - 2][y - 2] == "S")) {
        winnums.add(coords.elementAt(x)[y]);
        winnums.add(coords.elementAt(x - 2)[y - 2]);
        return "TRUE";
      }
    } on Exception catch (exception) {
    } catch (error) {}
    try {
      if ((matrix[x - 1][y + 1] == "O") && (matrix[x - 2][y + 2] == "S")) {
        winnums.add(coords.elementAt(x)[y]);
        winnums.add(coords.elementAt(x - 2)[y + 2]);
        return "TRUE";
      }
    } on Exception catch (exception) {
    } catch (error) {}
    try {
      if ((matrix[x + 1][y + 1] == "O") && (matrix[x + 2][y + 2] == "S")) {
        winnums.add(coords.elementAt(x)[y]);
        winnums.add(coords.elementAt(x + 2)[y + 2]);
        return "TRUE";
      }
    } on Exception catch (exception) {
    } catch (error) {}
    try {
      if ((matrix[x + 1][y - 1] == "O") && (matrix[x + 2][y - 2] == "S")) {
        winnums.add(coords.elementAt(x)[y]);
        winnums.add(coords.elementAt(x + 2)[y - 2]);
        return "TRUE";
      }
    } on Exception catch (exception) {
    } catch (error) {}
  }
  return "FALSE";
}
