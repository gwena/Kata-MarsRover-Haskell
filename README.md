# Mars-Rover Kata in Haskell
To keep it simple in order to be more easily scrutinized:
* all the files are at the root (as only 4 Haskell files)
* no tool such as Stack was used to create a project structure (as by default Stack will create 19 files to start with)

## Dependencies
* Parser: parsec, parsec-numbers
* Test: hspec

## Assumptions
* Input can contain error, and error message should be displayed in that case
* Rover cannot go outside the plateau (upper right, bottom left)
* Rover will skip instruction(s) to move forward if reaching the limit of the platea
* Rovers can be at the same location
