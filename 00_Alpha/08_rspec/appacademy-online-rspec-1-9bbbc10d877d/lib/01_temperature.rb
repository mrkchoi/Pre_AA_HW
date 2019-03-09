
def ftoc(f)
    # 0c == 32f
    # 1f == 5/9c
    eq1 = (f - 32).to_f
    eq2 = 5/9.to_f
    eq1 * eq2
end

def ctof(c)
    # ((9/5) * c) + 32
    eq1 = 9/5.to_f * c
    eq2 = 32

    eq1 + eq2
end