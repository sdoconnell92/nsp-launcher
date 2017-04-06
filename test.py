import os

fn = os.path.join(os.path.dirname(__file__), 'program-info')
print(fn)
info_file = open('program-info')
print(info_file.read())