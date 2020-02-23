"""
Routines for Hecke operators on modular forms mod 2
"""



"""
    Hecke(p, f)

Compute Tp|f (with mathematical accuracy).

# Example
```julia-repl
julia> d=delta()
julia> disp(d)
MF mod 2 (coef to 1000) - 01000000010000000000000001000000000000000000000001...

julia> disp(Hecke(2, d))
MF mod 2 (coef to 500) - 00100000000000000010000000000000000000000000000000...

julia> disp(Hecke(3, d))
MF mod 2 (coef to 333) - 00000000000000000000000000000000000000000000000000...
```
"""
function Hecke(p::Int, f::ModularForm)::ModularForm
    Tpf = spzeros(Int8, f.n÷p)
    i::Int = 0
    while i+1 <= Tpf.n
        if i % p == 0
            Tpf[i+1] = (f[i*p+1] + f[div(i, p)+1]) % 2
        else
            Tpf[i+1] = f[i*p+1]
        end
        i += 1
    end
    return Tpf
end
