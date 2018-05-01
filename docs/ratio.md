```swift
let grid = UIView.gridLayoutView(items: [GridItem(rectangle1,
                                                          row: 0,
                                                          column: 0),
                                                 GridItem(rectangle2,
                                                          row: 0,
                                                          column: 1)],
                                         rowDefinitions: [RowDefinition()],
                                         columnDefinitions: [ColumnDefinition(ratio: 1),
                                                             ColumnDefinition(ratio: 2)])
```
![Sample 5](https://github.com/mihaimihaila/GridLayout/blob/master/GridLayout/Output/5.png "Sample 5")

```swift
let rectangle1 = buildRectangle(color: .blue)
let rectangle2 = buildRectangle(color: .red)

let grid = UIView.gridLayoutView(items: [GridItem(rectangle1,
                                                    row: 0,
                                                    column: 0),
                                            GridItem(rectangle2,
                                                    row: 1,
                                                    column: 0)],
                                    rowDefinitions: [RowDefinition(ratio: 1),
                                                    RowDefinition(ratio: 3)],
                                    columnDefinitions: [ColumnDefinition()])
```
![Sample](https://github.com/mihaimihaila/GridLayout/blob/master/GridLayout/Output/6.png "Sample")