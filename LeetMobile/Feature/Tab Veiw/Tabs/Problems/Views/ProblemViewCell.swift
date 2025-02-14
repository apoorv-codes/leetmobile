//
//  ProblemViewCell.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 1/11/25.
//
import UIKit
import SwiftUI
import Combine

final class ProblemCell: UITableViewCell {
    static let identifier = "ProblemCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(question: Question) {
        self.contentConfiguration = UIHostingConfiguration {
            ProblemCellContent(question: question)
        }
        .margins(.horizontal, 16)
        .margins(.vertical, 8)
    }
}


struct ProblemCellContent: View {
    // MARK: Properties
    let question: Question?
    
    var tagsOverlay: some View {
        LinearGradient(stops: [
            .init(color: .clear, location: 0.0),
            .init(color: .background, location: 0.01),
            .init(color: .background, location: 0.95),
            .init(color: .clear, location: 1.0)
        ], startPoint: .leading, endPoint: .trailing)
    }
    
    // MARK: Body
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                Text(question?.title ?? "")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                
                if let topicTags = question?.topicTags {
                    ScrollView(.horizontal) {
                        HStack(spacing: 4) {
                            Tags(tags: topicTags)
                        }
                        .padding(.leading, 2)
                        .padding(.trailing, 12)
                    }
                    .scrollIndicators(.hidden)
                    .mask(tagsOverlay)
                }
                
                
            }
            VStack(alignment: .trailing, spacing: 4) {
                Text("\(question?.difficulty?.rawValue ?? "") \(Int(question?.acRate ?? .zero))%")
                    .font(.system(size: 12, weight: .regular, design: .rounded))
                    .foregroundStyle(question?.difficulty?.color ?? .white)
                Image(systemName: "command")
                    .scaledToFit()
                    .frame(width: 24, height: 24, alignment: .center)
                    .padding(4)
            }
        }
    }
    
    // MARK: Helper Method
    @ViewBuilder
    func Tags(tags: [TopicTag]) -> some View {
        ForEach(tags) { topic in
            Text(topic.name ?? "")
                .font(.system(size: 12, weight: .semibold, design: .rounded))
                .foregroundStyle(Color.white)
                .padding(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                .background {
                    Color.accent.opacity(0.5)
                        .overlay{
                            Capsule()
                                .stroke(style: .init(lineWidth: 1))
                                .fill(Color.accent.opacity(0.8))
                        }
                }
                .clipShape(.capsule)
                .fixedSize()
        }
    }
}
