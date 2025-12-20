//
//  TaskView.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 24/11/25.
//



import SwiftUI
import SwiftData

struct ActivityView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showCongratsView: Bool = false
    @State private var downloader = FileDownloader()
    let page: Page
    let user: User
    var body: some View {
            VStack {
                
                Text("Última Aula")
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
                
                Image(page.photo ?? "no photo")
                    .resizable()
                    .frame(maxWidth: .infinity, minHeight: 300)
                    .clipped()
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                Text(page.info ?? "no content")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                
                Text("Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e o")
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                
                Spacer()
                
                VStack(spacing: 15) {
                    Button(action: download ) {
                        Text("Baixar Atividade")
                            .font(.title2)
                            .foregroundStyle(Color(red: 0.95, green: 0.7, blue: 0.1))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .border(Color(red: 0.95, green: 0.7, blue: 0.1))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                    
                    Button(action: setProgress) {
                        Text("Marcar como Concluído")
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(
                                red: 0.95,
                                green: 0.7,
                                blue: 0.1
                            ))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(
                                        red: 0.95,
                                        green: 0.7,
                                        blue: 0.1
                                    ) , lineWidth: 3)
                            )
                            .padding(.horizontal)
                    }
                    .disabled(user.progress >= page.id)
                    
                }
                .padding(.bottom, 20)
            }
        
        }
       
    func setProgress(){
        user.progress += 1
        dismiss()
    }
func download(){
    let url = URL(string: "")!
    downloader.download(from: url, filename: "")
    }
    
}

#Preview{
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
    
    return ActivityView(page: pages[7], user: user)
        .modelContainer(container)
}



