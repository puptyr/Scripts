#!/usr/bin/env python
#####################################################################
#       AUTHOR:  Sander <sander@thisonewasavailable.com>
#      VERSION:  0.1
#      CREATED:  2018-05-10
#####################################################################

import string
import random
#def id_generator(size=10, chars=string.ascii_lowercase + string.digits):
def id_generator(size=10, chars=string.ascii_lowercase):
    return ''.join(random.choice(chars) for _ in range(size))

print id_generator()
