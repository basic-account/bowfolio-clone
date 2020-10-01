# Bowfolio Clone

Warm-up assignment for ICS491, based off of <https://bowfolios.github.io/>  

Bowfolio Clone is targeted at Android only at this time.  

This project is in development using Flutter, with Dart as the primary language.  
Other technologies currently in use are: [flutter_bloc](https://pub.dev/packages/flutter_bloc), [equatable](https://pub.dev/packages/equatable) and [formz](https://pub.dev/packages/formz).  

## Milestone 1  

- [x] Basic Modeling  
- [x] Views for each 'list' type, `Profiles`, `Projects` and `Interests`  

### Projects  

The `Projects` tab shows all the projects, as well as the pictures of the relevant people (or pups) working on them.  

<img src='images/projects-ms1.png' width="250" height="500">  

### Profiles  

The `Profiles` tab shows the profile of each individual, as well as their interests and pictures for the projects they're working on.  

<img src='images/profiles-ms1.png' width="250" height="500">  

### Interests  

The `Interests` tab shows the interests of each profile and project.  

<img src='images/interests-ms1.png' width="250" height="500">  

## Milestone 2  

- [x] Views for every page  
- [x] Authenticated user  

### User  

The `Home` tab has been converted into the login/landing page when opening the app. The `Add` and `Filter` tabs are now locked behind authentification.  

<img src='images/authentication.png' width="250" height="500">  

Once safely logged in, the `Home` tab transforms into a view asking the user to complete or edit their profile.  

<img src='images/edit_profile.png' width="250" height="500">  

### Add Project  

The `Add Project` now has a bit more lustre. Some amount of form validation is also included for every text box.  

<img src='images/add_project.png' width="250" height="500">  

### Filter  

`Filter` checks profiles against the given interests. If any of the interests match profiles, the filter shows them all.  

<img src='images/filter.png' width="250" height="500">  

## Milestone 3  

- [ ] Link data to database  
- [ ] Clean views  
- [ ] Fix obvious bugs  

## Running the project  

Prerequisites: [Flutter/Flutter command line tools](https://flutter.dev/docs/get-started/install) and a connected Android device/simulator.  

*note*: Android Studio is not required. Simulators however do require a partial download as described on the Flutter install page.  

Running the command: `flutter doctor` can assist greatly in finding potential client-side issues.  

In a terminal, run the following commands:  

`git clone https://github.com/basic-account/bowfolio-clone.git`  

`cd bowfolio-clone`  

`flutter run`  
