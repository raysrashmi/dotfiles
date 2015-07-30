# copy a string to the clipboard
def pbcopy(string)
  `echo "#{string}" | pbcopy`
  string
end