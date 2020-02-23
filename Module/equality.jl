"""
Routines to check equality of modular forms modulo two up to known coefficients.
Also defines useful truncations methods.
"""





### TRUNCATION of modular forms modulo 2
"""
    truncate(f, LENGTH)

Truncate f to the LENGTH first coefficients with no error.

# Example
```julia-repl
[f is a modular form mod 2]
julia> f
1000-element SparseVector{Int8,Int64} with 16 stored entries:
  [...]

julia> truncate(f, 100)
100-element SparseVector{Int8,Int64} with 5 stored entries:
  [...]
```
"""
function truncate(f::ModularForm, LENGTH::Int=10^3)::ModularForm
    if f.n>LENGTH
        return f[1:LENGTH]
    else
        return f
    end
end

"""
    truncate(f1, f2[, LENGTH])

Truncate f1 and f2 to LENGTH first coefficients with no error.
Truncate to min length of f1 & f2 if LENGTH = -1.

# Example
```julia-repl
[f1 & f2 are modular forms mod 2]
julia> disp(f1)
MF mod 2 (coef to 1000) - 01000000010000000000000001000000000000000000000001...
julia> disp(f2)
MF mod 2 (coef to 100) - 01000000010000000000000001000000000000000000000001...

julia> f1, f2 = truncate(f1,f2)

julia> disp(f1)
MF mod 2 (coef to 100) - 01000000010000000000000001000000000000000000000001...
julia> disp(f2)
MF mod 2 (coef to 100) - 01000000010000000000000001000000000000000000000001...
```
"""
function truncate(f1::ModularForm, f2::ModularForm, LENGTH::Int=-1)::Tuple{ModularForm,ModularForm}
    if LENGTH == -1
        if f1.n>f2.n
            return (f1[1:f2.n], f2)
        elseif f1.n==f2.n
            return (f1, f2)
        else
            return (f1, f2[1:f1.n])
        end
    else
        n=min(LENGTH, f1.n, f2.n)
        return (f1[1:n], f2[1:n])
    end
end



### EQUALITY up to size
"""
    eq(f1, f2)

Up to maximum coefficient known for both f1 and f2, tell equality.
"""
function eq(f1::ModularForm, f2::ModularForm)::Bool
    f1, f2 = truncate(f1, f2)
    return f1==f2
end
