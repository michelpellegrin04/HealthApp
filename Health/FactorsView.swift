import SwiftUI

struct FactorsView: View {
    
    @State private var showCircle = false
    @State private var selectedDate: Date = Date()
    @State private var selectedIndex: Int? = nil
    
    let calendar = Calendar.current
    let startDate = Date().addingTimeInterval(-86400 * 180)
    let endDate = Date().addingTimeInterval(86400 * 180)
    
    var body: some View {
        
        VStack {
            Text("\(formattedDate(date: selectedDate))")
                .font(.title2)
                .bold()
                .padding()
            Divider()
            Image(systemName: "arrowtriangle.down.fill")
                .accessibilityHidden(true)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(Array(generateDates().enumerated()), id: \.1) { index, date in
                        VStack {
                            Text(dayOfWeekInitial(from: date))
                                .accessibilityLabel("Double tap to add period on  \(dayOfWeekInitialAccesibility(from: date))")
                                .font(.headline)
                                .foregroundColor(isToday(date: date) ? Color.white : Color.gray)
                                .padding(5)
                                .onTapGesture {
                                    self.selectedDate = date
                                    self.selectedIndex = index
                                }
                                .background(
                                    Circle()
                                        .fill(isToday(date: date) ? Color.black : Color.clear)
                                )
                            ZStack{
                                Color.gray.opacity(0.2)
                                    .clipShape(RoundedRectangle(cornerRadius: 70))
                                    .frame(width: 40, height: 60)
                                    
                                    
                                if showCircle && selectedIndex == index {
                                    Circle()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.red.opacity(0.6))
                                        .padding(.bottom, 20)
                                }
                                
                            }
                            .onTapGesture {
                                withAnimation {
                                    showCircle.toggle()
                                }
                            }
                            
                        }
                        .padding(3)
                    }
                }
            }
            //.padding()
            
            
        }
    }
    
    func generateDates() -> [Date] {
        var dates: [Date] = []
        var currentDate = startDate
        
        while currentDate <= endDate {
            dates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        return dates
    }
    
    func isSelected(date: Date) -> Bool {
        return calendar.isDate(date, inSameDayAs: selectedDate)
    }
    
    func getDayOfMonth(date: Date) -> String {
        let dayOfMonth = calendar.component(.day, from: date)
        return "\(dayOfMonth)"
    }
    
    func getMonthOfYear(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM-EEE"
        return formatter.string(from: date)
    }
    
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM dd"
        //formatter.dateStyle = .full
        return formatter.string(from: date)
    }
}

private func isToday(date: Date) -> Bool {
    return Calendar.current.isDateInToday(date)
}

func dayOfWeekInitial(from date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "E"
    return String(dateFormatter.string(from: date).prefix(1))
}

func dayOfWeekInitialAccesibility(from date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, MMMM dd"
    return String(dateFormatter.string(from: date))
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FactorsView()
    }
}
