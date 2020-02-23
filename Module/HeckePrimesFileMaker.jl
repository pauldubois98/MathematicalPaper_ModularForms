include("../ModularFormsModuloTwo.jl")
using .ModularFormsModuloTwo
MFmod2 = ModularFormsModuloTwo
using JLD2, FileIO
using Primes

# parameters
MAXI = 10^2
LENGTH = 10^6

# binary read
precalculated = MFmod2.loadFormListBinary(MAXI, LENGTH)

# parameters
MAX_DELTA = length(precalculated)
MAX_PRIME = 10^4

# list
list = Array{Union{MFmod2.ModularFormOrNothingList, Nothing}, 1}(nothing, MAX_PRIME)





for p in Primes.primes(3, MAX_PRIME) #avoid prime 2
    print("Calculating: T", p, "| ")
    l = MFmod2.ModularFormOrNothingList(nothing, MAX_DELTA)
    for k in 1:2:MAX_DELTA-2
        print("D^", k, " ")
        f = MFmod2.delta_k(k, LENGTH)
        Tf = MFmod2.Hecke(p, f)
        dTf = MFmod2.to_delta(Tf, precalculated)
        l[k+1] = dTf
    end
    println()
    list[p] = l
end


# final saving (standard naming)
@save joinpath(@__DIR__, "Hecke_primes-"*"max_prime"*string(MAX_PRIME)*"-"*"max_delta"*string(MAX_DELTA)*".jdl2") list
