import math
from miller_rabin import miller_rabin
import numpy as np
def is_prime(x):
    ''' Test whether x is a prime number.'''
    max_factor = int(math.sqrt(x))
    if x == 2 or x == 3:
        return True
    if x % 2 == 0:
        return False
    for a in range(3,max_factor+1, 100):
        if x % a == 0:
            return False
    return True

def get_next_prime(x):
    ''' Find the smallest prime number which is greater than x.'''

    if x % 2 == 0:
        x = x + 1
    else:
        x = x + 2
    while not is_prime(x):
        x = x + 2

    return x
