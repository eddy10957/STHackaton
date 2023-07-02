//
//  ContentView.swift
//  STHackaton
//
//  Created by Edoardo Troianiello on 02/07/23.
//


import SwiftUI
import Charts

struct ContentView: View {
    
    @Environment(\.dismiss) var dismiss

    @StateObject var vm : ViewModel = ViewModel()
    @State var suggestion :  Suggestion? = nil
    var body: some View {
        
        VStack{
            ScrollView(showsIndicators: false) {
                GroupBox("Your Progress"){
                    Chart{
                        ForEach(vm.data.filter({$0.patient == "Normal Person"})) { data in
                            LineMark(
                                x: .value("Month", data.date),
                                y: .value("Steadiness", data.steadiness)
                            )
                            .foregroundStyle(by: .value("Patient", data.patient))
                            .interpolationMethod(.catmullRom)
                        }
                        
                        ForEach(vm.data.filter({$0.patient == "Prediction"
                        })) { data in
                            LineMark(
                                x: .value("Month", data.date),
                                y: .value("Steadiness", data.steadiness)
                            )
                            .foregroundStyle(Color.gray)
                            .foregroundStyle(by: .value("Patient", data.patient))
                            .lineStyle(StrokeStyle(lineWidth: 3,lineCap: .round, dash: [1,5]))
                            .interpolationMethod(.catmullRom)
                        }

                        
                        ForEach(vm.data.filter({$0.patient == "You"
                        })) { data in
                            LineMark(
                                x: .value("Month", data.date),
                                y: .value("Steadiness", data.steadiness)
                            )
                            .foregroundStyle(by: .value("Patient", data.patient))
                            .interpolationMethod(.catmullRom)
                        }
                        
                                    }
                    .chartForegroundStyleScale([
                        "Normal Person" : Color.blue,
                        "You" : Color.orange,
                        "Prediction" : Color.gray,
                    ])
                    .frame(height: 200)
                }
                GroupBox(label: Label("About your Rehab", systemImage: "figure.walk")){
                    Text("The progress chart is a visual representation of your walking rehab journey. It tracks your improvements over time, with the horizontal axis representing time and the vertical axis indicating your progress level. By consistently engaging in your rehabilitation exercises, the chart accurately reflects your evolving abilities and showcases milestones and assessments. It's important to embrace fluctuations and setbacks as part of the healing process. ")
                }
                
                ForEach(vm.suggestions){ suggestion in
                    VStack(alignment: .leading) {
                        suggestion.image
                            .resizable()
                            .scaledToFit()
                        Text(suggestion.title)
                            .bold()
                            .padding()
                    }
                    .cornerRadius(8)
                    .background {
                        Color(uiColor: .systemGray5)
                            .cornerRadius(8)
                    }
                    
//                    GroupBox(){
//                        VStack(alignment: .leading){
//                            suggestion.image
//                                .resizable()
//                                .scaledToFit()
//                                .cornerRadius(8)
//                            Text(suggestion.title)
//                                .bold()
//
//                        }
//
//                    }
                    .onTapGesture {
                        self.suggestion = suggestion
                    }
                }
                
            }
            .padding()
        }
        .sheet(item: $suggestion, content: { suggestion in
            ArticleView(suggestion: suggestion)
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    HStack {
                        Image(systemName: "chevron.left")
                    }
                    .foregroundColor(.white)
                })
            }
            ToolbarItem(placement: .principal) {
                Text("Walking Rehabilitation")
                    .foregroundColor(.white)
            }
        }
        .navigationBarBackButtonHidden(true)
        .modifier(ColoredNavBar())
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
