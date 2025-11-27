Exercise Week 4 – Flutter & Dart

This repository contains multiple exercises focusing on Flutter UI, state persistence, asynchronous programming, and Dart isolates.
Below is a detailed overview of each task included in this assignment.

1. List View Exercise
 Goal

Create a scrollable list of contacts, each displaying:

A placeholder avatar image

A name or label

 Bonus

Complete the list view with enhanced UI or extra contact details to earn additional marks.
Estimated time: 2 hours.

2. Grid View Exercise
 Goal

Build a Flutter layout showing a gallery of 12 images/icons using both GridView types:

Section 1: GridView.count()

Columns: 3

Row spacing: 8

Column spacing: 8

Aspect ratio: 1

Title: "Fixed Column Grid"

Item requirements:

Colored container with rounded corners

Icon/image centered

Text label below (e.g., "Item 1")

Section 2: GridView.extent()

Max cross-axis extent: 150

Row spacing: 10

Column spacing: 10

Aspect ratio: 0.8

Title: "Responsive Grid"

Same item requirements as Section 1

 Bonus

Finish within 50 minutes to earn extra marks.

3. Shared Preferences Exercise
 Goal

Create a Flutter app that stores and retrieves user data.

Required Features

A TextField for entering a username

Save Name button → uses SharedPreferences to store the username

Show Name button → displays saved username

Proper handling when no name is saved

 Bonus Challenges

Add Clear button to remove saved data

Save additional fields:

Age

Email

Display the last saved timestamp

 4. Asynchronous Programming Exercise
Task

Build a simple app that:

Displays "Loading user..."

Waits for 3 seconds

Shows "User loaded successfully!"

This demonstrates the use of Future.delayed and async/await in Flutter.

5. Isolate Exercises
Challenge 1 — Flutter/Dart compute()

Build an app that:

Calculates the factorial of a large number (e.g., 30,000!)

Performs computation in a separate isolate using compute()

Shows loading indicator during calculation

Displays the result when done

Challenge 2 — Dart Console Isolate

Create a Dart console application that:

Spawns a background isolate

Worker isolate sends random numbers every second

Main isolate continuously sums the values

When sum > 100 → main isolate sends "stop"

Worker isolate receives "stop" and exits using:

Isolate.exit()

Project Structure (Suggested)
project/
 ├── lib/
 │    ├── list_view/
 │    ├── grid_view/
 │    ├── shared_prefs/
 │    ├── async_task/
 │    └── isolates/
 │
 ├── bin/
 │    └── main.dart (Challenge 2 entry point)
 │
 └── README.md
