# Lightweight 
## Video Demo:  <URL HERE>
## Description:

## Idea / Concept
We wanted to created an app that combined our interests with a product that will help others in the community. As we are interested in the gym and working out, we decided that creating an app that allows users to keep track of workouts and record their workouts would be an effective project for this task. The app is implemented in Swift and built exclusively for IOS. To possibly allow functionality such as connecting with friends and sharing workouts, we decided to use a Firebase SDK Database, which allows storage of user data as well as authentication services for accounts. Our app allows users to register with an email and password, which is handled accordingly through Firebase, and creates a user for the corresponding email. Furthermore, there are features for password altering, email changes and password recovery. This means that the users can use multiple IOS devices and can sync their workouts to other devices without any difficulty, as they are automatically connected to the account. The app allows users to create workouts, which are stored in a Firebase Database and connected to the UID, which have names, exercises and repetitions. After they have been created there is a screen which displays the workouts currently connected to the UID through which workouts can be selected. If a workout is selected it is highlighted and details about exercises and the number of repetitions is shown.

## File Descriptions:

### Tab Bar
The folder ‘tab bar’ contains the framework of our app. In its documents ‘MainTabView’ and ‘MainTabViewModel’ there isn't much actual code but much rather calling of other documents and functions in order to make the project easier to create, adapt and understand, frankly just easier to work with.  The view model is used to get the current user userId (from the getUserId function) in order to pass it into the functions called in the view as a parameter. This is required as all other views require the current users userId to interact with the database

### Components
The ‘components’ folder is used for functions that display data or convert datatypes. This just helps with the overall organization of the project as other folders are thus reduced to their core functionality.


### Home
The ‘Home’ folder is used for the home tab item. It contains the document and function ‘home’ this is once again used mainly to call other functions and does not contain much functionality in itself. The only interesting part about it is the firestore query it uses to access the users ‘existingWorkouts’ document which stores the names of all currently existing workouts for that user. The result of that query is an array of type ‘workoutItem’ which is also specified in the home folder. This type has an id of type String a date of type TimeInterval and a name of type String. This data is then passed into the ‘DisplayWorkouts’ function. The function uses a firebase query in order to get the exercises in the database for the workout with the name it has been called with. To aid with this it uses its viewmodel and the ‘DisplayExerciseHome’ document/function which then uses each exercises components explained in the data type ‘ExerciseItem’ to display the relevant data from the database.

### Add
The folder contains all documents relevant for the ‘add’ tab item. Its main file ‘Add’ mainly dictates user interface features and format and calls upon the other functions and documents in the folder for actual functionality and is supported in this by its viewmodel. This view model allows for deleting all exercises of the workout that is currently being created. The document add exercise is called using a sheet and is used to add a new exercise to the workout. This function is again supported by a viewmodel that handles the interaction with the database and receiving and adding data along with catching possible errors of empty workouts being added. This data is created by the type Exercise item which contains the variables id, date, name, set1, set2, set3 all of type String except date which is of type TimeInterval. This type allows for easy adding and reading of the database throughout the whole project. DisplayExercise is a function called with an object of type ExerciseItem as its parameter and then Displays the individual variables of the specific instance. AddWorkout and its viewmodel handle the adding of the completed workout to the database under a designated name and then clearing the storage for add workout in the database that stores the exercises of the workout that is currently created. 

### Authentication
This folder includes all files that handle the authentication, creation and general management of users. This is the main part of the app that interacts with Firebase, utilising the Firebase Library’s functionality. There is a method that allows the creation of a new user with email and password, a method that returns the current user with information, as well as methods that handle password and email alteration. This file is accessed by many other files as the methods are used for many other components of the app. 

### Settings
This folder handles the settings options, mainly the ability to reset password and email. It uses the methods defined in the authentication folder to allow all functionality connected to account management. It includes error handling when the methods throw errors and connects the methods of the authentication to the actual app. 

### Assets
This folder contains the data pertaining to app icons, color schemes and such. It does not contain any code, but it is necessary for the colors of the app, as declaring them as assets allows global changes of colors based on classifications such as “Primary” and “Secondary”. This makes it possible to easily change colors or try out new ideas without having to tediously change all colors in every document.
