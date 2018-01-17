# Mars-Rover Kata in Haskell
## Structure
* Folder structure was kept to a basic one (just src and test)
* No tool, such as Stack, was used to create a project structure (by default Stack will create 19 files to start with)

## Dependencies
* Parser: parsec, parsec-numbers
* Test: hspec

## Assumptions
* Input can contain errors, in that case an error message will be displayed
* Rover cannot go outside the plateau (upper right and bottom left limits)
* Rover will skip instruction(s) to move forward if reaching the limit of the plateau, and will process next instruction
* Rovers can be at the same location 
