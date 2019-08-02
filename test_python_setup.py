import importlib
CRITIC = 1
OPT = 2

## format : (nom du module, version minimal, CRITIC|OPT)
MODULES = [('matplotlib','1.5',CRITIC), ('sklearn','0.18',CRITIC), ('pygame','1.9',CRITIC), ('numpy','1.11',CRITIC), ('mpl_toolkits.mplot3d','',OPT), ('pydot','1.0',CRITIC)]

def check(mod,ver,critic):
    def _check(num):
        for x,y in num:
            if x>y: return True
            if x<y: return False
        return True
    try:
        tmp = importlib.import_module(mod)
    except:
        print("Module %s not installed, please install it : conda install %s or pip install %s --user" % (mod,mod,mod))
        return False
    if len(ver)==0: return True
    if not _check(zip(tmp.__version__.split("."),ver.split("."))):
        print("(%s) Module %s (%s): version %s required, please update it : conda update %s or pip install -U %s --user" % ("CRITIQUE" if critic ==1 else "OPTION",mod,tmp.__version__,ver,mod,mod))
        return False
    print("Module %s : OK" % (mod,))
    return True

res = [(check(*m),m[2]) for m in MODULES]
rtot,rcrit,ropt = sum([not r[0] for r in res]),sum([not r[0] for r in res if r[1]==CRITIC]),sum([not r[0] for r in res if r[1]==OPT])
if rtot==0:
    print("Required modules : OK!")
if rcrit>0:
    print("Required critical modules : %d need install or update!" %(rcrit,))
if ropt>0:
    print("Required optional modules : %d need install or update!" %(ropt,))
