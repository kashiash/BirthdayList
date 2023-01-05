//
//  BirthdayListView.swift
//  BirthdayList
//
//  Created by DevTechie on 1/1/23.
//

import SwiftUI

struct BirthdayListView: View {
    
    @StateObject var birthdayVM = BirthdayListViewModel()
    @State private var addNewPresented = false
    
    var header: some View {
        VStack {
            Text("🎂 Birthday 🎂")
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(Rectangle().fill(Color.clear))
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    header
                        .padding(.top, 10)
                    Button(action: {addNewPresented.toggle()}) {
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .padding([.trailing, .bottom], 20)
                    .fullScreenCover(isPresented: $addNewPresented) {
                        AddNewBirthdayView().onDisappear {
                            refreshData()
                        }
                        .background(BackgroundClearView())
                    }
                }
                
                List {
                    ForEach(birthdayVM.birthdays.indices, id: \.self) { idx in
                        ZStack {
                            BirthdayCell(birthdayVM: birthdayVM.birthdays[idx])
                                .shadow(radius: 10)
                            
                            NavigationLink(destination: UpdateBirthdayView(birthdayVM: birthdayVM.birthdays[idx]).onDisappear { refreshData() }) {
                                EmptyView()
                            }
                            .opacity(0.0)
                        }
                    }
                    .onDelete(perform: delete(at:))
                    .listRowBackground(Color.clear)
                    .listStyle(.plain)
                }
            }
            .onAppear {
                refreshData()
            }
            .background(
                LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .scrollContentBackground(.hidden)
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        }
        .edgesIgnoringSafeArea(.all)
        .preferredColorScheme(.dark)
    }
    
    func refreshData() {
        birthdayVM.fetchAllBirthdays()
    }
    
    func delete(at offsets: IndexSet) {
        for index in offsets {
            birthdayVM.removeBirthday(at: index)
        }
    }
}

struct BirthdayListView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayListView()
    }
}
