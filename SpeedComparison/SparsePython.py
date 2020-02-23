def delta(LENGTH):
    f = []
    indice = 1
    i = 1
    while indice < LENGTH:
        f.append(indice)
        i += 2
        indice = i**2
    return (f, LENGTH)

def square(form):
    f_sq = []
    f = form[0]
    for n in f:
        if 2*n-1 <= form[1]:
            f_sq.append(2*n-1)
    return (f_sq, form[1])







if __name__=='__main__':
    #setting
    maxi = 6


    print("Heating up...")
    import timeit, time

    time.sleep(0.5)
    #heatup
    delta(100)
    square(delta(100))

    print("Hot !")

    print('[', end='')
    for l in range(maxi):
        L = 10**l
        print(timeit.timeit(lambda: delta(L)), end=', ')
    print(']')

    print('[', end='')
    for l in range(maxi):
        L = 10**l
        print(timeit.timeit(lambda: square(delta(L))), end=', ')
    print(']')

