Items can span rows and columns. When spanning across rows and column, a virtual row or column is created based on the span rules.
```swift
let rectangle1 = buildRectangle(color: .blue)
let rectangle2 = buildRectangle(color: .red)
let rectangle3 = buildRectangle(color: .green)
let rectangle4 = buildRectangle(color: .magenta)

let rectangle5 = UIView(frame: .zero)
rectangle5.translatesAutoresizingMaskIntoConstraints = false
rectangle5.backgroundColor = .purple

let grid = UIView.gridLayoutView(items: [GridItem(rectangle5,
                                                 position: Position(columnSpan: 2),
                                                 horizontalAlignment: .stretch,
                                                 verticalAlignment: .stretch),
                                         GridItem(rectangle1, row: 0, column: 0),
                                         GridItem(rectangle2, row: 0, column: 1),
                                         GridItem(rectangle3, row: 1, column: 0),
                                         GridItem(rectangle4, row: 1, column: 1)],
                                 rows: [.auto, .auto],
                                 columns: [.auto, .auto])
                                        
```
In this example `rectangle5` spans 2 columns, while being placed by default at row: 0 and column: 0. This means a virtual column is created with the properties of column starting at 0 and ending at 1. By stretching `rectangle5` both horizontally and vertically, the precise positioning within the grid can be observed.

![Sample](https://github.com/mihaimihaila/GridLayout/blob/master/Output/9.png "Sample")

#### Notice

In this example we placed more than one item in the grid at the same row and column. This is an accepted behavior and the Z order corresponds to the order the index of the `GridItem` in the `items` collection. 
`rectangle5` appears below `rectangle1` and `rectangle2` because it appears first in the `items` collection.
If `rectangle1` and `rectangle2` were to overlap, `rectangle1` would appear below `rectangle2`.