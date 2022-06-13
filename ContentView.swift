//
//  ContentView.swift
//  MoonShot
//
//  Created by Abe Nkum on 8/22/20.
//  Copyright © 2020 Nkum. All rights reserved.
//

import SwiftUI



struct ContentView: View {
 let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
 let missions: [Mission] = Bundle.main.decode("missions.json")
    // we tell swift what types mission & astronaut will here be since the Decodable file takes any type that can conform to Codable
    
    var body: some View {
  NavigationView {
      List(missions) { mission in //create list of missions w an image & txt
        NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) { // we placed the values the view asks for in the call
            
              Image(mission.image)
                  .resizable()
                  .scaledToFit()
                  .frame(width: 44, height: 44)

              VStack(alignment: .leading) { //text next to each image mission
                  Text(mission.displayName)
                      .font(.headline)
                Text(mission.formattedLaunchDate)
              }
          }
      }
      .navigationBarTitle("Moonshot")
  }
}
}
//we must create these

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
