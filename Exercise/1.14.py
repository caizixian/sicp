def cc(amount, kinds_of_coins,depth):
    print("cc({}, {}, {})".format(amount,kinds_of_coins,depth))
    if amount==0:
        return 1
    elif amount<0 or kinds_of_coins==0:
        return 0
    else:
        return cc(amount,kinds_of_coins-1,depth+1)+cc(amount-first_denomination[kinds_of_coins],kinds_of_coins,depth+1)

first_denomination=[None,1,5,10,25,50]
cc(11,5,1)

#space amount->O(n)
#time kinds_of_coins->O(n^5)