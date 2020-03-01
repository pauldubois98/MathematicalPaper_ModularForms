m = 0
f = x^3 + m*x^2 + (m-3)*x - 1
K = NumberField(f, 'a')

print("Defining polynomial:")
print(f)
print("Discriminant:")
print(K.discriminant())
print("Extension Degree:")
print(K.degree())
print("Galois extension:")
print(K.is_galois())
print("Basis:")
print(K.maximal_order().basis())

