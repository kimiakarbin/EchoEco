// View/WelcomeScreenView.swift
import SwiftUI

struct WelcomeScreenView: View {
    var body: some View {
        NavigationStack {
            ZStack {
               
              
                
                VStack(spacing: 20) {
                    Text("EchoEco")
                        .font(.custom("Chalkboard SE", size: 36))
                        .foregroundColor(Color.blue)
                        .padding(.top, 100)
                    
                    Text("explore words, save worlds")
                        .font(.custom("Chalkboard SE", size: 20))
                        .foregroundColor(Color.blue)
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 200)
                    
                    NavigationLink(destination: StoryScreenView()) {
                        Text("Start Adventure")
                            .frame(width: 150, height: 150)
                            .font(.custom("Chalkboard SE", size: 20))
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.pastelYellow)
                            .cornerRadius(75)
                    }
                    .padding(.top, 20)
                }
            }
        }
    }
}
