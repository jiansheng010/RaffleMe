# Project 6
### Ruby on Rails Project

### Roles
* Overall Project Manager: JS Teoh
* Coding Manager: Tom Paoloni
* Testing Manager: Austin Pearce
* Documentation: Brandon Arbuthnot

### Contributions
* JS Teoh: Created the Team, FAQ, License page. Implemented the main logic for a game of raffle (adding points, handling raffle routes for questions and for endgame).
* Tom Paoloni: Created the room management, handled web sockets, and helped style pages.
* Austin Pearce: Created the results and questions page. Implemented the main logic for handling insertion of new questions.
* Brandon Arbuthnot: Created the users management and signup/signin page. Implemented devise to handle user authentication.

### Building and running the project
Navigate to the rails project directory and run:
```
> bundle update
> bundle install
> rails db:migrate
> rails db:seed
> rails server
```

### What is RaffleMe?
RaffleMe is a simple raffle/trivia application invloving room joining and hosting, answering trivia, and random winner draw


### Using RaffleMe

#### How it works
The core functionality of RaffleMe involves hosting raffle rooms. A single user hosts a room and then other users, given a room code, can join that room. The "room manager" then starts the raffle for the other users. The users then answer questions until the room manager ends the raffle. Once the raffle is ended, a random winner is chosen. More correctly answered questions means higher chance of being chosen as a winner.

#### Hosting a Raffle Room
Hosting a room is simple. Simply navigate the the app's home page and use the "Create Quick Room" form to create a simple raffle room. All that is required is a room name.

Another option for room hosting is using an account. A user can sign up and then create a room from their user dashboard. Creating a room this way gives users more options and allows for persistant, account-bound rooms.


#### Joining
To join a raffle, a logged out user types in a room code that they have been given into the "Join a Quick Room" form, types in a username, and hits Join. A logged in user can do the same using the "Join" form on their dashboard. 

### Known bugs

* Sometimes when joining a room, rails given an "Authentication Token" error. The current solution to this is to navigate back to the home screen and try joining again.

* ~~On some computers, when the raffle manager hits "End Raffle", the raffle does not end for the users that have joined. We believe that this is an issue with the Faye websockets but are having trouble duplicating the bug on different PC's.~~
   * This has been fixed, by adding a delay to the manager javascript, allowing it to publish to Faye before redirecting to the results page
