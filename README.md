# ibento

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


- there is an event that starts at B and ends at D
A       B             C           D         E         F
][======][============][==========][========][========][
                            timeline

    

1- prevent addition of event which starts at A and ends at E
    a- check if there is any event of which its startTime or 
        its endTime is between the new events startTime and endTime

2- prevent addition of event that starts at A and end at C, or that starts at C and end at E
    a- check if there is any event where the new event's startTime or endTime is between
        it's startTime and endTime

3- prevent addition of event that starts and ends between B and D
    a- same solution as problem 3