# SKCustomTBCell
自定义cell的高度
## 根据加载的内容不同 显示不同高度的cell
### 
tableview 加载的时候会先执行estimateHeight 这个方法，在estimate这个方法中先给一个预计的高度，  
再在heightForRow中给出实际的高度。
cell的高度 要根据cell 中具体的内容计算出来，在cell 中创建一个cellHeight 的属性，每一个cell 内部有一个cellHeight 的属性，
在setmodel 中进行计算控件的高度，从而计算出cell的高度。
在VC中加载的时候，  
取出一个cell对应的cellHeight，进行创建cell。  
![aa](https://github.com/AlexanderYeah/SKCustomTBCell/blob/master/SKTBCustomCellHeightDemo/demo.jpg)
