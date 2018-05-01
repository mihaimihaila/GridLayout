```swift
let rectangle1 = buildRectangle(color: .blue)
let rectangle2 = buildRectangle(color: .red)
let rectangle3 = buildRectangle(color: .green)
let rectangle4 = buildRectangle(color: .magenta)

let grid = UIView.gridLayoutView(items: [GridItem(rectangle1,
                                                    row: 0,
                                                    column: 0,
                                                    verticalAlignment: .top),
                                            GridItem(rectangle2,
                                                    row: 0,
                                                    column: 1),
                                            GridItem(rectangle3,
                                                    row: 1,
                                                    column: 0),
                                            GridItem(rectangle4,
                                                    row: 1,
                                                    column: 1,
                                                    horizontalAlignment: .right)],
                                    rowDefinitions: [RowDefinition(),
                                                    RowDefinition()],
                                    columnDefinitions: [ColumnDefinition(),
                                                        ColumnDefinition()])
```
![Sample](https://github.com/mihaimihaila/GridLayout/blob/master/GridLayout/Output/10.png "Sample")