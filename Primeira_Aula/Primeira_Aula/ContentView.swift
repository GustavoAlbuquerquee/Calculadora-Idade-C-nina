import SwiftUI

struct ContentView: View {
    
    @State private var HumanAge: String = ""
    @State private var DogAge: String = ""
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(systemName: "pawprint.fill")
                    .imageScale(.large)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                
                Text("Calculadora de idade canina")
                    .font(.title)
                    .foregroundColor(.white)

                TextField(
                    "Digite a idade humana aqui!",
                    text: $HumanAge
                )
                .frame(width: 250)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .padding()
                
                Button(action: calculateDogAge) {
                    Text("Calcular Idade Canina")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                }
                .padding(.top)
                
                if !DogAge.isEmpty {
                    Text("Idade do cachorro: \(DogAge) anos")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.top)
                }
            }
            .padding()
        }
    }
    
    func calculateDogAge() {
        guard let humanAge = Int(HumanAge), humanAge > 0 else {
            DogAge = "Por favor, insira uma idade válida."
            return
        }
        
        let dogAge: Int
        if humanAge == 1 {
            dogAge = 15
        } else if humanAge == 2 {
            dogAge = 24
        } else {
            dogAge = 24 + (humanAge - 2) * 5
        }
        
        DogAge = "\(dogAge)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
