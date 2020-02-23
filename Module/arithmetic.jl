"""
We can represent a modular forms mod 2 by it's coefficients as a polynomial in q or D.
The routines in this file are made for q-series.
"""





### ARITHMETIC OPERATIONS of modular forms modulo 2
"""
    +(f1, f2)

Compute the addition of two modular forms (with mathematical accuracy).

# Example
```julia-repl
[f1 & f2 are modular forms mod 2]
julia> f1+f2
1000-element SparseVector{Int8,Int64} with 27 stored entries:
  [...]
```
"""
function +(f1::ModularForm, f2::ModularForm)::ModularForm
    m = min(f1.n, f2.n)
    f = truncate(f1, m)
    for n in f2.nzind
        if n<=m
            f[n] = 1-f[n]
        end
    end
    return dropzeros!(f)
end

"""
    *(f1, f2)

Compute the multiplication of two modular forms (with mathematical accuracy).

# Example
```julia-repl
[f1 & f2 are modular forms mod 2]
julia> f1*f2
1000-element SparseVector{Int8,Int64} with 86 stored entries:
  [...]
```
"""
function *(f1::ModularForm, f2::ModularForm)::ModularForm
    n::Int = min(f1.n, f2.n)
    f = spzeros(Int8, n)
    for n in f1.nzind
        for m in f2.nzind
            if n+m-1 <= f.n
                f[n+m-1]=1-f[n+m-1]
            else
                break
            end
        end
    end
    return dropzeros!(f)
end

"""
    sq(f)

Compute the square of a modular form (with mathematical accuracy).

This is a much more effcient method then computing the square with multiplication.
sq(f) is (much) more effcient then f*f, time wise and memory wise.

# Example
```julia-repl
[f is a modular form mod 2]
julia> @time f*f
  0.169466 seconds (37 allocations: 1.127 MiB)

julia> @time sq(f)
  0.000020 seconds (23 allocations: 9.875 KiB)
```
"""
function sq(f::ModularForm)::ModularForm
    f_sq = spzeros(Int8, f.n)
    for n in f.nzind
        if 2n-1 <= f_sq.n
            f_sq[2n-1] = 1
        end
    end
    return f_sq
end

"""
    ^(f, k)

Compute f^k (with mathematical accuracy).

# Example
```julia-repl
[f is a modular form mod 2]
julia> f^5
1000-element SparseVector{Int8,Int64} with 75 stored entries:
  [...]
```
"""
function ^(f::ModularForm, k::Int)::ModularForm
    # we use binary decomposition of k for effciency
    f_pow=one(f.n)
    while k != 0
        if k&1 != 0
            f_pow *= f
        end
        f = sq(f)
        k >>= 1
    end
    return f_pow
end
