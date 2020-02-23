import matplotlib.pyplot as plt
import numpy as np

############## DATA ##############
data = []
data2 = []
#numpy
data.append([4.21e-05, 1.6409999999999994e-05, 2.842000000000001e-05, 3.487999999999998e-05, 0.00010524000000000002, 0.0003812799999999999, 0.0035172999999999997, ])
data2.append([1.8300000000000262e-05, 4.6269999999999643e-05, 6.236999999999978e-05, 0.0004431499999999998, 0.0048679299999999995, 0.04936147, 0.16292322, ])

#pure python
data.append([4.76e-06, 8.88e-06, 2.5949999999999997e-05, 0.00015628000000000001, 0.00135089, 0.007493820000000001, 0.08998409, ])
data2.append([2.7899999999969617e-06, 5.010000000005288e-06, 2.147000000000121e-05, 0.0002386499999999958, 0.002002819999999994, 0.020906389999999987, 0.27796927, ])

#sparse python
data.append([1.7399999999999999e-06, 4.0300000000000055e-06, 1.0629999999999993e-05, 6.460999999999999e-05, 9.227000000000002e-05, 0.00030269, 0.0009061099999999999, ])
data2.append([2.840000000000134e-06, 6.4000000000001556e-06, 1.5959999999999932e-05, 5.155000000000021e-05, 0.00015738000000000001, 0.00044586, 0.00171169, ])

#dense julia
data.append([1.2e-6, 5.0e-7, 3.99e-7, 6.0e-7, 2.3e-6, 4.8399e-5, 0.000629099, ])
data2.append([1.799e-6, 1.1e-6, 8.99e-7, 2.3e-6, 1.0701e-5, 0.0001734, 0.001807001, ])

#sparse julia
data.append([1.9e-6, 1.199e-6, 1.4e-6, 1.999e-6, 4.1e-6, 7.3e-6, 1.63e-5, ])
data2.append([2.5e-6, 1.799e-6, 4.501e-6, 3.001e-6, 7.8e-6, 2.27e-5, 3.09e-5, ])











############## PLOTS ##############





titles = ["Numpy", "PurePython", "Sparse Python", "Dense Julia", "Sparse Julia"]

x = [10**l for l in range(7)]
for i in range(len(data)):
    plt.plot(x, data[i], label=titles[i])

plt.xscale('log')
plt.yscale('log')
plt.xlabel('Coefficients Computed')
plt.ylabel('Computation Time')
plt.title("$q$-series of $\Delta$")
plt.legend()
plt.show()



for i in range(len(data)):
    plt.plot(x, data2[i], label=titles[i])

plt.xscale('log')
plt.yscale('log')
plt.xlabel('Coefficients Computed')
plt.ylabel('Computation Time')
plt.title("$q$-series of $\Delta^2$")
plt.legend()
plt.show()