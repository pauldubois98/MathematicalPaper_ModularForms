"""
This file contains routines to generete standard modular forms mod 2.
Essentialy, this is 0 form, 1 form, and powers of D.
"""



"""
    zero([LENGTH])

Create a zero form of length LENGTH

# Example
```julia-repl
julia> zero()
1000-element SparseVector{Int8,Int64} with 0 stored entries

julia> zero(1)
1-element SparseVector{Int8,Int64} with 0 stored entries
```
"""
function zero(LENGTH::Int=10^3)::ModularForm
    return spzeros(Int8, LENGTH)
end

"""
    one([LENGTH])

Create a one form of length LENGTH

# Example
```julia-repl
julia> one()
1000-element SparseVector{Int8,Int64} with 1 stored entry:
  [1   ]  =  1

julia> one(1)
1-element SparseVector{Int8,Int64} with 1 stored entry:
  [1]  =  1
```
"""
function one(LENGTH::Int=10^3)::ModularForm
    f = spzeros(Int8, LENGTH)
    f[1] = 1
    return f
end

"""
    delta([LENGTH])

Create the standard D form, with coefficients up to LENGTH
=> as a D-series!

# Example
```julia-repl
julia> disp(delta())
MF mod 2 (coef to 1000) - 01000000010000000000000001000000000000000000000001...

julia> disp(delta(10^6))
MF mod 2 (coef to 1000000) - 01000000010000000000000001000000000000000000000001...
```
"""
function delta(LENGTH::Int=10^3)::ModularForm
    f = spzeros(Int8, LENGTH)
    indice::Int = 2
    i::Int = 1
    while indice <= f.n
        f[indice] = Int8(1)
        i += 2
        indice = i^2+1
    end
    return f
end

"""
    delta_k(k[, LENGTH])

Create the standard D^k form, with coefficients up to LENGTH
=> as a q-series!

# Example
```julia-repl
julia> disp(delta_k(0))
MF mod 2 (coef to 1000) - 10000000000000000000000000000000000000000000000000...

julia> disp(delta_k(1))
MF mod 2 (coef to 1000) - 01000000010000000000000001000000000000000000000001...

julia> disp(delta_k(2))
MF mod 2 (coef to 1000) - 00100000000000000010000000000000000000000000000000...

julia> disp(delta_k(3))
MF mod 2 (coef to 1000) - 00010000000100000001000000000000000000000001000000...

julia> disp(delta_k(5))
MF mod 2 (coef to 1000) - 00000100000001000000000000000100000001000000010000...
```
"""
function delta_k(k::Int, LENGTH::Int=10^3)::ModularForm
    if k==0
        return one(LENGTH)
    elseif k==1
        return delta(LENGTH)
    elseif k==2
        return sq(delta(LENGTH))
    else
        return delta(LENGTH)^k
    end
end



"""
    Delta(k[, LENGTH])

Create the standard D form, with coefficients up to LENGTH
=> as a D-series!

# Example
```julia-repl
julia> disp(Delta(1))
MF mod 2 (coef to 100) - 01000000000000000000000000000000000000000000000000...
```
"""
function Delta_k(k::Int, LENGTH::Int=10^2)::ModularForm
    df = zero(LENGTH)
    df[k+1]=1
    return df
end

