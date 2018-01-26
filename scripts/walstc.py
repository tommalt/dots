#!/usr/bin/env python3
import re
import sys
import os
def iscolorname(pattern, line):
    words = filter(None,pattern.findall(line))
    char = False
    colorname = False
    for w in words:
        if w=='char':
            char=True
        elif w=='colorname':
            colorname=True
    iseq = (line.find('=') != -1)
    return char and colorname and iseq
def isvardecl(pattern, line, names, types):
    words = filter(None,pattern.findall(line))
    tfound = set()
    nfound = set()
    for w in words:
        if w in types:
            tfound.add(w)
        if w in names:
            nfound.add(w)
    semi = line.find(';') != -1
    return (all((t in tfound for t in types)) and
            any((n in nfound for n in names)) and semi)
def main():
    argc = len(sys.argv);
    if argc < 3:
        print("Usage: {} config.h cache-file".format(sys.argv[0]))
        sys.exit(1)
    fname = sys.argv[1]
    include = '#include "{}"'.format(os.path.abspath(sys.argv[2]))
    state = 0 #0=out, 1 = in
    found = False
    pattern = re.compile("\w+");
    cnames = ['defaultbg','defaultfg','defaultcs','defaultrcs',
            'mousefg','mousebg'] #exclude these
    ctypes = ['unsigned','int']
    with open(fname, "r") as f:
        for line in f:
            line_s=line.strip()
            if not found and state == 0 and iscolorname(pattern,line_s):
                #print("{} IS COLORNAME".format(line))
                state = 1
                found  = True
                print(include)
            elif state == 1:
                if line_s.find('};') != -1:
                    state = 0
            else:
                for name in cnames:
                    if not isvardecl(pattern,line_s,cnames,ctypes):
                        print(line, end='')
                        break;
                    #else:
                        #print("{} is a vardecl".format(line))
main()
