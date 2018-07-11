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

User.create([name: 'Fariz', email:'fariz@fariz.com', password:'fariz', phone: '012-3456789', birthdate: Date.new(1990,1,1), job_title: 'Engineer', gender: 'male', about: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'])
User.create([name: 'Liyan', email:'liyan@liyan.com', password:'liyan', phone: '012-3456789', birthdate: Date.new(1990,1,1), job_title: 'Lawyer', gender: 'female', about: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'])
User.create([name: 'John', email:'john@john.com', password:'john', phone: '012-3456789', birthdate: Date.new(1990,1,1), job_title: 'Programmer', gender: 'male', about: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'])
User.create([name: 'Jack', email:'jack@jack.com', password:'jack', phone: '012-3456789', birthdate: Date.new(1990,1,1), job_title: 'Accountant', gender: 'male', about: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'])
User.create([name: 'Jim', email:'jim@jim.com', password:'jim', phone: '012-3456789', birthdate: Date.new(1990,1,1), job_title: 'Manager', gender: 'male', about: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'])
User.create([name: 'Yvonne', email:'yvonne@yvonne.com', password:'yvonne', phone: '012-3456789', birthdate: Date.new(1990,1,1), job_title: 'Manager', gender: 'female', about: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'])
User.create([name: 'Jean', email:'jean@jean.com', password:'jean', phone: '012-3456789', birthdate: Date.new(1990,1,1), job_title: 'Manager', gender: 'female', about: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'])
User.create([name: 'Ashley', email:'ashley@ashley.com', password:'ashley', phone: '012-3456789', birthdate: Date.new(1990,1,1), job_title: 'Clerk', gender: 'female', about: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'])
User.create([name: 'Alex', email:'alex@alex.com', password:'alex', phone: '012-3456789', birthdate: Date.new(1990,1,1), job_title: 'Accountant', gender: 'male', about: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'])
User.create([name: 'Keith', email:'keith@keith.com', password:'keith', phone: '012-3456789', birthdate: Date.new(1990,1,1), job_title: 'Doctor', gender: 'male', about: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'])

Project.create([name: 'Project Evalist', description: 'Group project making a peer review application for NEXT academy bootcamp', owner_id: 1, completed: false, deadline: DateTime.new(2018,7,13), budget: 5000])
project1 = Project.find(1)
project1.users << User.find(1)








