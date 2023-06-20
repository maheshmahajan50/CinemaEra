# README

**CinemaEra**

CinemaEra is a web application that allows users to browse and search for movies, mark favorite and manage movie watchlists, and rate and review movies. This repository contains the source code for the application, as well as installation and usage instructions.


**Features**

    1. Browse and search for movies by title.
    2. Rate and review movies, and see the average rating and reviews from other users.
    3. Responsive design, optimized for mobile and desktop devices.

**Technologies**

The application is built using the following technologies:

    Postgresql: for the database to store movie information, user information, and user actions
    Ruby: for the core language of Rails framework
    Rails: Web application framework build in ruby programming language.
    Javascript: for front end side logical operations.
    Html, CSS: for front end side designing.
    Docker: for containerizarition
    RSpecs: for automated testing.

**Third Party API for fetching movies**

   So Cinema Era we are fetching movies from a third party source https://rapidapi.com/apidojo/api/imdb8/
   and if user mark any movie as favorite then we store it into our db.

**Installation**

To install and run the application locally, follow these steps:

Clone the repository using Git: 

`git clone https://github.com/jainaayush/CinemaEra.git`

Install the dependencies for the server and client:

`cd CinemaEra`

install docker compose in your system and then

1. Setup command
`sudo docker-compose up -d --build`

2. Database prepare
`sudo docker-compose run web rails db:migrate`

3. Server start
`sudo docker-compose up`

This will start the server and client concurrently, and open the application in your default browser.
Usage on `http://localhost:3000`

Once the application is running, you can use it to browse and search for movies, create and manage watchlists, and rate and review movies.
Contributing

If you find a bug or would like to contribute to the application, feel free to open an issue or submit a pull request. Contributions are welcome and appreciated
