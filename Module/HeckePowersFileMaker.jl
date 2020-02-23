include("../ModularFormsModuloTwo.jl")
using .ModularFormsModuloTwo
MFmod2 = ModularFormsModuloTwo
using JLD2, FileIO
using Primes

# parameters
MAXI = 10^3
LENGTH = 10^6

# binary read
precalculated = MFmod2.loadFormListBinary(MAXI, LENGTH)

# parameters
MAX_DELTA = length(precalculated)
MAX_POWER = 20

# list
list = Array{Union{MFmod2.ModularFormOrNothingList, Nothing}, 2}(nothing, MAX_POWER, MAX_POWER)



for i in 1:MAX_POWER
    for j in 1:MAX_POWER
        print("Calculating: T3^", i-1, "T5^", j-1, "| ")
        l = MFmod2.ModularFormOrNothingList(nothing, MAX_DELTA)
        # use previous calculations
        if i == 1
            if j == 1
                for k in 1:2:MAX_DELTA-2
                    print("D^", k, " ")
                    df = MFmod2.Delta_k(k, MAX_DELTA)
                    l[k+1] = df
                end
            else
                for k in 1:2:MAX_DELTA-2
                    print("D^", k, " ")
                    df = list[i,j-1][k+1]
                    f = MFmod2.to_q(df, precalculated)
                    T5f = MFmod2.Hecke(5, f)
                    dT5f = MFmod2.to_delta(T5f, precalculated)
                    l[k+1] = dT5f
                end
            end
        else
            for k in 1:2:MAX_DELTA-2
                print("D^", k, " ")
                df = list[i-1,j][k+1]
                f = MFmod2.to_q(df, precalculated)
                T3f = MFmod2.Hecke(3, f)
                dT3f = MFmod2.to_delta(T3f, precalculated)
                l[k+1] = dT3f
            end
        end
        println()
        # save
        list[i,j] = l
    end
end



# final saving (standard naming)
@save joinpath(@__DIR__, "Hecke_powers-"*"max_power"*string(MAX_POWER)*"-"*"max_delta"*string(MAX_DELTA)*".jdl2") list
