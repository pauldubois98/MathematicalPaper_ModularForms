def delta(LENGTH):
    f=[0 for i in range(LENGTH)]
    indice=1
    i=1
    while indice<LENGTH:
        f[indice] = 1
        i+=2
        indice = i**2
    return f

def square(f):
    f_sq = [0 for i in range(len(f))]
    i = 0
    while 2*i < len(f):
        if f[i]:
            f_sq[2*i] = 1
        i += 1
    return f_sq




if __name__=='__main__':
    #setting
    maxi = 8

    
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

