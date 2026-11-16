
import SwiftUI

struct DetailView: View {
    
    let article: Article
    
    var body: some View {
        
        GeometryReader { screen in
            
            let avatarHeight = screen.size.height * 0.5
            
            ZStack(alignment: .topLeading){
                ScrollView(.vertical, showsIndicators: false) {
                    MainImageView(article: article, avatarHeight: avatarHeight)
                    
                    
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        if let title = article.title {
                            Text(title)
                                .titleFont()
                        }
                        
                        
                        if let description = article.description {
                            Text (description)
                                .descriptionFont()
                        }
                        Text(article.publishedAt.convertDate())
                            .descriptionFont ()
                    }
                    .padding()
                    .frame (maxWidth: .infinity, alignment: .leading)
                    .background (GradientAvatarView(avatarHeight: avatarHeight))
                }
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                
                BackButtonView()
                    .padding(.leading)
            }
        }
    }
}

struct GradientAvatarView: View {
    
    let avatarHeight: CGFloat
    
    var body: some View {
        
        GeometryReader { _ in
            
            LinearGradient(
                colors: [
                    Color(UIColor.systemBackground),
                    .clear
                ],
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(height: avatarHeight / 4)
            .offset(y: -avatarHeight / 4.4)
        }
    }
}

#Preview {
    DetailView(
        article: Article(
            author: "",
            title: "Example",
            description: "Example description",
            url: "",
            urlToImage: "https://picsum.photos/600/400",
            publishedAt: Date(),
            content: ""
        )
    )
}

