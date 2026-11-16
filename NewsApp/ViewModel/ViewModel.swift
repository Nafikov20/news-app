import Foundation
import Combine

@MainActor
final class ViewModel: ObservableObject {
    
    //MARK: - Propreties
    @Published var topNews: [Article] = []
    @Published var bottomNews: [Article] = []
    
    
    //MARK: - Initializer
    init() {
        fetchTopNews()
        fetchBottomNews()
    }
    
    //MARK: - Methods
    func fetchTopNews() {
        Task {
            do{
                let articles = try await NetworkManager.shared.getNews(urlString: URLConstans.urlNews)
                topNews = articles.articles
            } catch {
                print(error)
            }
        }
    }
    func fetchBottomNews() {
        Task {
            do{
                let articles = try await NetworkManager.shared.getNews(urlString: URLConstans.bottomNewsUrl)
                bottomNews = articles.articles
            } catch {
                print(error)
            }
        }
    }
    
    
    
}

