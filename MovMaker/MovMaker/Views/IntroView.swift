import SwiftUI
import WebKit

struct IntroView: View {
    @Environment(\.dismiss) private var dismiss

    let page: Page
    let user: User
    
    var body: some View {
        VStack(spacing: 24) {

            Text("Seja Bem-Vindo!")
                .foregroundColor(Color(
                    red: 0.95,
                    green: 0.7,
                    blue: 0.1
                ))
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity)
                .padding(.top, 24)

            Divider()
                .padding(.horizontal)

            Group {
                if let videoID = page.video {
                    VideoView(videoID: videoID)
                        .frame(height: 200)
                        .cornerRadius(10)
                } else {
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 200)
                            .cornerRadius(10)

                        Image(systemName: "play.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)

            VStack(alignment: .leading, spacing: 12) {
                Text(page.title ?? "No Title")
                    .font(.title)
                    .bold()

                Text(page.content ?? "No content")
                    .font(.body)
            }
            .foregroundColor(.black)
            .padding(.horizontal, 20)

            Spacer(minLength: 20)

            Button {
                setProgress()
            } label: {
                Text("Começar Módulo")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(Color(
                                red: 0.95,
                                green: 0.7,
                                blue: 0.1
                            ))
                    )
            }
            .padding(.horizontal)
            .padding(.bottom, 24)
            .disabled(user.progress >= page.id)
        }
    }

    func setProgress() {
        user.progress += 1
        dismiss()
    }
}

