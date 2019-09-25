Items can fil a container by using the `stretch` alignment for both horizontal and vertical alignment.

```swift
let rectangle = UIView(frame: .zero)
rectangle.translatesAutoresizingMaskIntoConstraints = false
rectangle.backgroundColor = .blue

let grid = UIView.gridLayoutView(items: [[GridItem(rectangle, 
                                                   horizontalAlignment: .stretch, 
                                                   verticalAlignment: .stretch, 
                                                   margin: UIEdgeInsets(top: 20, left: 10, bottom: 30, right: 50))]],
                                rows: [.fill],
                                columns: [.fill],
                                width: 90,
                                height: 90)
```
![Sample](https://github.com/mihaimihaila/GridLayout/blob/master/GridLayout/Output/11.png "Sample")