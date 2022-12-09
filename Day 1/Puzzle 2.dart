import 'dart:io';

import 'Day 1 Helpers.dart';
import 'Elf.dart';

void main() async {
  // Declare and initialize a File reference to the input file.
  File inputFile = File('Input.txt');

  // Proceed to read in puzzle input and process the input to obtain puzzle
  // solution (total number of calories held the top three calorie-bearing
  // elves).
  try {
    // Declare and initialize variables to be used to solve the puzzle.
    List<String> lines = await inputFile.readAsLines();
    List<Elf> elves = prepareElfList(inputLines: lines);

    // Sort the List of elves by number of calories carried in descending order.
    elves.sort(((a, b) => b.caloriesCarried.compareTo(a.caloriesCarried)));

    // Report the number of calories held by the top three calorie-bearing
    // elves.
    print(
        'Sum of Calories Held by Top Three Calorie-Bearing Elves: ${elves[0].caloriesCarried + elves[1].caloriesCarried + elves[2].caloriesCarried}');
  } catch (exception) {
    // This block is here more as a formality since it's possible that there
    // will be an issue reading in the input file.
    print('Oh no! Something went wrong.');
  }
}
