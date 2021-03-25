if false
  greeting = "hello world"
end

greeting

# If statements do not create a new scope (or block).
# Because of this, even though the statement is not executed, greeting still counts as having been assigned nil.
