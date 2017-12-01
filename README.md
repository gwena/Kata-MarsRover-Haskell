# Mars-Rover Kata in Haskell
To keep it simple and be more easily scrutinized:
* all the files are in the root folder (as only 4 Haskell files)
* no tool such as Stack was used to create a project structure (as by default Stack will create 19 files to start with)

## Dependencies
* Parser: parsec, parsec-numbers
* Test: hspec

## Assumptions
* Input can contain errors, in that case an error message will be displayed
* Rover cannot go outside the plateau (upper right and bottom left limits)
* Rover will skip instruction(s) to move forward if reaching the limit of the plateau, and will process next instruction
* Rovers can be at the same location 
