https://github.com/input-output-hk/haskell-course/blob/main/lessons/14-Cabal_and_language_extensions.ipynb

To run the cabal steps:-
1 cabal update
2 cabal init  --this will create the .cabale file which contain all the configurations,creates app also.
3 cabal build  -- this will build the app that is compilation
4 cabal exec <name of project> (name can find in .cabal file) --this command will show the output.
5 cabal run -- this command is used for both build and exec.  but when we do 'cabal run' it will build and reviel links than giive output.
