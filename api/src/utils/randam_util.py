import random, string

def createChallengeCode(n):
   return ''.join(random.choices(string.ascii_letters + string.digits, k=n))
