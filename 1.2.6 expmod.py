# xy%m = (x%m)(y%m)%m

def remainder(a,b):
    print("{}%{}".format(a,b))
    return a%b

def expmod(base,exp,m):
    print("expmod({}, {}, {})".format(base,exp,m))
    if exp==0:
        return 1
    elif exp%2==0:
        return remainder(expmod(base,exp/2,m)**2, m)
    else:
        return remainder(expmod(base,exp-1,m)*base,m)