# -*- coding: utf-8 -*-
"""
Created on Wed Jan 15 12:14:53 2025

@author: natha
"""
# fitting data resource https://education.molssi.org/python-data-analysis/03-data-fitting/index.html

# set wd (in spyder)

# import pacakges
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
import pandas as pd
import scipy.integrate as integrate
import scipy.special as sc
from scipy.integrate import quad

# import data
df = pd.read_excel("Kristensen_2015.xlsx", sheet_name = "important data")

depth = np.array(df["Depth (cm)"][1:10])
mg_age = np.array(df["Multi-grain age (ka)"][1:10])
sg_CAMUL = np.array(df["Single grain CAMUL (ka)"][1:10])
sg_IEU = np.array(df["Single grain IEU (ka)"][1:10])
sg_FMM = np.array(df["Single grain FMM (ka)"][1:10])

# plot data
plt.clf()

## define the function to fit (Roman-Sanchez et al., 2019)
# function for mixing
def 1func(z, b, p, D, T):
    y = - z**2 / D * (np.exp(-z / b) * (z / b - (b + p) / b) + (b + p) / b) + T * 0

sc.exp1(z, out = E1)

# function for just mixing with erosion
def func(z, b, p, D, T):
    E = ??
    y = (z - p) / T + (b / T) * np.exp((T * b / D) * np.exp(z / b)) * ((E * ((T * b / D) * np.exp(z / b)) - E * (T * b / D)) + (p / b) * np.exp(- T * b / D)) 
    return y


parameters, covariance = curve_fit(func, depth, sg_IEU)


# Fit the function to the data. outputs esimated parameters and covarince objects
plt.clf()
for i in [mg_age, sg_CAMUL, sg_IEU, sg_FMM]:
    try:
        parameters, covariance = curve_fit(func, depth, i)
        # print show the parameters, in order of the function inputs
        fit_b = parameters[0]
        fit_p = parameters[1]
        fit_D = parameters[2]
        # caclualte y values with function
        fit_y = func(depth, fit_b, fit_p, fit_D)
        # Plot the data and the fitted function    
        plt.plot(fit_y, -depth, '-', label=i)
        # report covarance of variables
        SE = np.sqrt(np.diag(covariance)) # take square root of the diagonal elements of the matrix
        SE_b = SE[0]
        SE_p = SE[1]
        SE_D = SE[2]
        print(F'The value of b is {fit_b:.5f} with standard error of {SE_b:.5f}.')
        print(F'The value of p is {fit_p:.5f} with standard error of {SE_p:.5f}.')
        print(F'The value of D is {fit_D:.5f} with standard error of {SE_D:.5f}.')
    except:
        pass

plt.plot(mg_age, -depth, 'o', label='mg_age')
plt.plot(sg_CAMUL, -depth, 'o', label='sg_CAMUL')
plt.plot(sg_IEU, -depth, 'o', label='sg_IEU')
plt.plot(sg_FMM, -depth, 'o', label='sg_FMM')
plt.xlabel('Age since exposure to surface (ka)')
plt.ylabel('Depth (m)')
plt.legend()
plt.show()
