# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


questions = [
    "The Plaka is the oldest quarter of which city?",
    "What is an axolotl?",
    "The Panama Canal was officially opened by which US president?",
    "In which opera did Maria Callas make her last appearance at Covent Garden?",
    "After Adam, Eve, Cain and Abel who is the next person mentioned in the Bible?",
    "What is a kudzu?",
    "Outlawed from 1603 to 1774, which Scottish clan was known as the ‘Faceless Clan’?",
    "From which country does tennis player Andres Gomez, winner of the 1990 French Championships, come?",
    "Which US city is located on the Maumee River at Lake Erie?",
    "Lisbon stands at the mouth of which river?",
    "What is the longest river in France?",
    "In which Australian state is Darwin?",
    "Apart from Rome, how many cities in Italy have a population of over one million?",
    "What in America is the Palmetto state?",
    "In which ocean is Madagascar",
    "In which US city is the Sears Tower?",
    "Galena is an ore of which metal?",
    "Which sign of the zodiac comes between Leo and Libra?",
    "Which planet is said to influence the way we communicate?",
    "Are you a fire, air, water or earth sign if you were born under Aquarius?",
]

correct_answer = [
    "Athens",
    "A species of salamander",
    "Woodrow Wilson",
    "Tosca",
    "Enoch",
    "Antelope",
    "MacGregor",
    "Ecuador",
    "Toledo",
    "Tagus",
    "Loire",
    "Northern Territory",
    "Three: Milan, Naples and Turin",
    "South Carolina",
    "Indian",
    "Chicago",
    "Lead",
    "Virgo",
    "Mercury",
    "Air"
]

wrong_answer_1 = [
    "Prague",
    "A nerve in the brain",
    "Calvin Coolidge",
    "Carmen",
    "Jubal",
    "Bird",
    "Campbell",
    "Peru",
    "Detroit",
    "Seine",
    "Seine",
    "Queensland",
    "Two: Genoa and Venice",
    "Florida",
    "Atlantic",
    "Boston",
    "Copper",
    "Taurus",
    "Venus",
    "Fire"
]

wrong_answer_2 = [
    "Rome",
    "A multi-axled vehicle",
    "Herbert Hoover",
    "Madame Butterfly",
    "Lamech",
    "Jewish settlement",
    "MacLeod",
    "Portugal",
    "Cleveland",
    "Duoro",
    "Rhone",
    "Western Australia",
    "One: Ancona",
    "Louisiana",
    "Pacific",
    "St. Louis",
    "Zinc",
    "Aries",
    "Mars",
    "Water"
]

wrong_answer_3 = [
    "Vienna",
    "A type of mortice lock",
    "Theodore Roosevelt",
    "La Boheme",
    "Zillah",
    "Climbing plant",
    "MacDonald",
    "Spain",
    "Buffalo",
    "Rio Grande",
    "Gironde",
    "Tasmania",
    "Four: Florence, Bologna, Trieste and Palermo",
    "Alabama",
    "Arctic",
    "San Francisco",
    "Iron",
    "Capricorn",
    "Saturn",
    "Earth"
]

20.times { |i|
    question = Question.create( prompt: questions[i], correct_answer: correct_answer[i], wrong_answer_1: wrong_answer_1[i],
    wrong_answer_2: wrong_answer_2[i], wrong_answer_3: wrong_answer_3[i], user_email: nil )
    question.save
}

20.times { |i|
    question = Question.create( prompt: questions[i], correct_answer: correct_answer[i], wrong_answer_1: wrong_answer_1[i],
    wrong_answer_2: wrong_answer_2[i], wrong_answer_3: wrong_answer_3[i], user_email: 'test@test.com' )
    question.save
}

question = Question.create( prompt: "What grade do you need to pass 3901?", correct_answer: "50", wrong_answer_1: "100",
    wrong_answer_2: "60", wrong_answer_3: "10", user_email: 'test@test.com' )
question.save

faq = Faq.create(question: "What is RaffleMe?", answer: "RaffleMe is a live question-based game.")
faq.save

faq = Faq.create(question: "How do I create a quick room?", answer: "Just go to the home page and look for the 'Create Quick Room' form. Type in a room name and click 'Create'.")
faq.save

faq = Faq.create(question: "How do I join a quick room?", answer: "Just go to the home page and look for the 'Join Quick Room' form. Type in a username and a valid room code and click 'Join'.")
faq.save

faq = Faq.create(question: "How do I win a game of RaffleMe?", answer: "The more questions you answer, the higher chance of winning.")
faq.save

faq = Faq.create(question: "Is there a way to win real money?", answer: "No.")
faq.save

faq = Faq.create(question: "Do we plan to add more features to this project?", answer: "Maybe.")
faq.save

faq = Faq.create(question: "Should we get an A for this project?", answer: "Yes.")
faq.save