# Warhammer 40k Battlegrounds - API

Welcome to the Warhammer 40K Battlegrounds, a Pokémon-style battle clone set in the grimdark universe of Warhammer 40,000. This app brings the strategic elements of the 40K tabletop game to life by utilizing data sheets from the Warhammer 40k 10th Edition. Players can choose from a wide array of units, each with unique abilities and attributes, to engage in tactical battles. Whether you're a seasoned 40K veteran or new to the franchise, our app offers a thrilling and immersive experience that captures the essence of this epic universe.

Initially appeared on
[gist](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2). But the page cannot open anymore so that is why I have moved it here.

## Associated Front End
- [Github repo](https://github.com/turing40kconsultants/wh40k_Battlegrounds_fe)
- [Deployed application](https://intense-gorge-51639-2d7942788e0c.herokuapp.com/)

## Getting Started

You can access the game on our production environment [here](https://intense-gorge-51639-2d7942788e0c.herokuapp.com/)
Additionally, you make use of this backend by consuming our APIs listed below.
Lastly, feel free to clone this backend and help us build up on it

### Technology used

- Rails 7.1.3
- Ruby 3.2.2
- Faraday
- RSpec

### Routes

Endpoint details via [OpenAPI docs](https://wh40k-battlegrounds-be-ce09c759206c.herokuapp.com/api-docs/index.html)

All routes are GET

- Base URL: `https://intense-gorge-51639-2d7942788e0c.herokuapp.com/`
- `GET /api/v1/factions` - get all factions
- `GET /api/v1/factions/<faction_id>/units` - get all units related to a faction

## Error Conditions

Any error in query parameter values will likely respond with an error message that the faction could not be found. Double check you are passing faction id that is related to a faction 

### Getting Started

We welcome any and all contributions! Feel free to submit a Pull Request with your changes to make this a better API for everyone!

1. Clone and download [Github repo](https://github.com/turing40kconsultants/wh40k_Battlegrounds_be)
2. Install Gems: `bundle install`
3. Setup database: `rails db:{create,migrate}`
4. Run test suite: `bundle exec rspec` (100% of tests should be passing if everything was set up properly)

## ER Diagram
![image](https://github.com/user-attachments/assets/6c6a30cb-d493-48ab-8a1f-252819a0ffd5)

## 40k Battlegrounds Architecture
![image](https://github.com/user-attachments/assets/5481ed2e-10f2-4a47-bd0c-d212d4edff84)


## Built With

  - [BSData](https://github.com/BSData/wh40k-10e)
  - [Contributor Covenant](https://www.contributor-covenant.org/) - Used
    for the Code of Conduct
  - [Creative Commons](https://creativecommons.org/) - Used to choose
    the license
    
## Authors

Clyde Autin | [clydeautin](https://github.com/clydeautin) | clyde.autin@gmail.com | [LinkedIn](https://www.linkedin.com/in/clydeautin/)

Chee Lee | [cheeleertr](https://github.com/cheeleertr) | cheeleertr@gmail.com | [LinkedIn](https://www.linkedin.com/in/chee-lee-rtr/)

Luis Aparicio | [LuisAparicio14](https://github.com/luisaparicio14) | lfelipeaparicio2004@gmail.com | [LinkedIn](https://www.linkedin.com/in/luis-aparicio14/)

Lance Butler | [LJ9332](https://github.com/LJ9332) | lancej2004@gmail.com | [LinkedIn](https://www.linkedin.com/in/lance-butler-jr/)


## License

This project is licensed under the [CC0 1.0 Universal](LICENSE.md)
Creative Commons License - see the [LICENSE.md](LICENSE.md) file for
details

## Acknowledgments

  - The Emperor
  - Trazyn the infinite
