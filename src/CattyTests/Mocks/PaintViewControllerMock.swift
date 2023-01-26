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

@testable import Pocket_Code

class PaintViewControllerMock: PaintViewController {
    var manager: UndoManager!
    var mirrorRotationZoomTool: MirrorRotationZoomTool!

    let navigationControllerMock: UINavigationController

    override var navigationController: UINavigationController? { navigationControllerMock }

    init?(editingImage: UIImage, navigationController: UINavigationController) {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(requiringSecureCoding: false)
        archiver.encode(data)
        archiver.finishEncoding()
        let coder = try? NSKeyedUnarchiver(forReadingFrom: archiver.encodedData)

        self.navigationControllerMock = navigationController

        super.init(coder: coder!)

        manager = UndoManager.init(drawViewCanvas: self)
        mirrorRotationZoomTool = MirrorRotationZoomTool.init(drawViewCanvas: self)

        self.editingImage = editingImage
        self.helper = UIView()
        self.drawView = PaintImageView(frame: .zero, image: nil)
        self.saveView = PaintImageView(frame: .zero, image: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
