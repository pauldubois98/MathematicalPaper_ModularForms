module ModularFormsModuloTwo
    """
    A standard module for computations on modular forms modulo two.
    """

    using SparseArrays: SparseVector, spzeros, dropzeros!, sparse
    import Base: +, *, ^

    """
    We can represent a modular forms mod 2 by it's coefficients as a polynomial in q or D.
    The routines in this file are made for q-series.
    Modular forms modulo 2 have coefficients in q-series being 0 most of the times, and 1 otherwise.
    Thus, we will represent them as sparse 1-dimensional arrays (sparse vectors) of type SparseVector{Int8,Int}.
    """
    ModularForm = SparseVector{Int8,Int}
    ModularFormOrNothing = Union{ModularForm, Nothing}
    ModularFormList = Array{SparseVector{Int8,Int}, 1}
    """
    Lists of Modular Forms will be useful for storage.
    """
    ModularFormOrNothingList = Array{ModularFormOrNothing, 1}


    """
    disp(f[, maxi])

    Display details of f, a modular forms mod 2.

    Displays what type of data the object id,  up to which coefficient is the form known.
    Then displays the first few coefficients. Coefficients are displayed until maxi (50 by default).

    # Example
    ```julia-repl
    [f is a modular form mod 2]
    julia> disp(f)
    MF mod 2 (coef to 100) - 01000000010000000000000001000000000000000000000001...
    ```
    """
    function disp(f::ModularForm, maxi::Int = 50)
        print("MF mod 2 (coef to " * string(f.n) * ") - ")
        for i = 1:min(maxi, f.n)
            print(f[i])
        end
        if maxi<f.n
            println("...")
        else
            println()
        end
    end

    function brackets(k::Int, brackets_level::Int=1)::String
        if brackets_level==0 # never put brackets
            return string(k)
        elseif brackets_level==1 # put brackets if more than one digit
            if k>9
                return "{"*string(k)*"}"
            else
                return string(k)
            end
        else # always put brackets
            return "{"*string(k)*"}"
        end
    end

    
    function delta_repr(f::ModularFormOrNothing, Delta_symbol::String="\\Delta", brackets_level::Int=1, math_mode::Bool=true)::String
        if f===nothing
            return "error"
        end
        if length(f.nzind)==0
            return "0"
        else
            k = f.nzind[1]
            s = Delta_symbol*"^"*brackets(k-1, brackets_level)
            for k in f.nzind[2:end]
                s *= " + "*Delta_symbol*"^"*brackets(k-1, brackets_level)
            end
            if math_mode
                return "\$"*s*"\$"
            else
                return s
            end
        end
    end


    include("arithmetic.jl")
    include("equality.jl")
    include("generators.jl")
    include("HeckeOperator.jl")
    include("data/storage_text.jl")
    include("data/storage.jl")
    include("recognizer.jl")





end