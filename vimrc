function VimBuild(cmd)
    let curdir = getcwd()

    while !filereadable("vimbuild.sh") && getcwd() != "/"
        cd ..
    endwhile

    if filereadable("vimbuild.sh")
        execute ":!./vimbuild.sh " . a:cmd
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

set autoindent
set tabstop=8
set shiftwidth=8
set noexpandtab
set number
set tags=./tags;/

call LocalVimrc()
