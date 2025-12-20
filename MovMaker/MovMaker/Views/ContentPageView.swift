//
//  ClassView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 24/11/25.
//

import SwiftUI
import SwiftData

struct ContentPageView: View {
    @Environment(\.dismiss) private var dismiss

    let page: Page
    let user: User
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("Tarefa do dia")
                    .foregroundColor(Color(
                        red: 0.95,
                        green: 0.7,
                        blue: 0.1
                    ))
                    .font(.title)
                    .bold()
                
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
                    .padding(.horizontal)
                
                Spacer()
                
                ZStack {
                    Color(
                        red: 0.95,
                        green: 0.7,
                        blue: 0.1
                    ).opacity(0.1)
                    
                    VStack(spacing: 10) {
                        Text("Seu desáfio de hoje")
                            .font(.title3)
                            .foregroundColor(Color(
                                red: 0.95,
                                green: 0.7,
                                blue: 0.1
                            ))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal,30)
                        
                        Text(page.content ?? "No Content")
                            .foregroundColor(Color(
                                red: 0.95,
                                green: 0.7,
                                blue: 0.1
                            ))
                            .padding(.horizontal, 30)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 250)
                .cornerRadius(10)
                .padding(.horizontal, 30)
                
                VStack{
                    Image(page.photo ?? "No Content")                 
                        .resizable()
                        .frame(maxWidth: .infinity, minHeight: 250)
                        .clipped()
                        .padding(10)
                    
                    Spacer()
                    
                    Text("Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado o")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .foregroundColor(Color(
                            red: 0.95,
                            green: 0.5,
                            blue: 0.1
                        ))
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 30)
                
                
                Button(action: setProgress) {
                    Text("Marcar Como Concluído")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(
                            red: 0.95,
                            green: 0.7,
                            blue: 0.1
                        ))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal, 30)
                }
                .disabled(user.progress >= page.id)
                .padding(.bottom, 20)
            }
        }
    }
    
    func setProgress() {
        user.progress += 1
        dismiss()
    }
}






#Preview {
    let pages: [Page] = Bundle.main.decode("pages.json")

    let container = try! ModelContainer(for: User.self)
    let context = container.mainContext

    let user = User(
        name: "Elias",
        email: "elias@email.com",
        age: 99,
        password: "123456"
    )

    context.insert(user)

    return ContentPageView(
        page: pages[1],
        user: user
    )
    .modelContainer(container)
}

