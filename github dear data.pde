class FoodDay {
  String Day;               // The day i ate food.
  String Food;              // The food i ate.
  String Time;              // The time i ate the food.
  String EnergyLevels;      // How my energy levels change.
  float x, y;               // Centre of the symbol in the grid.

 FoodDay(TableRow row, int position) { // The row of my csv data.
    index = position;                     // Save the zero-based position.
    Day = row.getInt("Day"); // Read the day.
    Food = row.getString("Food"); // Read the food 
    Time = row.getString("Time"); // Read the time i ate
    EnergyLevels = row.getString("EnergyLevels"); // Read the energy levels at differnt data points 
  
  
 }
  int moodChange(){   // Assessed method that RETURNS a value.
    return moodAfter - moodBefore;        // Positive, negative, or zero.
  }
  
  color dayColor() {
     if (dayColour.equals("Monday")) return color(245, 2, 2); // Mondays colour - red
     if (dayColour.equals("Tuesday")) return color(255, 210, 102); // Tuesdays colour - yellow
     if (dayColour.equals("Wednesday")) return color(72, 0, 245); // Wednesdays colour - purple
     if (dayColour.equals("Thursday")) return color(0, 245, 136); // Thursdays colour - green
     if (dayColour.equals("Friday")) return color(3, 12, 255); // Friday colours - blue
     if (dayColour.equals("Saturday")) return color(245, 2, 2); // Saturdays colour - rose
     if (dayColour.equals("Sunday")) return color(3, 147, 255); // Sunday colour - Light blue
  }
  color moodcolour(){
    if(moodChange()>0 )return color( 18, 222, 70); // Mood is better 
     if(moodChange()<0 )return color(255, 15, 35 ); // Mood is worse
     return color(165, 170, 169); // Mood is the same
}
