Today's objective: Use SceneKit to create a grid of red cubes on a white background layed out along the x & y plane.

![Grid of red squares](embed%20images/Grid%20of%20red%20squares.png)

I assume I will do this with a nested for loop. Something like...

```
for row in 0...numberOfRows {
    for column in 0...numberOfColumns {
        createCell(x: row * rowHight, y: column * columnHight)
    }
}
```
