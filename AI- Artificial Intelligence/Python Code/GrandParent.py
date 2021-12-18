print('---Grand Parent---')
tupleList=[('parent', 'Hasib', 'Rakib'),
            ('parent', 'Rakib', 'Rashid'),
            ('parent', 'Rakib', 'Rebeka'),
            ('parent', 'Rashid', 'Hasib'),]
X=str(input("Grandchildren:"))
print('Grandparent:', end=' ')
i=0
while(i<=len(tupleList)-1):
     if ((tupleList[i][0] == 'parent')&( tupleList[i][2] == X)):
         for j in range(4):
             if ((tupleList[j][0] == 'parent') & ( tupleList[i][1] == tupleList[j][2])):
                 print(tupleList[j][1], end=' ')
     i=i+1
