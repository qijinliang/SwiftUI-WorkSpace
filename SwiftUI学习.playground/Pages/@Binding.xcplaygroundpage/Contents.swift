//: [Previous](@previous)

//#imageLiteral(resourceName: "车模1.jpg")
import SwiftUI
import PlaygroundSupport

struct Pokemon: Identifiable {
    let id : Int
    let name: String
    let type: String
    let color: Color
    let imageName: UIImage
}


struct ContentView: View {
    
    @State var pokemonList = [
        Pokemon(id: 0, name: "Charmander", type: "Fied", color: .red, imageName: #imageLiteral(resourceName: "head0.jpg")),
        Pokemon(id: 1, name: "Squirtle", type: "Water", color: .blue, imageName: #imageLiteral(resourceName: "head1.jpg")),
        Pokemon(id: 2, name: "Charmander", type: "Gress", color: .green, imageName: #imageLiteral(resourceName: "head3.jpg")),
        Pokemon(id: 3, name: "animal", type: "Electric", color: .orange, imageName: #imageLiteral(resourceName: "head4.jpg")),
        Pokemon(id: 4, name: "Jay", type: "Jerry", color: .gray, imageName: #imageLiteral(resourceName: "head5.jpg")),
        Pokemon(id: 5, name: "Bulabsuar", type: "Tom", color: .pink, imageName: #imageLiteral(resourceName: "head6.jpg")),
        Pokemon(id: 6, name: "Pikachu", type: "Panda", color: .yellow, imageName: #imageLiteral(resourceName: "head7.jpg")),
    ]
    
    @State var showDetail = true
    var body: some View {
        NavigationView {
            List(pokemonList) { pokemon in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(pokemon.name)
                        
                        if self.showDetail {
                            Image.init(uiImage: pokemon.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                        }

                    }
                    .padding()
            }
            .navigationBarTitle(Text("Pokemon"))
            .navigationBarItems(
                leading: ToggleTextButton(isOn: $showDetail),
                trailing: Button(
                    action: addPokemno,
                    label:{ Text("添加") }
                ).font(.system(size: 30))
            )
        }
    }
    
    func addPokemno() {
        if let randomPokemon = pokemonList.randomElement() {
            pokemonList.append(randomPokemon)
        }
    }
}

struct ToggleTextButton: View {
    @Binding var isOn: Bool
    var body: some View {
        Button(
            action: { self.isOn.toggle() },
            label: { Text(self.isOn ? "隐藏" : "显示") }
        ).font(.system(size: 30))
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
