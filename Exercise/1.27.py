def expmod(base,exp,m):
    if exp==0:
        return 1
    elif exp%2==0:
        return expmod(base,exp/2,m)**2%m
    else:
        return expmod(base,exp-1,m)*base%m

def test_carmichael(n):
    for x in range(2,n):
        if expmod(x,n,n)!=x:
            print("Fail")
            return
    print("Pass")
    return

"""
>>> test_carmichael(561)
Pass
>>> test_carmichael(1105)
Pass
>>> test_carmichael(1729)
Pass
>>> test_carmichael(2465)
Pass
>>> test_carmichael(2821)
Pass
>>> test_carmichael(6601)
Pass
"""