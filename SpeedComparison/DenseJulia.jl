function delta(LENGTH)
    f = zeros(Int8, LENGTH)
    indice = 2
    i = 1
    while indice < LENGTH
        f[indice] = 1
        i += 2
        indice = i^2 + 1
    end
    return f
end

function square(f)
    f_sq = zeros(Int8, length(f))
    i = 1
    while 2 * i - 1 < length(f)
        if f[i] == 1
            f_sq[2 * i - 1] = 1
        end
        i += 1
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

