tupleList1=[('parent', 'Rashid', 'Hasib'),
             ('parent', 'Rashid', 'Kamal'),
             ('parent', 'Hasib', 'Rakib'),
             ('parent', 'Hasib', 'Jessica'),
             ('parent', 'Rakib', 'Rebeka'),
             ('parent', 'Rakib', 'Sohel'),
             ('parent', 'Jessica', 'Farin'),
             ('parent', 'Jessica', 'Nishat')]
Male=['Rashid', 'Hasib', 'Kamal', 'Rakib', 'Sohel']

#Brother
print('---Brother---')
X=input("Brother of: ")
print('Brother:', end=' ')
gender=0
i=0
while(i<=len(tupleList1)-1):
 if ((tupleList1[i][0] == 'parent')&(tupleList1[i][2] == X)):
     for j in range(len(tupleList1)):
         if ((tupleList1[j][0] == 'parent')&(tupleList1[i][1] == tupleList1[j][1]) & (tupleList1[i][2] != tupleList1[j][2])):
 
             for k in Male: 
                 if(tupleList1[j][2] == k):
                     print(tupleList1[j][2], end=' ')
                     gender=1
                 if(gender == 0):
                     pass 
 
 i=i+1
print('\n')

#Sister
print('---Sister---')
X=str(input("Sister of: "))
print('Sister:', end=' ')
gender=0 
i=0
while(i<=len(tupleList1)-1):
 if ((tupleList1[i][0] == 'parent')&(tupleList1[i][2] == X)):
     for j in range(len(tupleList1)):
         if ((tupleList1[j][0] == 'parent')&(tupleList1[i][1] == tupleList1[j][1]) & (tupleList1[i][2] != tupleList1[j][2])):
 
             for k in Male: 
                 if(tupleList1[j][2] == k):
                     gender=1
             if(gender==0):
                print(tupleList1[j][2], end=' ')
 
 i=i+1
print('\n')


#Uncle
print('---Uncle---')
X=input("Uncle of: ")
print('Uncle:', end=' ')
gender=0

i=0
while(i<=len(tupleList1)-1):
 if ((tupleList1[i][0] == 'parent')&(tupleList1[i][2] == X)):
     for j in range(len(tupleList1)):
         if ((tupleList1[j][0] == 'parent')&(tupleList1[i][1] == tupleList1[j][2])):
             for l in range(len(tupleList1)):
                 if( (tupleList1[l][0] == 'parent') & (tupleList1[j][1] == tupleList1[l][1]) & (tupleList1[j][2] != tupleList1[l][2])):
                     for k in Male: 
                         if(tupleList1[l][2] == k):
                             print(tupleList1[l][2], end=' ')
                             gender=1
                         if(gender==0):
                             pass
 
 i=i+1
print('\n')


#Aunt
print('---Aunty---')
X=input("Aunty of: ")
print('Aunt:', end=' ')
gender=0 #
i=0
while(i<=len(tupleList1)-1):
 if ((tupleList1[i][0] == 'parent')&(tupleList1[i][2] == X)):
     for j in range(len(tupleList1)):
         if ((tupleList1[j][0] == 'parent')&(tupleList1[i][1] == tupleList1[j][2])):
             for l in range(len(tupleList1)):
                 if( (tupleList1[l][0] == 'parent') & (tupleList1[j][1] == tupleList1[l][1]) & (tupleList1[j][2] != tupleList1[l][2])):
                     for k in Male: 
                         if(tupleList1[l][2] == k):
                             gender=1
                     if(gender==0):
                        print(tupleList1[l][2], end=' ')
 i=i+1
print('\n')
