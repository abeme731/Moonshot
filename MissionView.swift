//
//  MissionView.swift
//  MoonShot
//
//  Created by Abe Nkum on 8/24/20.
//  Copyright © 2020 Nkum. All rights reserved.
//

import Foundation
import SwiftUI

struct MissionView: View {
 

    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }// this creates an item that pairs astronaut which has id, name, & description with their role for this specific mission
    
       let mission: Mission
    let astronauts: [CrewMember]
    
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image) //gives us the image of row chosen
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)

                    Text(self.mission.formattedLaunchDate) //Challenge #1
                    
                    Text(self.mission.description)  // also provides us w/ the description of each mission based on which row is picked
                        .padding()

                    ForEach(self.astronauts, id: \.role) { crewMember in
                        
                        NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)) {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                
                                .frame(width: 83, height: 60)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.primary, lineWidth: 1))

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    .buttonStyle(PlainButtonStyle ())
                    }
                    
                    
                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }

    init(mission: Mission,astronauts: [Astronaut]) {
        self.mission = mission
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name}){
                
                matches.append(CrewMember(role: member.role, astronaut: match))
                
            }else{
                fatalError("Missing \(member)")
            }
        }
        self.astronauts = matches
    } //how we decide which astronauts to display
}




struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
    }
}
