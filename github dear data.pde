class FoodDay {
  String Day;               // The day i ate food.
  String Food;              // The food i ate.
  String Time;              // The time i ate the food.
  String EnergyLevels;      // How my energy levels change.
  float x, y;               // Centre of the symbol in the grid.

 FoodDay(TableRow row, int position) { // The row of my csv data.
    index = position;                     // Save the zero-based position.
    Day = row.getString("Day"); // Read the day.
    Food = row.getString("Food"); // Read the food 
    Time = row.getString("Time"); // Read the time i ate
    EnergyLevels = row.getString("EnergyLevels"); // Read the energy levels at differnt data points 
  
  
 }
  int moodChange(){   // Assessed method that RETURNS a value.
    return moodAfter - moodBefore;        // Positive, negative, or zero.
  }
  
  color dayColor() {
     if ("Monday".equals(Day)) return color(245, 2, 2); // Mondays colour - red
     if ("Tuesday".equals(Day)) return color(255, 210, 102); // Tuesdays colour - yellow
     if ("Wednesday".equals(Day)) return color(72, 0, 245); // Wednesdays colour - purple
     if ("Thursday".equals(Day)) return color(0, 245, 136); // Thursdays colour - green
     if ("Friday".equals(Day)) return color(3, 12, 255); // Friday colours - blue
     if ("Saturday".equals(Day)) return color(245, 2, 2); // Saturdays colour - rose
     if ("Sunday".equals(Day)) return color(3, 147, 255); // Sundays colour - Light blue
  }
  color moodcolour(){
    if(moodChange()>0 )return color( 18, 222, 70); // Mood is better 
     if(moodChange()<0 )return color(255, 15, 35 ); // Mood is worse
     return color(165, 170, 169); // Mood is the same
}

void display() {
  int column = index % 7; // 7 columns in the grid
  int row = index / 7; // Calculate the row based on the index
  x = column * 100 + 50; // Calculate the x position based on the column
  y = row * 100 + 50; // Calculate the y position based on the row
  noStroke();
  fill(index == selectedIndex ? color(40, 70, 113) : color(21, 39, 85));
  rect(x - 50, y - 50, 100, 70,10); // Draw the rectangle for the day
  drawClock(x, y - 15, 22);
}

void drawClock(float cx, float cy, float radius) {
  noStroke();
  fill(34, 40, 74);
  ellipse(cx, cy, radius * 2, radius * 2);

  noFill();
  stroke(dayColor());
  strokeWeight(6);
  ellipse(cx, cy, (radius + 3) * 2, (radius + 3) * 2);
  noStroke();

  drawTimeDot(cx, cy, radius * 0.75);
}

int startMinutes() {
  // Finds the first time, such as "07:20", even if the range has a typo.
  String[] found = match(Time, "\\d{1,2}:\\d{2}");
  if (found == null) return -1;

  String[] parts = split(found[0], ':');
  return int(parts[0]) * 60 + int(parts[1]);
}

void drawTimeDot(float cx, float cy, float radius) {
  int minutes = startMinutes();
  if (minutes < 0) return;

  // Map midnight to the top of the clock and move clockwise.
  float angle = TWO_PI * minutes / 1440.0 - HALF_PI;
  float dotX = cx + cos(angle) * radius;
  float dotY = cy + sin(angle) * radius;
  noStroke();
  fill(255);
  ellipse(dotX, dotY, 8, 8);
}
