import SwiftUI

struct NetflixFilterCell: View {
    
    var title: String = "Categories"
    var isDropdown: Bool = true
    var isSelected: Bool = false
    var options: [String] = []
    @State private var isExpanded: Bool = false
    @State private var selectedOption: String? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 4) {
                Text(title)
                
                if isDropdown {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                ZStack {
                    Capsule(style: .circular)
                        .fill(.netflixDarkGray)
                        .opacity(isSelected ? 1 : 0)
                    
                    Capsule(style: .circular)
                        .stroke(lineWidth: 1)
                }
            )
            .foregroundStyle(.netflixLightGray)
            .onTapGesture {
                if isDropdown {
                    isExpanded.toggle()
                }
            }
            
            if isExpanded {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(options, id: \.self) { option in
                        Text(option)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.netflixDarkGray)
                            .foregroundStyle(.netflixLightGray)
                            .onTapGesture {
                                selectedOption = option
                                isExpanded = false
                            }
                    }
                }
                .background(Color.netflixBlack)
                .cornerRadius(8)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        NetflixFilterCell(
            title: "Categories",
            isDropdown: true,
            isSelected: false,
            options: ["Action", "Comedy", "Drama"]
        )
    }
}