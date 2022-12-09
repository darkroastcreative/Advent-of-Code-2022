import 'Elf.dart';

/// Iterates a List of String values containing either numbers of calories or
///  blank lines to prepare a List of Elf objects, with each Elf carrying a
///  certain number of calories. Created this utility function since this logic
/// is needed for both Day 1 puzzles.
List<Elf> prepareElfList({List<String> inputLines = const <String>[]}) {
  List<Elf> elves = <Elf>[];
  int calorieCount = 0;

  // Iterate over the set of lines read in from the input file and process
  // each line's value.
  for (String line in inputLines) {
    // If the line is not empty (and therefore has a calorie value), add the
    // value to the running calorie count. Otherwise, add a new Elf to the
    // list of elves with the running calorie count and clear the running
    // count so we can move on to the next Elf.
    if (line.isNotEmpty) {
      calorieCount += int.tryParse(line) ?? 0;
    } else {
      elves.add(new Elf(calorieCount));
      calorieCount = 0;
    }
  }

  // Add the last Elf to the list of elves to make sure they're counted
  // (since the last line in the input file is a calorie value). Quick and
  // dirty way to make sure every Elf is counted.
  elves.add(new Elf(calorieCount));

  return elves;
}
