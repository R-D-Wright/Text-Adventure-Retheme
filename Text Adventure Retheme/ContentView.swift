//
//  ContentView.swift
//  TriviaGame
//
//  Created by Drake Wright on 3/22/23
//

import SwiftUI
struct ContentView: View {
    
    // STATE VARIBLES
    @State var message = "Click the START GAME button to begin"
    
    // State variables used to display options/answers for user to select
    @State var optionOne = ""
    @State var optionTwo = ""
    @State var optionThree = ""
    @State var optionFour = ""
    
    @State var buttonText = "START GAME"
    
    // State value used to determine which question to display
    @State var qIndex = -1
    
    // State value used to keep track of user's score
    @State var score = 0
    
    let questions = [
        "Who was the first president of the United States",
        "This Persons Assasination led to WW1",
        "Name of the incident in which US oil reserves were being sold off?",
        "Which pope began the traditions of crusade?",
        "Which Explorer first landed on North America?",
        "Who was the last 'viking king'",
        "The notable German Mercenary who invented the 'Swabian Salute'?",
        "The Sacking of which city finalized the fall of the Byazntine Empire?",
        "Where is Christopher Columbus from?"
        
    ]
    
   
    let answers = [
        [
            ["George Washington", "correct"],
            ["John Fortnite", "wrong"],
            ["Thomas Jefferson", "wrong"],
            ["King George III", "wrong"]
        ],
        [
            ["Hitler", "wrong"],
            ["paul the baby puncher", "You should be ashamed for picking this"],
            ["Nicholas II", "wrong"],
            ["Archduke Franz Ferdinand", "correct"]
        ],
        [
            ["Black Gold Scandal", "wrong"],
            ["Teapot Dome Scandal", "correct"],
            ["Runaway Reserves", "wrong"],
            ["Elk Hills Scandal", "wrong"]
        ],
        [
            ["Poper Augustus", "wrong"],
            ["Pope Alexander", "wrong"],
            ["Pope Urban II", "correct"],
            ["Pope Trajan", "wrong"]
        ],
        [
            ["Ferdinand Magellan", "wrong"],
            ["Christopher Columbus", "wrong"],
            ["Leif Erikson", "correct"],
            ["Juan Ponce De Leon", "wrong"]
        ],
        [
            ["Harald Hardrada", "correct"],
            ["Erik the Red", "wrong"],
            ["Bjorn Ironside", "wrong"],
            ["Gunnar Hamundarson", "wrong"]
        ],
        [
            ["Jasper Hanebuth", "wrong"],
            ["Herrmann Rudolf Wendroth", "wrong"],
            ["Gottfried Von Berlichingen", "correct"],
            ["Peter Hagendorf", "wrong"]
        ],
        [
            ["Istanbul", "wrong"],
            ["Constantinople", "correct"],
            ["Rome", "wrong"],
            ["Jerusalem", "wrong"]
        ],
        [
            ["London, England", "wrong"],
            ["Genoa, Italy", "correct"],
            ["Paris, France", "wrong"],
            ["Castille, Spain", "wrong"]
        ]

        
    ]
    
    func hideOptions(){
        optionOne = ""
        optionTwo = ""
        optionThree = ""
        optionFour = ""
    }
    func nextQuestion(){
        if (qIndex < questions.count - 1){
            qIndex += 1
            message = questions[qIndex]
            optionOne = answers[qIndex][0][0]
            optionTwo = answers[qIndex][1][0]
            optionThree = answers[qIndex][2][0]
            optionFour = answers[qIndex][3][0]
            buttonText = "NEXT QUESTION"
        } else {
            // Displays final score to user
            message = "Game Over. You got " + String(score) + " correct."
            buttonText = "GAME OVER"
            hideOptions()
        }
        
    }
    
    // Function used to check if user's guess is correct or not. The "a" parameter is used to determine which option was selected.
    // Also, the function adds a point to the user's score for each correct answer
    func checkAnswer(a: Int){
        if (answers[qIndex][a][1] == "correct"){
            message = "CORRECT!!!"
            score += 1
        } else {
            message = "Sorry wrong answer"
        }
        
        hideOptions()
    }
    
    var body: some View {
        ZStack{
            Color.red.ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("INCREASINGLY DIFFICULT TRIVIA GAME")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                // Using the "message" state variable to update the message displayed to the user
                Text(message)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        checkAnswer(a: 0)
                    } label: {
                        // Using the "optionOne" state variable to update the option displayed to the user
                        Text(optionOne)
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 150.0)
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                    
                    Button {
                        checkAnswer(a: 1)
                    } label: {
                        // Using the "optionTwo" state variable to update the option displayed to the user
                        Text(optionTwo)
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 150.0)
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        checkAnswer(a: 2)
                    } label: {
                        // Using the "optionThree" state variable to update the option displayed to the user
                        Text(optionThree)
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 150.0)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    
                    Button {
                        checkAnswer(a: 3)
                    } label: {
                        // Using the "optionFour" state variable to update the option displayed to the user
                        Text(optionFour)
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 150.0)
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
                
                Spacer()
                
                Button {
                    nextQuestion()
                } label: {
                    // Using the "buttonText" state variable to update the text in the button displayed to the user
                    Text(buttonText)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                        .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/7/*@END_MENU_TOKEN@*/)
                        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
