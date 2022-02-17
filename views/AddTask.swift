//
//  AddTask.swift
//  ToDoList
//
//  Created by Perennial Macbook on 17/02/22.
//

import SwiftUI

    struct AddTask: View {
                
        @Environment(\.presentationMode) var presentationMode
        @EnvironmentObject var taskViewModel: TaskViewModel
        @State var textFieldText: String = ""
        @State var decsFieldText: String = ""
        @State var alertTitle: String = ""
        @State var animate: Bool = false
        let secondaryAccentColor = Color("SecondaryAccentColor")
        @State var showAlert: Bool = false
                
        var body: some View {
            ScrollView {
                VStack {
                    TextField("Type something here...", text: $textFieldText)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                    
                    TextField("task description...", text: $decsFieldText)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                    
                    Button(action: saveButtonPressed, label: {
                        Text("Add Task".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                            
                            .shadow(
                                color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                                radius: animate ? 20 : 10,
                                x: 0,
                                y: animate ? 50 : 30)
                    })
                }
                .padding(14)
            }
            .navigationTitle("Add new task 🖊")
            .font(.callout)
            .alert(isPresented: $showAlert, content: getAlert)
        }
        
        // MARK: FUNCTIONS
        
        func saveButtonPressed() {
            if textIsAppropriate() {
                taskViewModel.addTask(title: textFieldText, decs: decsFieldText )
                presentationMode.wrappedValue.dismiss()
            }
        }
        
        func textIsAppropriate() -> Bool {
            if textFieldText.count < 3 {
                alertTitle = "Your new todo item must be at least 3 characters long!!! 😨😰😱"
                showAlert.toggle()
                return false
            }
            return true
        }
        
        func getAlert() -> Alert {
            return Alert(title: Text(alertTitle))
        }
    }

    struct AddTask_preview: PreviewProvider {
        static var previews: some View {
            Group {
                NavigationView {
                    AddTask()
                }
                .preferredColorScheme(.light)
                .environmentObject(TaskViewModel())
                NavigationView {
                    AddTask()
                }
                .preferredColorScheme(.dark)
                .environmentObject(TaskViewModel())

            }
        }
    }


