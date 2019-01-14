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
nnoremap zxb :call VimBuild("build")
nnoremap zxr :call VimBuild("run")
nnoremap zxd :call VimBuild("debug")
nnoremap zxs :call VimBuild("size")
nnoremap zcc :!gcc -O0 -Wall -std=c11 % -o /tmp/vimcc && /tmp/vimcc \r
nnoremap qq :wq!

set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set number
set tags=./tags;/

call LocalVimrc()
