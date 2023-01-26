/**
 *  Copyright (C) 2010-2023 The Catrobat Team
 *  (http://developer.catrobat.org/credits)
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Affero General Public License as
 *  published by the Free Software Foundation, either version 3 of the
 *  License, or (at your option) any later version.
 *
 *  An additional term exception under section 7 of the GNU Affero
 *  General Public License, version 3, is available at
 *  (http://developer.catrobat.org/license_additional_term)
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU Affero General Public License for more details.
 *
 *  You should have received a copy of the GNU Affero General Public License
 *  along with this program.  If not, see http://www.gnu.org/licenses/.
 */

import Foundation

@objc(WhenConditionScriptCell)
class WhenConditionScriptCell: BrickCell, BrickCellProtocol {

    public var expressionTextField: UITextField?
    public var leftTextLabel: UILabel?
    public var rightTextLabel: UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    static func cellHeight() -> CGFloat {
        UIDefines.brickHeightControl1h
    }

    override func brickShapeType() -> kBrickShapeType {
        kBrickShapeType.brickShapeRoundedSmall
    }

    override func hookUpSubViews(_ inlineViewSubViews: [Any]!) {
        self.leftTextLabel = inlineViewSubViews[0] as? UILabel
        self.expressionTextField = inlineViewSubViews[1] as? UITextField
        self.rightTextLabel = inlineViewSubViews[2] as? UILabel
    }

    func brickTitle(forBackground isBackground: Bool, andInsertionScreen isInsertion: Bool) -> String! {
        kLocalizedWhen.appending(" %@".appending(kLocalizedBecomesTrue))
    }

    override func parameters() -> [String] {
        ["{FLOAT;range=(-inf,inf)}"]
    }
}
