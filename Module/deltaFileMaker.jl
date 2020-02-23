include("../ModularFormsModuloTwo.jl")
using .ModularFormsModuloTwo
MFmod2 = ModularFormsModuloTwo
using JLD2, FileIO

# parameters
LENGTH = 10^6
MAXI = 10^3

# list
list = MFmod2.ModularFormOrNothingList(nothing, MAXI)

# D^2
d2 = MFmod2.delta_k(2, LENGTH)
 # 1st iteration
println("Calculating: ", "D^1")
d = MFmod2.delta(LENGTH)
list[2] = d
k = 1
# main loop
while k < MAXI-2
    global k, d, d2
    k += 2
    println("Calculating: ", "D^"*string(k))
    d *= d2
    list[k+1] = d
end


# final saving (standard naming)
@save joinpath(@__DIR__, "delta_q-"*"maxi"*string(MAXI)*"-"*"length"*string(LENGTH)*".jdl2") list
