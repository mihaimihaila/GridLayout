Columns and rows can also occupy *at most* the size of the largest item they contain.
These kinds of column and rows are referred to as *auto*.

```swift
let rectangle1 = buildRectangle(color: .blue)
let rectangle2 = buildRectangle(color: .red)

let grid = UIView.gridLayoutView(items: [GridItem(rectangle1, row: 0, column: 0),
                                         GridItem(rectangle2, row: 1, column: 0)],
                                 rows: [.auto, .fill],
                                 columns: [.auto])
```
In this example the first row is *auto* while the the second one is not. This means the first row will fit the space required by `rectangle1`, while the second row will fill the remaining space.

![Sample](https://github.com/mihaimihaila/GridLayout/blob/master/Output/7.png "Sample")

```swift
let rectangle1 = buildRectangle(color: .blue)
let rectangle2 = buildRectangle(color: .red)

let grid = UIView.gridLayoutView(items: [GridItem(rectangle1, row: 0, column: 0),
                                         GridItem(rectangle2, row: 0, column: 1)],
                                 rows: [.auto],
                                 columns: [.fill, .auto])
```
In this example the second column is *auto* while the the first one is not. This means the second column will fit the space required by `rectangle2`, while the first column will fill the remaining space.

![Sample](https://github.com/mihaimihaila/GridLayout/blob/master/Output/8.png "Sample")