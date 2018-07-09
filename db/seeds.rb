# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.create([category: 0, question: 'While working together this person substantially contributed to identifying new commercial opportunities resulting in (potentially) increased sales.'])
Question.create([category: 0, question: 'This person adequately understands the customer needs and successfully incorporates them into product requirements. '])
Question.create([category: 0, question: 'This person is a customer Casanova and lives to close the deal. '])
Question.create([category: 0, question: 'He/She initiates novel or better ways of attracting customers.'])
Question.create([category: 0, question: 'Customer satisfaction exudes around him/her.'])

Question.create([category: 1, question: 'This person is the go-to person for everyone with technical questions.'])
Question.create([category: 1, question: 'This person’s expertise has been crucial to the success of this project.'])
Question.create([category: 1, question: 'This person outperforms his peers in terms of functional skills, product or other relevant knowledge.'])
Question.create([category: 1, question: 'Relative to his/her seniority level this person is a top performer/ top talent.'])
Question.create([category: 1, question: 'This person lives up to his/her potential.'])

Question.create([category: 2, question: 'This person is most-likely to generation solutions or ideas when working in a team situation than when working alone'])
Question.create([category: 2, question: 'Is capable of pulling the weight of the team project.'])
Question.create([category: 2, question: 'This person visibly enjoys working on team projects'])
Question.create([category: 2, question: 'My experience working with this team member has been primarily positive'])
Question.create([category: 2, question: 'Does their best working alone rather than in a team'])

Question.create([category: 3, question: 'Always wants to try new things'])
Question.create([category: 3, question: 'Is capable of "Connecting the Dots"'])
Question.create([category: 3, question: 'Is a total risk taker.'])
Question.create([category: 3, question: 'He/she always finds a way that works'])
Question.create([category: 3, question: 'He/She deeply embodies the desire to change and disrupt in a consistent and authentic way.'])

Question.create([category: 4, question: 'Can create an atmosphere of growth.'])
Question.create([category: 4, question: 'He/She criticizes constructively and addresses problems.'])
Question.create([category: 4, question: 'He/She can be assertive when needed.'])
Question.create([category: 4, question: 'Can set objectives and follow them through to completion.'])
Question.create([category: 4, question: 'This person displays tolerance and flexibility.'])

User.create([name: 'Liyan', email:'liyan@liyan.com', password:'liyan'])
User.create([name: 'John', email:'john@john.com', password:'john'])
User.create([name: 'Jack', email:'jack@jack.com', password:'jack'])
User.create([name: 'Jim', email:'jim@jim.com', password:'jim'])
User.create([name: 'Yvonne', email:'yvonne@yvonne.com', password:'yvonne'])
User.create([name: 'Jean', email:'jean@jean.com', password:'jean'])
User.create([name: 'Ashley', email:'ashley@ashley.com', password:'ashley'])
User.create([name: 'Alex', email:'alex@alex.com', password:'alex'])
User.create([name: 'Keith', email:'keith@keith.com', password:'keith'])
User.create([name: 'Guru', email:'guru@guru.com', password:'guru'])

