echohl "hi"
 for f in split(glob('~/.config/nvim/*.vim'), '\n')
 	echohl f
   exe 'source' f
endfor
