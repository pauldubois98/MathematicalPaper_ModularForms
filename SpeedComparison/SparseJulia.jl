using SparseArrays: SparseVector, spzeros

function delta(LENGTH)
    f = spzeros(Int8, LENGTH)
    indice::Int = 2
    i::Int = 1
    while indice <= f.n
        f[indice] = Int8(1)
        i += 2
        indice = i^2 + 1
    end
    return f
end

function square(f)
    f_sq = spzeros(Int8, f.n)
    for n in f.nzind
        if 2n - 1 <= f_sq.n
            f_sq[2n - 1] = 1
        end
    end
    return f_sq
end







#heatup
println("Heating up...")
delta(1000)
square(delta(1000))
println("Hot !")


print("[")
for l in 0:6
    L = 10^l
    t = time_ns()
    delta(L)
    print((time_ns()-t)/10^9)
    print(", ")
end
println("]")

print("[")
for l in 0:6
    L = 10^l
    t = time_ns()
    square(delta(L))
    print((time_ns()-t)/10^9)
    print(", ")
end
println("]")

