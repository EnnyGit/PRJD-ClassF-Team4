class Algorithms {
  // Wat doet een workout met je stats?


  // Wat heb je nodig voor een bepaalde goal?

  // Endurance berekenen
  double getEndurance(int age, ) {
    double vomax = 15.3 * (220 - age) / restingHeartRate;
    return (vomax - 32) * 3.33;
  }
}