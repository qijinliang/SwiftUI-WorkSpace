//: [Previous](@previous)
import SwiftUI
import WebKit
import MapKit
import PlaygroundSupport

struct ContentView : View {
    var body: some View {
        
        VStack() {
            Text("地图和加载网页")
                .font(.system(.title))
                .foregroundColor(Color.blue)
            MapView()
            WebViewPage()
        }
        .padding()
    }
}


struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 22.54587, longitude: 113.95198566)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct WebViewPage: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let url = URLRequest(url: URL(string: "https://www.baidu.com")!)
        uiView.load(url)
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
