/*

 Card View 'da "Label - LengthIMınutes" çıkarken biz buradaki sırlamaayı değiştirdik.
 Bu sayede rakamlar ekranın ortasına gelmiş oldu

 */


import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

    extension LabelStyle where Self == TrailingIconLabelStyle {
        static var trailingIcon: Self { Self() }
}
