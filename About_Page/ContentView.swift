import SwiftUI
import Foundation

// MARK: - Design Tokens

private enum DS {
    static let corner: CGFloat = 16
    static let headerCorner: CGFloat = 24
    static let cardStrokeOpacity: CGFloat = 0.10
    static let shadow = Color.black.opacity(0.06)
    static let sectionSpacing: CGFloat = 28
    static let horizontalPadding: CGFloat = 22
    static let accent: Color = .indigo
}

// MARK: - Root

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(.systemBackground), DS.accent.opacity(0.1)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: DS.sectionSpacing) {
                ProfileHeaderView(
                    name: "Yu Shan",
                    avatarImageName: "avatar"
                )

                    SectionTitleView(title: "Education", systemIcon: "graduationcap")
                    EducationCardView(
                        school: "National Taiwan University",
                        department: "Department of Biomechatronics Engineering",
                        duration: "2022 – 2026",
                        highlights: [
                            "Artificial Intelligence",
                            "Mechatronics Control",
                            "Mechanical Design",
                            "Biological Processes"
                        ]
                    )

                    SectionTitleView(title: "Skills", systemIcon: "hammer")
                    SkillsFourGridView(categories: [
                        SkillCategory(
                            title: "Programming Languages",
                            items: ["Python", "C++", "Swift"]
                        ),
                        SkillCategory(
                            title: "Programming Strengths",
                            items: ["PyTorch", "scikit-learn", "OpenCV", "Pandas", "NumPy", "Matplotlib"]
                        ),
                        SkillCategory(
                            title: "Hardware & IoT",
                            items: ["Raspberry Pi", "Arduino", "MQTT", "Sensor Integration"]
                        ),
                        SkillCategory(
                            title: "Engineering & Design",
                            items: ["SolidWorks", "Mechatronics Control"]
                        )
                    ])

                    // Project Experience Section
                    SectionTitleView(title: "Project Experience", systemIcon: "folder.fill")
                    ProjectsCarouselView(
                        projects: [
                            ProjectCard(
                                title: "Automated Rose Monitoring (DL Growth Stage)",
                                icon: "leaf.fill",
                                accent: .pink,
                                date: "2024-2025",
                                url: URL(string: "https://drive.google.com/file/d/1TESf7QHeG-PSU9sxITfUgbp76_mrwlpo/view?usp=sharing")!,
                                grade: "113-114"
                            ),
                            ProjectCard(
                                title: "SwiftUI Ice Cream Shop Game App",
                                icon: "birthday.cake.fill",
                                accent: .orange,
                                date: "Sep. 2025",
                                url: URL(string: "https://github.com/yu3333333333/create_my_first_app_with_swiftUI")!,
                                linkLabel: "GitHub >",
                                grade: "114-1"
                            ),
                            ProjectCard(
                                title: "Iris Recognition Challenge",
                                icon: "eye",
                                accent: .teal,
                                date: "Jun. 2025",
                                url: URL(string: "https://drive.google.com/file/d/1TESf7QHeG-PSU9sxITfUgbp76_mrwlpo/view?usp=sharing")!,
                                grade: "113-2"
                            ),
                            ProjectCard(
                                title: "Triathlon Robot",
                                icon: "figure.run",
                                accent: .green,
                                date: "Jun. 2025",
                                url: URL(string: "https://drive.google.com/file/d/1TESf7QHeG-PSU9sxITfUgbp76_mrwlpo/view?usp=sharing")!,
                                grade: "113-2"
                            ),
                            ProjectCard(
                                title: "Bridge and Gearbox Design",
                                icon: "wrench.and.screwdriver",
                                accent: .gray,
                                date: "April. 2025",
                                url: URL(string: "https://drive.google.com/file/d/1TESf7QHeG-PSU9sxITfUgbp76_mrwlpo/view?usp=sharing")!,
                                grade: "113-2"
                            ),
                            ProjectCard(
                                title: "Food Monopoly (LLM Interactive Game)",
                                icon: "gamecontroller",
                                accent: .purple,
                                date: "Dec. 2024",
                                url: URL(string: "https://github.com/yu3333333333/food_monopoly")!,
                                linkLabel: "GitHub >",
                                grade: "113-1"
                            ),
                            ProjectCard(
                                title: "NeRF-Based 3D Reconstruction (Agri Vehicle)",
                                icon: "cube",
                                accent: .blue,
                                date: "Nov. 2024",
                                url: URL(string: "https://drive.google.com/file/d/1TESf7QHeG-PSU9sxITfUgbp76_mrwlpo/view?usp=sharing")!,
                                grade: "113-1"
                            ),
                            ProjectCard(
                                title: "Sensor Failure Alert with Line Bot",
                                icon: "bell.badge",
                                accent: .red,
                                date: "July. 2024",
                                url: URL(string: "https://drive.google.com/file/d/1TESf7QHeG-PSU9sxITfUgbp76_mrwlpo/view?usp=sharing")!,
                                linkLabel: "YouTube >",
                                grade: "112-2"
                            ),
                            ProjectCard(
                                title: "AVR Autonomous Line-Tracking Vehicle",
                                icon: "car.fill",
                                accent: .indigo,
                                date: "May. 2023",
                                url: URL(string: "https://drive.google.com/file/d/1TESf7QHeG-PSU9sxITfUgbp76_mrwlpo/view?usp=sharing")!,
                                grade: "111-2"
                            ),
                            ProjectCard(
                                title: "Smart Lighting Control (Plant Factory)",
                                icon: "lightbulb",
                                accent: .yellow,
                                date: "Dec. 2022",
                                url: URL(string: "https://drive.google.com/file/d/1TESf7QHeG-PSU9sxITfUgbp76_mrwlpo/view?usp=sharing")!,
                                grade: "111-1"
                            )
                        ]
                    )

                    SectionTitleView(title: "Contact", systemIcon: "paperplane")
                    ContactCardView(
                        email: "b11611001@ntu.edu.tw",
                        labwebsite: "https://ntubimessl.wixsite.com/ntussl",
                        location: "Taipei, Taiwan"
                    )
                }
                .padding(.horizontal, DS.horizontalPadding)
                .padding(.vertical, 28)
            }
        }
    }
}

// MARK: - Header

struct ProfileHeaderView: View {
    let name: String
    let avatarImageName: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: DS.headerCorner, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [DS.accent.opacity(0.15), Color(.systemBackground)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: DS.headerCorner, style: .continuous)
                        .strokeBorder(Color.primary.opacity(DS.cardStrokeOpacity), lineWidth: 1)
                )
                .shadow(color: DS.shadow, radius: 12, x: 0, y: 8)

            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .center, spacing: 50) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(name)
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .tracking(0.5)
                            .lineLimit(1)
                            .minimumScaleFactor(0.95)

                        Text("iOS Developer • SwiftUI • Robotics")
                            .font(.subheadline.weight(.medium))
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .layoutPriority(1)

                    // 頭像
                    ZStack {
                        Circle()
                            .fill(DS.accent.opacity(0.12))
                            .frame(width: 126, height: 126)
                            .offset(x: 6, y: 8)
                        AvatarView(imageName: avatarImageName, size: 116)
                            .overlay(
                                Circle()
                                    .stroke(
                                        LinearGradient(
                                            colors: [DS.accent.opacity(0.6), .clear],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 3
                                    )
                            )
                    }
                }

                // 重點領域膠囊標籤
                HStack(spacing: 10) {
                    PillTag(text: "SwiftUI")
                    PillTag(text: "iOS")
                    PillTag(text: "Robotics")
                    PillTag(text: "AI/ML")
                }
                .offset(x:30, y: 10)

                // 社群圖示列
                HStack(spacing: 10) {
                    SocialIconLink(systemIcon: "globe", url: URL(string: "https://medium.com/@yu33")!)
                    SocialIconLink(systemIcon: "f.cursive.circle.fill", url: URL(string: "https://faebook.com")!)
                    SocialIconLink(systemIcon: "play.rectangle.fill", url: URL(string: "https://youtube.com")!)
                }
                .offset(x:110, y:10)
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

// 小膠囊標籤
private struct PillTag: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.caption2.weight(.semibold))
            .padding(.vertical, 6)
            .padding(.horizontal, 10)
            .background(Capsule().fill(DS.accent.opacity(0.10)))
            .foregroundStyle(DS.accent)
    }
}

// 社群圓形圖示連結
private struct SocialIconLink: View {
    let systemIcon: String
    let url: URL

    var body: some View {
        Link(destination: url) {
            ZStack {
                Image(systemName: systemIcon)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(DS.accent)
            }
        }
        .buttonStyle(.plain)
        .accessibilityLabel(Text(systemIcon))
    }
}

struct AvatarView: View {
    let imageName: String
    let size: CGFloat

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.10), radius: 10, x: 0, y: 8)
            .accessibilityLabel(Text("Profile photo"))
    }
}

// MARK: - Section Title

struct SectionTitleView: View {
    let title: String
    let systemIcon: String

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 2)
                .fill(DS.accent)
                .frame(width: 4, height: 24)

            HStack(spacing: 8) {
                Image(systemName: systemIcon)
                    .foregroundStyle(DS.accent)
                Text(title.uppercased())
                    .font(.footnote.weight(.semibold))
                    .tracking(1.0)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding(.top, 4)
        .accessibilityElement(children: .combine)
    }
}

// MARK: - Education

struct EducationCardView: View {
    let school: String
    let department: String
    let duration: String
    let highlights: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 12) {
                Image(systemName: "graduationcap.fill")
                    .font(.title3)
                    .foregroundStyle(DS.accent)

                VStack(alignment: .leading, spacing: 4) {
                    Text(school)
                        .font(.headline)
                    Text(department)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(duration)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()
            }

            VStack(alignment: .leading, spacing: 8) {
                ForEach(highlights, id: \.self) { item in
                    HStack(spacing: 8) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.teal)
                            .font(.footnote)
                        Text(item)
                            .font(.subheadline)
                    }
                }
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: DS.corner, style: .continuous)
                .fill(Color(.systemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: DS.corner, style: .continuous)
                .strokeBorder(Color.primary.opacity(DS.cardStrokeOpacity), lineWidth: 1)
        )
        .shadow(color: DS.shadow, radius: 6, x: 0, y: 4)
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Skills

struct SkillCategory: Identifiable {
    let id = UUID()
    let title: String
    let items: [String]
}

struct SkillsFourGridView: View {
    let categories: [SkillCategory]

    // 確保剛好 4 個（不足補空、過多取前 4）
    private var normalized: [SkillCategory] {
        var arr = categories
        if arr.count < 4 {
            arr.append(contentsOf: Array(repeating: SkillCategory(title: "", items: []), count: 4 - arr.count))
        } else if arr.count > 4 {
            arr = Array(arr.prefix(4))
        }
        return arr
    }

    var body: some View {
        ZStack {
            // 中間分隔線（垂直 + 水平）
            GeometryReader { geo in
                let midX = geo.size.width / 2
                let midY = geo.size.height / 2
                Path { p in
                    // 垂直線
                    p.move(to: CGPoint(x: midX, y: 0))
                    p.addLine(to: CGPoint(x: midX, y: geo.size.height))
                    // 水平線
                    p.move(to: CGPoint(x: 0, y: midY))
                    p.addLine(to: CGPoint(x: geo.size.width, y: midY))
                }
                .stroke(Color.primary.opacity(DS.cardStrokeOpacity), style: StrokeStyle(lineWidth: 1))
            }
            .allowsHitTesting(false)

            // 內容四等分
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    SkillQuadrantTileView(category: normalized[0])
                    SkillQuadrantTileView(category: normalized[1])
                }
                HStack(spacing: 0) {
                    SkillQuadrantTileView(category: normalized[2])
                    SkillQuadrantTileView(category: normalized[3])
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: DS.corner, style: .continuous)
                .fill(Color(.systemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: DS.corner, style: .continuous)
                .strokeBorder(Color.primary.opacity(DS.cardStrokeOpacity), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: DS.corner, style: .continuous))
        .shadow(color: DS.shadow, radius: 6, x: 0, y: 4)
        .frame(maxWidth: .infinity)
        .aspectRatio(1, contentMode: .fit)
    }
}

private struct SkillQuadrantTileView: View {
    let category: SkillCategory

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if !category.title.isEmpty {
                Text(category.title.uppercased())
                    .font(.callout.weight(.semibold))
                    .tracking(0.8)
                    .foregroundStyle(.secondary)

                Text(category.items.joined(separator: ", "))
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(.primary)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .offset(y:10)
            }
            Spacer(minLength: 0)
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

// MARK: - Projects

struct ProjectCard: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let accent: Color
    let date: String
    let url: URL
    var linkLabel: String = "more >"
    var grade: String
}

struct ProjectCardView: View {
    let project: ProjectCard

    static let width: CGFloat = 280
    static let height: CGFloat = 220

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header band with accent gradient and big icon
            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [project.accent.opacity(0.25), project.accent.opacity(0.10)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(height: 72)
                Image(systemName: project.icon)
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundStyle(project.accent)
            }

            Text(project.title)
                .font(.subheadline.weight(.semibold))
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)

            Text(project.date)
                .font(.caption)
                .foregroundStyle(.secondary)

            Spacer(minLength: 0)

            HStack {
                Spacer()
                Link(project.linkLabel, destination: project.url)
                    .font(.caption2.weight(.semibold))
                    .foregroundStyle(project.accent)
                    .buttonStyle(.plain)
            }
        }
        .padding(16)
        .frame(width: ProjectCardView.width, height: ProjectCardView.height, alignment: .topLeading)
        .background(
            RoundedRectangle(cornerRadius: DS.corner, style: .continuous)
                .fill(Color(.systemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: DS.corner, style: .continuous)
                .strokeBorder(Color.primary.opacity(DS.cardStrokeOpacity), lineWidth: 1)
        )
        .shadow(color: DS.shadow, radius: 6, x: 0, y: 4)
    }
}

struct ProjectsCarouselView: View {
    let projects: [ProjectCard]

    private let cardWidth: CGFloat = ProjectCardView.width
    private let cardHeight: CGFloat = ProjectCardView.height
    private let spacing: CGFloat = 16
    private let leftPadding: CGFloat = 2

    var body: some View {
        GeometryReader { outer in
            ScrollView(.horizontal, showsIndicators: false) {
                // 用 ZStack 讓時間線和卡片同一個內容寬度，會一起滑動
                ZStack(alignment: .topLeading) {
                    // 時間線圖層
                    TimelineOverlay(
                        projects: projects,
                        cardWidth: cardWidth,
                        spacing: spacing,
                        leftPadding: leftPadding
                    )

                    // 卡片圖層（帶縮放效果）
                    LazyHStack(spacing: spacing) {
                        ForEach(projects) { p in
                            GeometryReader { itemGeo in
                                let screenCenterX = outer.frame(in: .global).midX
                                let itemCenterX = itemGeo.frame(in: .global).midX
                                let distance = abs(itemCenterX - screenCenterX)

                                // 控制縮放的距離範圍與插值
                                let maxDistance = (outer.size.width / 2) + cardWidth
                                let clamped = min(distance / maxDistance, 1)
                                let scale = 0.92 + (1 - clamped) * 0.18 // 0.92 ~ 1.10
                                let extraShadow: CGFloat = (1 - clamped) * 8

                                ProjectCardView(project: p)
                                    .scaleEffect(scale)
                                    .shadow(color: DS.shadow, radius: 6 + extraShadow, x: 0, y: 4 + extraShadow / 2)
                                    .zIndex(Double(1 - clamped))
                                    .animation(.spring(response: 0.35, dampingFraction: 0.85), value: clamped)
                            }
                            .frame(width: cardWidth, height: cardHeight)
                        }
                    }
                    .padding(.horizontal, leftPadding)
                    .padding(.top, 4)
                    .padding(.bottom, 44)
                }
                .frame(width: contentWidth, alignment: .topLeading)
            }
        }
        .frame(height: cardHeight + 90)
    }

    private var contentWidth: CGFloat {
        CGFloat(projects.count) * cardWidth + CGFloat(max(projects.count - 1, 0)) * spacing + leftPadding * 2
    }
}

// 時間線
private struct TimelineOverlay: View {
    let projects: [ProjectCard]
    let cardWidth: CGFloat
    let spacing: CGFloat
    let leftPadding: CGFloat

    private let lineHeight: CGFloat = 2
    private let tickHeight: CGFloat = 8
    private let timelineBottomInset: CGFloat = 26

    var body: some View {
        GeometryReader { geo in
            let y = geo.size.height - timelineBottomInset

            ZStack(alignment: .topLeading) {
                // 主時間線
                Path { p in
                    p.move(to: CGPoint(x: 0, y: y))
                    p.addLine(to: CGPoint(x: geo.size.width, y: y))
                }
                .stroke(Color.secondary.opacity(0.35), style: StrokeStyle(lineWidth: lineHeight, lineCap: .round))

                // 刻度與年級標籤
                ForEach(projects.indices, id: \.self) { idx in
                    let centerX = leftPadding + CGFloat(idx) * (cardWidth + spacing) + cardWidth / 2

                    Rectangle()
                        .fill(Color.secondary.opacity(0.6))
                        .frame(width: 2, height: tickHeight)
                        .position(x: centerX, y: y - tickHeight / 2)
                    
                    Text(projects[idx].grade)
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                        .position(x: centerX, y: y + 10)
                }
            }
        }
        .allowsHitTesting(false)
    }
}

// MARK: - Contact

struct ContactCardView: View {
    let email: String
    let labwebsite: String
    let location: String

    var body: some View {
        VStack(spacing: 12) {
            EmailRowView(email: email)
            Divider().opacity(0.22)
            InfoRowView(icon: "globe", title: "Lab Website", value: labwebsite, urlString: labwebsite)
            Divider().opacity(0.22)
            InfoRowView(icon: "mappin.and.ellipse", title: "Location", value: location, urlString: nil)
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: DS.corner, style: .continuous)
                .fill(Color(.systemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: DS.corner, style: .continuous)
                .strokeBorder(Color.primary.opacity(DS.cardStrokeOpacity), lineWidth: 1)
        )
        .shadow(color: DS.shadow, radius: 6, x: 0, y: 4)
    }
}

// 開啟 Gmail 網頁並預填收件者
struct EmailRowView: View {
    let email: String
    @Environment(\.openURL) private var openURL

    var body: some View {
        Button(action: openGmailWebCompose) {
            HStack(spacing: 12) {
                Image(systemName: "envelope.fill")
                    .font(.title3)
                    .foregroundStyle(DS.accent)
                    .frame(width: 28)

                VStack(alignment: .leading, spacing: 2) {
                    Text("EMAIL")
                        .font(.caption.weight(.semibold))
                        .tracking(0.8)
                        .foregroundStyle(.secondary)

                    HStack(spacing: 6) {
                        Text(email)
                            .font(.subheadline.weight(.medium))
                        Image(systemName: "arrow.up.right")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                Spacer()
            }
            .padding(.vertical, 4)
        }
        .buttonStyle(.plain)
        .accessibilityLabel(Text("Send email to \(email)"))
    }

    private func openGmailWebCompose() {
        let allowed = CharacterSet.urlQueryAllowed
        let to = email.addingPercentEncoding(withAllowedCharacters: allowed) ?? email

        // Gmail Web Compose
        if let gmailWeb = URL(string: "https://mail.google.com/mail/?view=cm&fs=1&to=\(to)") {
            openURL(gmailWeb)
        }
    }
}

struct InfoRowView: View {
    let icon: String
    let title: String
    let value: String
    let urlString: String?

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(DS.accent)
                .frame(width: 28)

            VStack(alignment: .leading, spacing: 2) {
                Text(title.uppercased())
                    .font(.caption.weight(.semibold))
                    .tracking(0.8)
                    .foregroundStyle(.secondary)

                if let urlString, let url = URL(string: urlString) {
                    Link(destination: url) {
                        HStack(spacing: 6) {
                            Text(value)
                                .font(.subheadline.weight(.medium))
                            Image(systemName: "arrow.up.right")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .buttonStyle(.plain)
                } else {
                    Text(value)
                        .font(.subheadline.weight(.medium))
                }
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
}
