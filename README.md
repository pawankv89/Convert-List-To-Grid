# Convert List To Grid Demo

=========

## Convert List To Grid Demo in Swift 5.

------------
Added Some screens here.

![](https://github.com/pawankv89/Convert-List-To-Grid/blob/master/images/screen_1.png)
![](https://github.com/pawankv89/Convert-List-To-Grid/blob/master/images/screen_2.png)
![](https://github.com/pawankv89/Convert-List-To-Grid/blob/master/images/screen_3.png)

## Usage
------------

####  Transition Demo

```swift


import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

let itemLists = ["Almond", "Anise", "Apricot", "Arrowroot", "Betel-nut", "Cantaloupe Seeds", "Cashew nut", "Chestnut", "Coconut", "Cudpahnut", "Currant", "Dates Dried", "Dates", "Fig", "Flax seeds", "Groundnuts, Peanuts,Lotus Seeds Pop,Gorgon Nut Puffed Kernel", "Nut, Walnuts", "Pine Nut", "Pistachio", "Prunes", "Pumpkin Seeds", "Saffron", "Sesame Seeds", "Sugar candy", "Watermelon Seeds"]

@IBOutlet weak var collectionView: UICollectionView!

//Default Set ListCell if Value is 1 other wise Show GridCell
var listType: CGFloat = 1

@IBAction func gridListButtonTap(_ sender: UIButton) {

switch sender.tag {
case 1:
//List
self.listType = 1
print("Default Button Called 1")
case 2:
//Grid
self.listType = 2
print("Default Button Called 2")
case 3:
//Grid
self.listType = 3
print("Default Button Called 3")
default:
//Default
print("Default Button Called")
}

//Reload List items
self.collectionView.reloadData()
}

override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view.

let listCellNib = UINib(nibName: GridCell.reuseIdentifier_ListCell, bundle: nil)
self.collectionView.register(listCellNib, forCellWithReuseIdentifier: GridCell.reuseIdentifier_ListCell)

let gridCellNib = UINib(nibName: GridCell.reuseIdentifier_GridCell, bundle: nil)
self.collectionView.register(gridCellNib, forCellWithReuseIdentifier: GridCell.reuseIdentifier_GridCell)

self.collectionView.backgroundColor = UIColor.clear

self.collectionView.delegate = self
self.collectionView.dataSource = self

//FlowLayout for Managed Grid and List
let layout = UICollectionViewFlowLayout()
layout.scrollDirection = .vertical //.horizontal
layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
layout.minimumLineSpacing = 5.0
layout.minimumInteritemSpacing = 5.0
self.collectionView.setCollectionViewLayout(layout, animated: true)

//Reload List items
self.collectionView.reloadData()
}
}

extension ViewController {

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

//For List & For Grid ( 1 -> List & 2 -> Grid)
let cellWidth: CGFloat = self.collectionView.frame.size.width / self.listType  - 10
let cellheight: CGFloat = 100
let cellSize = CGSize(width: cellWidth , height:cellheight)

return cellSize
}

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
return itemLists.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

if self.listType == 1 {

let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.reuseIdentifier_ListCell, for: indexPath as IndexPath) as! GridCell
self.configureCell(cell: cell, forIndexPath: indexPath)
return cell

} else {

let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.reuseIdentifier_GridCell, for: indexPath as IndexPath) as! GridCell
self.configureCell(cell: cell, forIndexPath: indexPath)
return cell
}
}

func configureCell(cell: GridCell, forIndexPath indexPath: IndexPath) {

let title = itemLists[indexPath.row]
cell.titleLabel.text = title

//Cell Corner Radius
cell.layer.borderColor = UIColor.lightGray.cgColor
cell.layer.borderWidth = 1
cell.layer.cornerRadius = 5

//ImageView Corner Radius
cell.userImageView.layer.borderColor = UIColor.lightGray.cgColor
cell.userImageView.layer.borderWidth = 1
cell.userImageView.layer.cornerRadius = 5

}


func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

print("didSelectItemAt:-\(indexPath.row)")

}
}




```

####  Custom Cell
```swift

import UIKit

class GridCell: UICollectionViewCell {

static var reuseIdentifier_GridCell: String = "GridCell"
static var reuseIdentifier_ListCell: String = "ListCell"

@IBOutlet weak var titleLabel: UILabel!
@IBOutlet weak var userImageView: UIImageView!

override func awakeFromNib() {
super.awakeFromNib()
// Initialization code
}

}


```





## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 
