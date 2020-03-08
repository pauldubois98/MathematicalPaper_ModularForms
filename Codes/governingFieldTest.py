# DATA
primes1, primes0, primes_undefined = a_ij(i,j)

#init frob lists
frobenius0 = list()
frobenius1 = list()

#fill 1-primes frob elements
for p in primes1:
    #load element
    F_p = frobenius_of_prime(p, file)
    # we add it to the list of 0-primes frob
    found=False
    for F in frobenius1:
        if same_conjugacy_classes(F_p, F, conjugacy_classes):
            found=True
            break
    if found:
        pass
    else:
        frobenius1.append(F_p)

#fill 0-primes frob elements
for p in primes0:
    #load element
    F_p = frobenius_of_prime(p, file)
    # check it is not conjugate to a frob of a 1-prime
    found=False
    for F in frobenius1:
        if same_conjugacy_classes(F_p, F, conjugacy_classes):
            found=True
            break
    if found:
        # if it is, there is a problem for this prime
        print(p, ": wrong conjugacy class")
    else:
        # if not, we add it to the list of 0-primes frob
        found=False
        for F in frobenius0:
            if same_conjugacy_classes(F_p, F, conjugacy_classes):
                found=True
                break
        if found:
            pass
        else:
            frobenius0.append(F_p)


print("Frobenius classes:")
print(frobenius0)
print(frobenius1)
