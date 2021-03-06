function VimBuild(cmd)
    let curdir = getcwd()

    while !filereadable(".vimbuild") && getcwd() != "/"
        cd ..
    endwhile

    if filereadable(".vimbuild")
        execute ":!./.vimbuild " . a:cmd
    endif

    execute "cd " . curdir
endfunction

function LocalVimrc()
	let curdir = getcwd()

	while !filereadable(".vimrc") && getcwd() != "/"
		cd ..
	endwhile

	if filereadable(".vimrc")
		so .vimrc
	endif

	execute "cd " . curdir
endfunction

nnoremap zxc :call VimBuild("clean")
nnoremap zxq :call VimBuild("cleanall")
nnoremap zxb :call VimBuild("build")
nnoremap zxr :call VimBuild("run")
nnoremap zxd :call VimBuild("debug")
nnoremap zxs :call VimBuild("size")
nnoremap zxt :call VimBuild("test")
nnoremap zxf :call VimBuild("flash")
nnoremap zxw :call VimBuild("configure")
nnoremap zxC :call VimBuild("ctags")
nnoremap zcc :!gcc -O0 -Wall -std=c11 % -o /tmp/vimcc && /tmp/vimcc

set autoindent
set tabstop=8
set shiftwidth=8
set noexpandtab
set number
set tags=./tags;/
set nohlsearch

call LocalVimrc()
