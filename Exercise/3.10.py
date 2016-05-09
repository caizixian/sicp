def make_withdraw(init_amount):
    def foo(balance):
        def bar(amount):
            nonlocal balance
            if (amount<=balance):
                balance-=amount
                return balance
            else:
                return "Insufficient funds"
        return bar
    return foo(init_amount)

acc1=make_withdraw(100)
acc2=make_withdraw(100)
