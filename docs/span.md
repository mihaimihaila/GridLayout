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
                                            GridItem(rectangle1,
                                                    row: 0,
                                                    column: 0),
                                            GridItem(rectangle2,
                                                    row: 0,
                                                    column: 1),
                                            GridItem(rectangle3,
                                                    row: 1,
                                                    column: 0),
                                            GridItem(rectangle4,
                                                    row: 1,
                                                    column: 1)],
                                    rowDefinitions: [RowDefinition(),
                                                    RowDefinition()],
                                    columnDefinitions: [ColumnDefinition(),
                                                        ColumnDefinition()])
```
![Sample](https://github.com/mihaimihaila/GridLayout/blob/master/GridLayout/Output/9.png "Sample")