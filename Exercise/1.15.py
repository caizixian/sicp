def mysin(x,depth):
    print("sin({}, {})".format(x,depth))
    if abs(x)<0.1:
        return x
    else:
        value=mysin(x/3,depth+1)
        return 3*value-4*value**3

print(mysin(12.15,1))

#space: log n
#time: log n